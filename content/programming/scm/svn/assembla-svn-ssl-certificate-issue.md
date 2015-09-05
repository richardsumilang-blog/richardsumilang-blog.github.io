+++
Categories = ["Programming"]
Tags = ["Assembla", "SVN"]
date = "2014-05-12T15:22:00-08:00"
title = "Assembla SVN SSL Certificate Issue"
disqusIdentifier = "228 http://www.richardsumilang.com/blog/?p=228"
aliases = ["/blog/2014/05/12/svn-certificate-issue"]

+++

I kept getting the following message when I tried running `svn` commands on my
computer. I tried to accept the certificate permanently with no luck:

<pre>Error validating server certificate for 'https://subversion.assembla.com:443':
 - The certificate is not issued by a trusted authority. Use the
   fingerprint to validate the certificate manually!
Certificate information:
 - Hostname: *.assembla.com
 - Valid: from Wed, 16 Apr 2014 13:31:17 GMT until Thu, 24 Mar 2016 19:30:40 GMT
 - Issuer: http://certs.godaddy.com/repository/, GoDaddy.com, Inc., Scottsdale, Arizona, US
 - Fingerprint: ec:9f:9d:b2:39:e1:34:81:7b:27:f6:51:30:8b:ac:41:5b:62:09:19
(R)eject, accept (t)emporarily or accept (p)ermanently?
</pre>

I noticed that the subversion files were owned by the `root` user when
inspecting the files on my computer. I'm not sure how this happened but it can
easily be fixed with the `chown` command.

<pre><code class="language-bash" title="Fix SVN permissions">sudo chown -R $(whoami) ~$(whoami)/.subversion</code></pre>
