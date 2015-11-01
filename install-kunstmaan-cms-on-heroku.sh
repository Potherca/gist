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
    sName=${aParts[1]}

    aParts=(${sCredentials//:/ })

    sUser=${aParts[0]}
    sPass=${aParts[1]}

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

    #echo -e '\nDo you need to sign up for an Heroku account? (y/n) ' | indent
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

    php -d memory_limit="${sPhpMemoryLimit}" composer.phar create-project --no-interaction "${g_sSource}" "${g_sProject}" | indent

}
# ==============================================================================


# ==============================================================================
function commitProject() {
# ------------------------------------------------------------------------------
    printTopic 'Committing Project'

    git init | indent
    git add . | indent
    git commit -m "Clean install of '${g_sSource}'." | indent
}
# ==============================================================================


# ==============================================================================
function addApcDependency() {
# ------------------------------------------------------------------------------
    printTopic 'Adding APC to Composer'

    php -d memory_limit="${sPhpMemoryLimit}" ../composer.phar require 'ext-apcu' '*' | indent

    printStatus 'Committing to local repository'
    git add 'composer.*' | indent
    git commit -m 'Adds APC as composer dependency.' | indent
}
# ==============================================================================


# ==============================================================================
function addIntlDependency() {
# ------------------------------------------------------------------------------
    printTopic 'Adding INTL to Composer'

    php -d memory_limit="${sPhpMemoryLimit}" ../composer.phar require 'ext-intl' '*' | indent

    printStatus 'Committing to local repository'
    git add composer.* | indent
    git commit -m 'Adds Intl as composer dependency.' | indent
}
# ==============================================================================

# ==============================================================================
function createHerokuApp() {
# ------------------------------------------------------------------------------
    printTopic 'Creating Heroku App'

    heroku apps:create "${g_sProject}" --region 'eu'
    heroku config:set SYMFONY_ENV='prod'

    printTopic 'Adding Heroku Addons.'
    heroku addons:create cleardb:ignite
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
    printTopic 'Adjusting the database configuration'

    local sPath='app/config/parameters.yml.dist'

    # the `-i.bak` is a workaround for OSX :-(
    sed -i.bak 's/database_host:              127.0.0.1/database_host:              %database.host%"/g' "${sPath}"
    sed -i.bak 's/database_name:              kunstmaanbundles/database_name:              %database.name%"/g' "${sPath}"
    sed -i.bak 's/database_password:          ~/database_password:          %database.password%"/g' "${sPath}"
    sed -i.bak 's/database_user:              travis/database_user:              %database.user%"/g' "${sPath}"

    rm "${sPath}.bak"

    printStatus 'Committing to local repository'
    git add "${sPath}"
    git commit -m "Adjusts database configuration for Heroku."
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
    printStatus 'Creating Symfony Bundle'

    local sVendor

    sVendor="$(echo ${g_sVendor:0:1} | tr '[a-z]' '[A-Z]')${g_sVendor:1}"

    app/console kuma:generate:bundle --no-interaction --namespace="${sVendor}\\WebsiteBundle" --dir=src/
    app/console kuma:generate:default-site

    printStatus 'Committing to local repository'
    git add .
    git commit -m "Adds WebsiteBundle."
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
    heroku run php app/console doctrine:schema:create
    heroku run php app/console doctrine:fixtures:load --no-interaction
}
# ==============================================================================


# ==============================================================================
function installAssets() {
# ------------------------------------------------------------------------------
    heroku run 'npm install -g bower'
    heroku run 'npm install -g gulp'
    heroku run 'npm install -g uglify-js'
    heroku run 'npm install -g uglifycss'

    heroku run 'bundle install'
    heroku run 'npm install'
    heroku run 'bower install'
    heroku run 'gulp build'

    heroku run 'php app/console assets:install --symlink'
    heroku run 'php app/console assetic:dump'
}
# ==============================================================================


# ==============================================================================
function run() {
# ------------------------------------------------------------------------------
    validateHerokuSetup
    createProject

    cd "${g_sProject}"
    commitProject
    addApcDependency
    #addIntlDependency
    addProcFile

    createHerokuApp
    setSymfonyDatabaseVariablesFromUrl "$(heroku config:get CLEARDB_DATABASE_URL)"

    # @TODO: Replace parameters in parameters.yml.dist with %var%
    patchLogConfig
    patchDatabaseConfig

    deploy

    initialiseDatabase

    #openAdminPanel
}
# ==============================================================================

run

#EOF
