For a hack-session at [my current employer](https://nerds.company) we thought it would be fun to see how quickly/easily we could get a version of the [KunstMaan CMS](https://bundles.kunstmaan.be/) deployed on [Heroku](heroku.com).

This was in part to evaluate the CMS, but also to familiarize people with Heroku. In order to reproduce the process, I settled for creating a bash script and updating it with each new step I went through.

How hard could it be, right? Turns out that things weren't as simple as one might think.

The CMS does try to make it as easy as possible to get up and running. It offers a clean setup that can be gotten by running the [`composer create-project` command](https://getcomposer.org/doc/03-cli.md#create-project).

From there, a few steps are needed to be made to get things in order to run on Heroku:

- A [Procfile](https://devcenter.heroku.com/articles/procfile) needs to be created to tell Heroku which HTTP server to run on the [web dyno](https://devcenter.heroku.com/articles/dynos#types-of-dynos) (and which directory to serve documents from).
- The log setting needs to be changed to send the output to the Heroku log (instead of log to file).
- The `SYMFONY_ENV` variable needs to be added to the Heroku environment
- APC needs to be added as a dependency in the `composer.json` so Heroku will load it.

Creating an app on Heroku and adding a database was trival.

The first hurdles is that, though Heroku provides an URL for a database (through an environmental variable), the Symfony framework wants to be fed each piece of that connection string (user, password, host, name) individually.
It doesn't take much work to get this in order, but it is a bit of a shame that Symfony is not smart enough to simply accept a connection URL.

The next thing was that, although the DB was accesible and could be reached from a test file (see [db-dns-check.php](./db-dns-check.php)) it could not be reached by the Symfony application.

The (Heroku Manual page about Symfony](https://devcenter.heroku.com/articles/getting-started-with-symfony2#downgrading-to-doctrine-dbal-2-4) mentions a [bug in the Doctrine DBAL code](http://www.doctrine-project.org/jira/browse/DBAL-1057). The suggestion in the manual is to downgrade to a lower package. Due to dependencies of Kunstmaan, this is not an option.

There seems to be [a work-around](https://github.com/doctrine/DoctrineBundle/issues/351#issuecomment-65771528) by setting the `server_version` in the Symfony config. This, however, did not do the trick.

The DBAL MySql driver class keeps throwing an error stating 
> `SQLSTATE[HY000] [2002] php_network_getaddresses: getaddrinfo failed: Name or service not known`
