+++
Categories = ["Programming"]
Tags = ["OS X", "Jython"]
date = "2014-04-08T17:58:00-08:00"
title = "How to install Jython on OS X"
disqusIdentifier = "139 http://www.richardsumilang.com/blog/?p=139"
aliases = ["/blog/2014/04/08/how-to-install-jython-on-os-x"]

+++

[1]: https://jython.org/ "Jython"
[2]: https://brew.sh/ "Homebrew"
[3]: https://oreilly.com/catalog/jythoness/chapter/ch01.html "Jython Book"

Setup [Jython][1] with OS X 10.9.2 Mavericks using [brew][2].

<pre><code class="language-bash" title="Install">brew install jython</code></pre>

<!--more-->

You can end this tutorial now if you can run `jython` without an error. If
you're getting the `$JYTHON_HOME` error then just run this command once:

<pre><code class="language-bash" title="$JYTHON_HOME">echo "export JYTHON_HOME=/usr/local/Cellar/jython/2.5.3/libexec" | tee -a ~/.bash_profile; source ~/.bash_profile</code></pre>

Walla! Now you can enjoy the power of Java from Jython! Knock your socks off
with this [tutorial from O'reilly][3].
