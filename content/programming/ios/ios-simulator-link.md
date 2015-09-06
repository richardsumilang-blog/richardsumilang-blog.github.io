+++
Categories = ["Programming"]
Tags = ["iOS", "iPad", "iPhone", "Simulator"]
date = "2014-05-14T17:22:00-08:00"
title = "iOS Simulator Link"
disqusIdentifier = "241 http://www.richardsumilang.com/blog/?p=241"
aliases = ["/blog/2014/05/14/ios-simulator-link"]

+++

The iOS Simulator is obviously a must have tool for development. Web development
is no exception but Apple makes you jump through a few hoops (Xcode) to get to
it. Luckily you can run it as a standalone application.

<!--more-->

Copy this command on your terminal to create a symbolic link to it:

<pre><code class="language-bash" title="Symbolic Link to iOS Simulator" >ln -s /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app /Applications/iPhone\ Simulator.app</code></pre>

It starts off ridiculously big but you can shrink it down by going to *Window*
-&gt; *Scale* -&gt; *50%*.

<img src="/images/ios/simulator-retina-4in.png" alt="iOS Simulator Retina 4inch" class="center" />
