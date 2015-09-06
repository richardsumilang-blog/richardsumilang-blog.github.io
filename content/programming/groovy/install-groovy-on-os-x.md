+++
Categories = ["Programming"]
Tags = ["Groovy", "Java", "OS X"]
date = "2014-04-15T13:09:00-08:00"
title = "How to install Groovy on OS X"
disqusIdentifier = "171 http://www.richardsumilang.com/blog/?p=171"
aliases = ["/blog/2014/04/15/how-to-install-groovy-on-os-x"]

+++

[1]: http://groovy.codehaus.org/ "Groovy"
[2]: http://brew.sh/ "Homebrew"
[3]: http://groovy.codehaus.org/Quick+Start "Groovy Quickstart"

Setup [Groovy][1] with OS X 10.9.2 Mavericks using [brew][2].

<!--more-->

<pre><code class="language-bash" title="Install">brew install groovy
echo "export GROOVY_HOME=/usr/local/opt/groovy/libexec" | tee -a ~/.bash_profile; source ~/.bash_profile</code></pre>

Here is a little test script taken from [Groovy's quickstart guide][3].

<pre><code class="language-groovy" title="hello.groovy">//hello.groovy
println "hello, world"
for (arg in this.args ) {
    println "Argument:" + arg;
}
// this is a comment
/* a block comment, commenting out an alternative to above:
this.args.each{ arg -&gt; println "hello, ${arg}"}
*/</code></pre>

Save that has `hello.groovy` and run it with the following command:

<pre><code class="language-bash" title="Testing script">groovy hello.groovy MyName yourName HisName</code></pre>

You should have the following apps installed:

- `groovy`
- `groovyConsole`
- `groovyc`
- `groovydoc`
- `groovysh`
