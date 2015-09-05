+++
Categories = ["Servers"]
Tags = ["Gearman", "OS X"]
date = "2014-04-23T22:48:00-08:00"
title = "How to install Gearman on OS X"
disqusIdentifier = "177 http://www.richardsumilang.com/blog/?p=177"
aliases = ["/blog/2014/04/23/how-to-install-gearman-on-os-x"]

+++

Setup [Gearman][1] job server with OS X 10.9.2 Mavericks using [brew][2].

<pre><code class="language-bash" title="Install">brew install gearman</code></pre>

If you get an error during the build:

<pre title="Build error">==&gt; make install
#  include &lt;tr1/cinttypes&gt;
           ^
1 error generated.
make[1]: *** [libgearman/libgearman_libgearman_la-check.lo] Error 1
make: *** [install] Error 2
Error: Homebrew doesn’t know what compiler versions ship with your version
of Xcode (5.1.1). Please `brew update` and if that doesn’t help, file
an issue with the output of `brew —config`:
  https://github.com/mxcl/homebrew/issues
[...]</pre>

Then you can run this command to possibly fix it:

<pre><code class="language-bash" title="Testing script">xcode-select —install
brew update
brew install gearman</code></pre>

And lastly some useful install notes copied from the end of the script worth
noting:

### Start gearman at boot time:

<pre><code class="language-bash" title="Start at boot">ln -sfv /usr/local/opt/gearman/*.plist ~/Library/LaunchAgents</code></pre>

### Start gearman now:

<pre><code class="language-bash" title="Start now">launchctl load ~/Library/LaunchAgents/homebrew.mxcl.gearman.plist</code></pre>

### Raw start:

<pre><code class="language-bash" title="Raw start">gearmand -d</code></pre>

[1]: http://gearman.org/ "Gearman"
[2]: http://brew.sh/ "Homebrew"
