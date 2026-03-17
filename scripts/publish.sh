#!/bin/sh

# Publish the Pryv website to GitHub Pages

set -e

# working dir fix
scriptsFolder=$(cd $(dirname "$0"); pwd)
cd $scriptsFolder/..

# 1. Check we are on master branch
branch=$(git rev-parse --abbrev-ref HEAD)
if [ "$branch" != "master" ]; then
  echo "ERROR: Not on master branch (currently on '$branch'). Switch to master first."
  exit 1
fi

# 2. Check everything is committed
if [ -n "$(git status --porcelain)" ]; then
  echo "ERROR: Uncommitted changes detected. Commit or stash them first."
  git status --short
  exit 1
fi

# 3. Check dist/.git exists
if [ ! -d dist/.git ]; then
  echo "ERROR: dist/ is not set up. Run ./scripts/setup.sh first."
  exit 1
fi

# 4. Build
echo "Building site..."
hugo
if [ $? -ne 0 ]; then
  echo "ERROR: Hugo build failed."
  exit 1
fi

echo "Build successful."

# 5. Publish
cd dist
git add -A
if [ -z "$(git status --porcelain)" ]; then
  echo "Nothing to publish — dist/ is up to date."
  exit 0
fi

commit_msg="Publish $(date '+%Y-%m-%d %H:%M')"
git commit -m "$commit_msg"
git push origin gh-pages

echo ""
echo "Published successfully."
