+++
Categories = ["Progamming"]
Tags = ["IDE", "IDEA", "IntelliJ"]
date = "2014-05-06T01:01:01-07:00"
title = "IntelliJ IDEA Optimizations"
disqusIdentifier = "197 http://www.richardsumilang.com/blog/?p=197"
aliases = ["/blog/2014/05/06/intellij-idea-13-optimizations"]

+++

Please post a comment if you have any additional tips to making IDEA faster.

1) The first thing you want to do is disable all the plugins you are not using.
Go to *Preferences& -&gt; *Plugins* and un-check as many as possible. I
unchecked about 80%.

2) Give yourself more memory. I figure if Firefox allows itself to take a gig of
my ram then I should treat my IDE a little better. So, I gave it two. Find your
`idea.vmpoptions` file (on Mac you can "right" click the IntelliJ IDEA app icon,
click `Show Package Contents` and look in the `bin` folder.) and tweak start-up
settings like this:

<pre><code class="language-ini" title="idea.vmoptions" >-Xms512m
-Xmx2048m
-XX:MaxPermSize=512m
-XX:ReservedCodeCacheSize=256m
-XX:+UseCompressedOops
-DlocalHistory.daysToKeep=1</code></pre> 

2.1) You might notice the last setting on there is a local history setting. I do
a pretty good job at committing anything useful to my version control system, so
I keep that at a minimum. Part of me wants to completely remove the local
history feature but it doesn't cost me much to keep it around so I keep it at
just a day. You can change that or remove the setting to keep the default.
