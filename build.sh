#!/bin/bash
##################################################
# Build script for RichardSumilang.com
# Author: Richard Sumilang
# Email: me@richardsumilang.com
##################################################
buildDirectory="build"
theme="hugo-theme-richardsumilang-dark"

# Clean directory before building
rm -rf $buildDirectory


# Find theme scripts
export JS_ENTRY="$(find themes/$theme/public/_app -name 'main.*.js' | sed 's/.*\///')"
export CSS_ENTRY="$(find themes/$theme/public/_app -name 'main.*.css' | sed 's/.*\///')"

if [ -z "$JS_ENTRY" ]
then
  echo "JavaScript entry not found. Please build theme first."
  exit
fi

if [ -z "$CSS_ENTRY" ]
then
  echo "CSS entry not found. Please build theme first."
  exit
fi


# Copy app to build directory
mkdir -p $buildDirectory/_app
cp -r themes/$theme/public/_app/* $buildDirectory/_app


# Build the project
hugo -d $buildDirectory
