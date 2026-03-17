#!/bin/sh

# This script sets up the Pryv website build environment

# working dir fix
scriptsFolder=$(cd $(dirname "$0"); pwd)
cd $scriptsFolder/..

# check for well known prereqs that might be missing
hash git 2>&- || { echo >&2 "I require git."; exit 1; }

if [ ! -d dist/.git ]
then
  echo "
Setting up 'dist' folder for publishing to GitHub pages...
"
  rm -rf dist
  git clone -b gh-pages git@github.com:pryv/www.git dist
fi

echo "


If no errors were listed above, the setup is complete.
See the README for more info on writing and publishing.
"
