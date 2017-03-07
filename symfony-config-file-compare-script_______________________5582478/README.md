When working on a Symfony project, someone else will make a change to a config file or add new functionality that also need to be configured on my local machine for the project to work. 

As I got tired of having to manually figure out what was going on I wrote a shell script to do that for me. 

This script will gather all `.dev` files for a given directory, check whether there is an accompanying file without the `.dev`  extension and output the diff between both.
