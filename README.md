For a hack-session at [my current employer](https://nerds.company) we thought it would be fun to see how quickly/easily we could get a version of the [KunstMaan CMS](https://bundles.kunstmaan.be/) deployed on [Heroku](heroku.com).

This was in part to evaluate the CMS, but also to familiarize people with Heroku. In order to reproduce the process, I settled for creating a bash script and updating it with each new step I went through.

How hard could it be, right? Turns out that things weren't as simple as one might think.

The CMS does try to make it as easy as possible to get up and running. It offers a clean setup that can be gotten by running the [`composer create-project` command](https://getcomposer.org/doc/03-cli.md#create-project).

From there, a few steps are needed to be made to get things in order to run on Heroku:

- A [Procfile](https://devcenter.heroku.com/articles/procfile) needs to be created to tell Heroku which HTTP server to run on the [web dyno](https://devcenter.heroku.com/articles/dynos#types-of-dynos) (and which directory to serve documents from).
- The log setting needs to be changed to send the output to the Heroku log (instead of log to file).
- The `SYMFONY_ENV` variable needs to be added to the Heroku environment
- APC and `mbstring` needs to be added as a dependency in the `composer.json` so Heroku will load them.

Creating an app on Heroku and adding a database was trivial.

The first hurdle, though Heroku provides an URL for a database (through an environmental variable), was that the Symfony framework wants to be fed each piece of that connection string (user, password, host, name) individually.
It doesn't take much work to get this in order, but it is a bit of a shame that Symfony is not smart enough to simply accept a connection URL.

Some digging around brought to light that there _is_ a way of setting _just_ the URL, so this might be worth looking into at a later date.

To get things up and running, some commands had to be run locally against the remote database.

The next thing was that all sorts of front-end assets need to be generated. It doesn't do to generate these on Heroku but generating these locally and committing them to the repository is also a no-go.

As this will require more looking into how both Heroku and Symfony work, this will also have to wait until a later date.
