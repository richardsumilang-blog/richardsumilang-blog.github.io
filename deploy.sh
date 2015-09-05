#!/bin/bash
##################################################
# Deploy script for RichardSumilang.com
# Author: Richard Sumilang
# Email: me@richardsumilang.com
##################################################

# Settings
buildDirectory="build"
sourceBranch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
deployBranch="master"
deployRepo="git@github.com:richardsumilang-blog/richardsumilang-blog.github.io.git"
tempBranch="deploy_$(date +%s)"

# Starting
echo -e "Deploying updates to Github..."

# Switch to tempBranch branch
git checkout -b $tempBranch

# Build the project
hugo -d $buildDirectory
#cp CNAME public/CNAME
#git add public/CNAME
#git commit -a -m "adding CNAME"

# Add new files to git
git add -A

# Commit changes
msg="Deploying site `date`."
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Delete deploy branch on remote
git push origin --delete $deployBranch

# Push build to deploy branch
git subtree push  --prefix=$buildDirectory $deployRepo $deployBranch

# Switch back to original branch
git checkout $sourceBranch

# Delete temp branch
git branch -D $tempBranch
