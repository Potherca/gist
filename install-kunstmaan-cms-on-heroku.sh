#!/usr/bin/env bash

set -o nounset # exit on use of an uninitialised variable, same as -u
set -o errexit # exit on all and any errors, same as -e

readonly g_sVendor=$(echo "$USER" | tr '[:upper:]' '[:lower:]')
readonly g_sProject="${g_sVendor}-kunstmaan"
readonly g_sSource='kunstmaan/bundles-standard-edition'
readonly sPhpMemoryLimit='2048M'

# ==============================================================================
function printTopic() {
# ------------------------------------------------------------------------------
    echo
    echo "=====> $*"
}
# ==============================================================================


# ==============================================================================
function printStatus() {
# ------------------------------------------------------------------------------
    echo "-----> $*"
}
# ==============================================================================


# ==============================================================================
function setSymfonyDatabaseVariablesFromUrl() {
# ------------------------------------------------------------------------------
    local aParts
    local sCredentials
    local sHost
    local sPass
    local sUrl
    local sName
    local sUser

    sUrl="$1"

    sUrl=${sUrl#*'://'}  # will drop begin of string upto first occur of `SubStr`
    sUrl=${sUrl%'?'*}    # will drop part of string from last occur of `SubStr` to the end

    aParts=(${sUrl//@/ })

    sCredentials=${aParts[0]}
    aParts=(${aParts[1]//\// })

    sHost=${aParts[0]}
    # @FIXME: Check $sHost for ':' and split into sHost/sPort
    sName=${aParts[1]}

    aParts=(${sCredentials//:/ })

    sUser=${aParts[0]}
    sPass=${aParts[1]}

    # @TODO: Set PORT if present
    heroku config:set \
        SYMFONY__DATABASE__USER="${sUser}" \
        SYMFONY__DATABASE__PASSWORD="${sPass}" \
        SYMFONY__DATABASE__HOST="${sHost}" \
        SYMFONY__DATABASE__NAME="${sName}"
    }
# ==============================================================================


# ==============================================================================
function validateHerokuSetup() {
# ------------------------------------------------------------------------------
    printTopic 'Validating Heroku Setup'

    $(command -v "heroku" >/dev/null 2>&1) &&  printStatus 'Heroku toolbelt is installed' || (open 'https://toolbelt.heroku.com/' && exit)

    #echo -e '\nDo you need to sign up for an Heroku account? (y/n) '
    #read -s -n 1 -p '' sReply
    #
    #if [ "${sReply}" == "y" ] ; then
    #     open 'https://signup.heroku.com/php' && exit
    #else
        printStatus 'Validating Heroku Credentials'
        heroku auth:whoami || heroku login
    #fi
}
# ==============================================================================


# ==============================================================================
function createProject() {
# ------------------------------------------------------------------------------
    printTopic "Creating Project ${g_sProject}"

    if [ -f './composer.phar' ];then
        printStatus 'Composer PHAR file available'
    else
        printStatus 'Fetching Composer PHAR file...'
        curl -sS https://getcomposer.org/installer | php
    fi

    printStatus "Installing ${g_sSource}. This may take a while..."

    php -d memory_limit="${sPhpMemoryLimit}" composer.phar create-project --no-interaction "${g_sSource}" "${g_sProject}"

}
# ==============================================================================


# ==============================================================================
function commitProject() {
# ------------------------------------------------------------------------------
    printTopic 'Committing Project'

    git init
    git add .
    git commit -m "Clean install of '${g_sSource}'."
}
# ==============================================================================


# ==============================================================================
function addPhpExtensions() {
# ------------------------------------------------------------------------------
    printStatus 'Adding PHP Extensions to Composer'

    # @CHECKMEL Is there a way of add extendsion to composer.json without having to run `composer require` locally?
    php -d memory_limit="${sPhpMemoryLimit}" ../composer.phar require 'ext-apcu' '*'
    php -d memory_limit="${sPhpMemoryLimit}" ../composer.phar require 'ext-mbstring' '*'
#    php -d memory_limit="${sPhpMemoryLimit}" ../composer.phar require 'ext-intl' '*'

    printStatus 'Committing to local repository'
    git add 'composer.*'
    git commit -m 'Adds PHP Extensions as composer dependency.'
}
# ==============================================================================


# ==============================================================================
function createHerokuApp() {
# ------------------------------------------------------------------------------
    printTopic 'Creating Heroku App'
    heroku apps:create "${g_sProject}" --region 'eu'
    heroku config:set SYMFONY_ENV='prod'

    addBuildPacks
    addAddons
    addProcFile
}
# ==============================================================================


# ==============================================================================
function addAddons() {
# ------------------------------------------------------------------------------
    printTopic 'Adding Addons to Heroku'
    # @TODO: PostGreSQL -- heroku addons:create heroku-postgresql:hobby-dev
    # MySQL
    heroku addons:create cleardb:ignite
    # ElasticSearch
    #heroku addons:create searchbox:starter
}
# ==============================================================================


# ==============================================================================
function addBuildPacks() {
# ------------------------------------------------------------------------------
    printTopic 'Adding buildpacks to Heroku'
    heroku buildpacks:set 'https://github.com/heroku/heroku-buildpack-multi'

    printStatus 'Creating buildpack file.'
#    echo 'https://github.com/heroku/heroku-buildpack-ruby' >> '.buildpacks'
    echo 'https://github.com/heroku/heroku-buildpack-nodejs' >> '.buildpacks'
    echo 'https://github.com/heroku/heroku-buildpack-php' >> '.buildpacks'

    printStatus 'Committing to local repository'
    git add '.buildpacks'
    git commit -m "Creates buildpack file for Heroku."

}
# ==============================================================================


# ==============================================================================
function addProcFile() {
# ------------------------------------------------------------------------------
    printTopic 'Adding Procfile for Heroku'
    echo "web: bin/heroku-php-apache2 web/" > Procfile

    printStatus 'Committing to local repository'
    git add 'Procfile'
    git commit -m "Creates Procfile for Heroku."
}
# ==============================================================================


# ==============================================================================
function patchDatabaseConfig() {
# ------------------------------------------------------------------------------
    local sPath

    sPath='app/config/parameters.yml.dist'
    printTopic "Adjusting the database configuration in ${sPath}"

    # the `-i.bak` is a workaround for OSX :-(
    sed -i.bak 's/database_host:              127.0.0.1/database_host:              %database.host%/g' "${sPath}"
    sed -i.bak 's/database_name:              kunstmaanbundles/database_name:              %database.name%/g' "${sPath}"
    sed -i.bak 's/database_password:          ~/database_password:          %database.password%/g' "${sPath}"
    sed -i.bak 's/database_user:              travis/database_user:              %database.user%/g' "${sPath}"
    # @TODO: sed -i.bak 's/database_port:              ~/database_port:              %database.port%/g' "${sPath}"

    rm "${sPath}.bak"

    printStatus 'Committing to local repository'
    git add "${sPath}"
    git commit -m "Adjusts database configuration for Heroku."


    sPath='app/config/parameters.yml'
    printTopic "Adjusting the database configuration in ${sPath}"

    # @TODO: Either get the config once and parse it or "remember" the values from where they were set

    sed -i.bak "s/database_host: 127.0.0.1/database_host: $(heroku config:get SYMFONY__DATABASE__HOST)/g" "${sPath}"
    sed -i.bak "s/database_name: kunstmaanbundles/database_name: $(heroku config:get SYMFONY__DATABASE__NAME)/g" "${sPath}"
    sed -i.bak "s/database_password: null/database_password: $(heroku config:get SYMFONY__DATABASE__PASSWORD)/g" "${sPath}"
    sed -i.bak "s/database_user: travis/database_user: $(heroku config:get SYMFONY__DATABASE__USER)/g" "${sPath}"
    #sed -i.bak "s/database_port: null/database_port: $(heroku config:get SYMFONY__DATABASE__PORT)/g" "${sPath}"
}
# ==============================================================================


# ==============================================================================
function patchLogConfig() {
# ------------------------------------------------------------------------------
    printTopic 'Adjusting the log configuration'

    # the `-i.bak` is a workaround for OSX :-(
    sed -i.bak 's#path:  "%kernel.logs_dir%/%kernel.environment%.log"#path: "php://stderr"#g' 'app/config/config_prod.yml'
    rm 'app/config/config_prod.yml.bak'

    printStatus 'Committing to local repository'
    git add 'app/config/config_prod.yml'
    git commit -m "Adjusts log configuration for Heroku."
}
# ==============================================================================


# ==============================================================================
function deploy() {
# ------------------------------------------------------------------------------
    git push heroku master
}
# ==============================================================================


# ==============================================================================
function createBundle() {
# ------------------------------------------------------------------------------
    local sVendor

    sVendor="$(echo ${g_sVendor:0:1} | tr '[a-z]' '[A-Z]')${g_sVendor:1}"

    printTopic "Generating ${sVendor}\WebsiteBundle"
    app/console kuma:generate:bundle --no-interaction --namespace="${sVendor}\\WebsiteBundle" --dir=src/
    printStatus 'Committing to local repository'
    git add .
    git commit -m "Adds Website Bundle."

    printTopic 'Generating Site'
    app/console kuma:generate:default-site --no-interaction
    #@TODO: Fix broken fixture mapping and generate using the `--demosite` flag
    printStatus 'Committing to local repository'
    git add .
    git commit -m "Adds Site."
}
# ==============================================================================


# ==============================================================================
function openAdminPanel() {
# ------------------------------------------------------------------------------
    local sUrl="$(heroku apps:info | grep -oh 'https://.*')"
    open "${sUrl}en/admin/"
}
# ==============================================================================


# ==============================================================================
function initialiseDatabase() {
# ------------------------------------------------------------------------------
#    app/console doctrine:database:create
    printTopic 'Initialising Database'

    printStatus 'Creating Schema'
    php app/console doctrine:schema:create

    printStatus 'Loading Fixtures'
    # @TODO: Catch output and grep for admin user/password
    php app/console doctrine:fixtures:load --no-interaction
}
# ==============================================================================


# ==============================================================================
function patchComposer() {
# ------------------------------------------------------------------------------
    printTopic 'Adding compile scripts to composer'

    #    heroku run 'npm install -g bower'
    #    heroku run 'npm install -g gulp'
    #    heroku run 'npm install -g uglify-js'
    #    heroku run 'npm install -g uglifycss
    # @TODO: Validate these ara all run:
    #    heroku run 'bundle install'
    #    heroku run 'npm install'
    #    heroku run 'bower install'
    #
    #    heroku run 'gulp build'

    sPath='composer.json'
    sReplacement='"scripts": {\
        "compile": [\
            "app/console assets:install",\
            "php app/console assetic:dump --env=prod --no-debug"\
        ],'

    sed -i.bak "s#\"scripts\": {#${sReplacement}#g" "${sPath}"

    printStatus 'Committing to local repository'
    git add .
    git commit -m "Adds Site."
}
# ==============================================================================


# ==============================================================================
function patchPackageJon() {
# ------------------------------------------------------------------------------
    printTopic 'Patching package.json'

    sPath='package.json'
    sReplacement='"dependencies": {\
        "bower": "*",\
        "gulp": "*",\
        "uglifycss": "*",\
        "uglify-js": "*"\
    },\
    "devDependencies": {'

    sed -i.bak "s#\"devDependencies\": {#${sReplacement}#g" "${sPath}"

    printStatus 'Committing to local repository'
    git add .
    git commit -m "Adds Node dependencies."
}
# ==============================================================================


# ==============================================================================
function run() {
# ------------------------------------------------------------------------------
    validateHerokuSetup
    createProject

    cd "${g_sProject}"

    commitProject

    createHerokuApp

    # @CHECKME: Would using DATABAS_URL work?
    # heroku config:set $(heroku config --shell | grep CLEARDB_DATABASE_URL | sed -e 's/^CLEARDB_//')
    setSymfonyDatabaseVariablesFromUrl "$(heroku config:get CLEARDB_DATABASE_URL)"

    patchLogConfig
    patchDatabaseConfig
    patchComposer
    addPhpExtensions
    patchPackageJon

    createBundle
    initialiseDatabase


    deploy

    openAdminPanel

    heroku logs -t
}
# ==============================================================================

run

#EOF
