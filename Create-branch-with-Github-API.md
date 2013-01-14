On http://hurl.it/ using  HTTP basic AUTH and the inputs below you can 
create a branch on github without having access to a local git repo.

(With "`<SHA-TO-BRANCH-FROM>`" being one of the latest commit in the repo,
 as shown by `https://api.github.com/repos/<AUTHOR>/<REPO>/git/refs/heads`).

===

    URL       : https://api.github.com/repos/<AUTHOR>/<REPO>/git/refs
    
    POST BODY :
    {
      "ref": "refs/heads/new-branch-name",
      "sha": "<SHA-TO-BRANCH-FROM>"
    }