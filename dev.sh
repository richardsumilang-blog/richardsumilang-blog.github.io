#!/bin/bash
# Be sure to start the app in the theme directory first.
#
# Note: Turbolinks does not work with hugo live reload
rm -rf public/*; hugo server -w --ignoreCache=true --disableLiveReload
