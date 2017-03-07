# Add this config
$ heroku config:add LD_LIBRARY_PATH=/app/php/ext:/app/apache/lib

# Login to Heroku CLI
$ heroku run bash

# The second argument here is the path to your script
~ $ ~/php/bin/php -f ~/www/index.php