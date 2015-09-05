+++
Categories = ["Networking"]
Tags = ["Mac", "Networking", "SMB", "Windows"]
date = "2014-05-30T01:01:01-07:00"
title = "Converting Windows Network Path for Mac"
disqusIdentifier = "258 http://www.richardsumilang.com/blog/?p=258"
aliases = ["/blog/2014/05/30/converting-windows-network-path-for-mac"]

+++

If you're given a Windows network path such as `\\Foo\Bar` then that basically
means connect to shared folder `Bar` on the server `Foo`. To do this, you can go
`Finder` -&gt; `Go` -&gt; `Connect to Server...` and type `smb://Foo/Bar` which
is the equivalent.