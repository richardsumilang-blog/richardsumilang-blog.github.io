#!/usr/bin/env bash
# Created this script to pull down theme because git submodules suck.

# Create themes dir
rm -rf themes

# Clone Repo
git clone git@bitbucket.org:richardsumilang-blog/hugo-theme-richardsumilang-dark.git themes/hugo-theme-richardsumilang-dark
