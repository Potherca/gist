## Lights...

On github, I have [a lot of repositories](https://github.com/potherca/repositories). I wanted to have a clear distinction between original projects and contributions.

Then I had an idea.

Why not move all repositories that are forks to [a separate "contrib" company account](https://github.com/potherca-contrib).?

## Camera...

The [Github transfer process](https://help.github.com/articles/transferring-a-repository/) takes several clicks and two text fields to fill in. For dozens of repositories, this is a lot of tedious work, so I decided to see if I could automate it

## Action!

There does not seem to be a call to transfer ownership in the [Github API](https://developer.github.com/v3/). Or there is and I'm too lazy to find it. So I went another route...

I created [a bookmarklet that does all the work](https://gist.github.com/f4ad083c710acd19026d#file-transfer-github-ownership-js). I opened all the repository pages and clicked the [bookmarklet](https://en.wikipedia.org/wiki/Bookmarklet).

## It's a wrap

I'm sure I could automate things even further. For instance, the pages don't have to be opened by hand. 

For now, this worked well enough for me.
