#!/bin/bash
##################################################
# Deploy script for RichardSumilang.com
# Author: Richard Sumilang
# Email: me@richardsumilang.com
##################################################

# Settings
buildDirectory="build"
deployBranch="master"
distDirectory="dist"
deployRepo="git@github.com:richardsumilang-blog/richardsumilang-blog.github.io.git"

# Starting
echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# This should updated to check if dist already exists and is a github repo,
# then just do a pull
rm -rf $distDirectory

# Clone branch into dist
git clone -b $deployBranch $deployRepo $distDirectory

# Copy build to project
yes | cp -rf $buildDirectory/* $distDirectory/

# Get .nojekyll
yes | cp $buildDirectory/.* $distDirectory/

cd $distDirectory

# Add new files to git
git add -A

# Commit changes
msg="Deploying site `date`."
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"


# Push build to deploy branch
git push origin $deployBranch

cd ..
