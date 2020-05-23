+++
Categories = ["Programming"]
Tags = ["OS X", "Nimrod"]
date = "2014-04-07T11:09:00-08:00"
title = "How to install Nimrod on OS X"
disqusIdentifier = "139 http://www.richardsumilang.com/blog/?p=139"
aliases = ["/blog/2014/04/07/how-to-install-nimrod-on-os-x", "/programming/nimrod/install-nimrod-on-os-x"]

+++

[1]: https://brew.sh/ "Nimrod"
[2]: https://brew.sh/ "Homebrew"
[3]: https://nimrod-lang.org/tut1.html "Nimrod tutorials"

Setup [Nimrod][1] with OS X 10.9.2 Mavericks using [brew][2].

<pre><code class="language-bash" title="Install">brew install nimrod</code></pre>

<!--more-->

That was painless but unfortunately there is a weird issue with getting a
symbolic link to run `nimrod` from `/usr/local/bin`. This can be avoided by
using a simple shell script. Save this as `/usr/local/bin/nimrod`.

<pre><code class="language-bash" title="/usr/local/bin/nimrod">
#!/bin/sh
exec /usr/local/Cellar/nimrod/0.9.2/libexec/bin/nimrod "$@"
</code></pre>

*Note: Be sure to update your nimrod path above to point to the right directory
if different from version 0.9.2.*

Don't forget to make the script executable:

<pre><code class="language-bash" title="/usr/local/bin/nimrod">chmod u+x /usr/local/bin/nimrod</code></pre>

And now let's give this a little test run. Save the following piece of code as
`helloword.nim`:

<pre><code class="language-bash" title="hellworld.nim">echo("Hello world!")</code></pre>

We can try running it now with the following command:

<pre><code class="language-bash" title="Running nimrod code">nimrod compile --run hellworld.nim</code></pre>

If all went well, then you should have a compiled version of `hellworld.nim`
saved as a `helloworld` binary in the same folder. The `--run` argument in the
command obviously runs the program so it should have outputted "Hello world!" at
the end.

Commonly used arguments have abbreviations. You can write the above compile line
like so:

<pre><code class="language-bash" title="Running nimrod code (shorthand)">nimrod c -r hellworld.nim</code></pre>

Now take off with the `nimrod` [tutorials][3]!
