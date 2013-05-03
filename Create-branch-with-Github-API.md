Ever had the need to create a branch in a repo on Github without wanting (or being able) to access a local repo?

With the aid of [the Github API][1] and [hurl.it][2] this is a piece of cake!

Just follow these steps:

1. Open [http://hurl.it/][2]
2. Find the revision you want to branch from. Either on Github itself or by doing a GET request from Hurl: https://api.github.com/repos/<AUTHOR>/<REPO>/git/refs/heads
3. Copy the revision hash
4. Do a POST request from Hurl to https://api.github.com/repos/<AUTHOR>/<REPO>/git/refs with the following as the POST body :

    {
      "ref": "refs/heads/<NEW-BRANCH-NAME>",
      "sha": "<HASH-TO-BRANCH-FROM>"
    }

(obviously replacing the <NEW-BRANCH-NAME> with the name your want the new branch to have and the <HASH-TO-BRANCH-FROM> with, you know, the hash of the revision you want to branch from)

You will need to use HTTP basic and fill in your Github credentials to access the Github API.

Press the Send button and your branch will be created!

---

The situation I ran into, was that I found a web app that had a demo but the demo wasn't hosted anywhere. So all I needed to do was clone the repo, create a branches called `gh-pages` (which automatically creates a site hosted by github) and I could watch the demo online without any local repo.

I've also used this to submit (simple) fixes to repos that require a pull-request from a branch that is not master.

[1]: http://developer.github.com/v3/
[2]: http://hurl.it/