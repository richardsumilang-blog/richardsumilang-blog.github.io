---
Categories:
 - Apps
 - Unix-like
Tags:
 - Apple
 - brew
 - cask
 - Darwin
 - Homebrew
 - OS X
 - Ruby
 - Software
Date: 2014-10-26T16:30:00-07:00
Title: My cask script!
SubTitle: Say goodbye to manual installations
disqusIdentifier: 437 http://www.richardsumilang.com/blog/?p=437
aliases:
 - /blog/2014/10/26/my-cask-script
---

[1]: http://caskroom.io/ "Homebrew cask"
[2]: https://github.com/rsumilang/casks-installer "Casks Installer"

Finally we get our own `apt-get` like tool for Mac! Check out [cask][1] if you
haven't already! Below is my personal script for my setup. Maybe I'll move this
to chef recipe for my mac one day? ;)

<!--more-->

Note: The latest and greatest will be maintained on [GitHub][2].

<pre><code class="language-bash" title="Cask" >#!/bin/sh
# Let's automate installing all our apps!
#
# Note: This will require homebrew and cask!
# See: http://caskroom.io/
#
# Uninstall: Provide the --appdir when removing.
#
# @author Richard Sumilang <me@richardsumilang.com>
INSTALL_CMD="brew cask install --appdir=/Applications"

###########################
# Communication
$INSTALL_CMD colloquy
$INSTALL_CMD propane
#$INSTALL_CMD skype



###########################
# Development
$INSTALL_CMD atom
$INSTALL_CMD charles
$INSTALL_CMD filezilla
$INSTALL_CMD gas-mask
$INSTALL_CMD geektool
$INSTALL_CMD intellij-idea
$INSTALL_CMD robomongo
$INSTALL_CMD sequel-pro
$INSTALL_CMD sourcetree
$INSTALL_CMD vagrant vagrant-bar
$INSTALL_CMD virtualbox



###########################
# Enterprise
#$INSTALL_CMD citrix-receiver



###########################
# Interwebs
$INSTALL_CMD firefox
$INSTALL_CMD google-chrome



###########################
# Media
$INSTALL_CMD mediaelch
$INSTALL_CMD miro-video-converter
$INSTALL_CMD videospec
$INSTALL_CMD vlc



###########################
# Music
$INSTALL_CMD spotify



###########################
# Tools
$INSTALL_CMD dropbox



###########################
# Utilities
$INSTALL_CMD remote-desktop-connection
$INSTALL_CMD unrarx
$INSTALL_CMD transmission
</code></pre>
