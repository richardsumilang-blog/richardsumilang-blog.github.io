+++
Categories = ["Servers"]
Tags = ["OS X", "Redis"]
date = "2014-04-04T10:04:00-08:00"
title = "How to install Redis on OS X"
disqusIdentifier = "126 http://www.richardsumilang.com/blog/?p=126"
aliases = ["/blog/2014/04/04/how-to-install-redis-on-os-x"]

+++

[1]: http://brew.sh/ "Homebrew"

This is my setup of redis with OS X 10.9.2 Mavericks and requires [brew][1].

<pre><code class="language-bash">brew install redis</code></pre>

<!--more-->

### Start redis when computer starts:

<pre><code class="language-bash">ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents</code></pre>


### Start redis:

<pre><code class="language-bash">launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist</code></pre>


### Without using `launchctl:

<pre><code class="language-bash">redis-server /usr/local/etc/redis.conf</code></pre>


### Check is redis is correctly running:

<pre><code class="language-bash">redis-cli ping</code></pre>


This should reply with `PONG` if successful.

## Configuration

The configuration file is located in `/usr/local/etc/redis.conf`.

### Uninstall redis:

<pre><code class="language-bash">brew uninstall redis; rm ~/Library/LaunchAgents/homebrew.mxcl.redis.plist</code></pre>
