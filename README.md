## Lights...

I have [a lot of repositories on github](https://github.com/potherca/repositories) and wanted to have a clear distinction between original projects and contributions.

I decided to move all repositories that are forks to [a separate "contrib" company account](https://github.com/potherca-contrib).

## Camera...

The [Github transfer process](https://help.github.com/articles/transferring-a-repository/) takes several clicks and 2 text fields to be filled in. For dozens of repositories, this is a lot of tedious work, so I decided to see if I could automate it

## Action!

The [Github API](https://developer.github.com/v3/) does not seem to have a call to transfer ownership (or it does and I'm too lazy to find it), so I went another route. 

I created a [bookmarklet](https://en.wikipedia.org/wiki/Bookmarklet) that does all the work. I simply opened all of the repository pages and clicked the bookmarklet.

<kbd>(Transfer Ownership Bookmarklet)[javascript:void%20function(){var%20t=$(%22%23rename_field%22).val(),r=$(%22[itemprop=title]%22).text()+%22-contrib%22;$(%22%23transfer_button%22).trigger(%22click%22),$(%22%23confirm_repository_name%22).val(t),$(%22%23confirm_new_owner%22).val(r),$(%22[action*=transfer]%20button[type=submit]%22).removeAttr(%22disabled%22).trigger(%22click%22)}();]</kbd>

## Finish

I'm sure things could be automated even further (so tha pages would not need to be openen by hand, for instance). But this worked well enough for me.