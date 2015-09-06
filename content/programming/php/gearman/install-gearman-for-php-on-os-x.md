+++
Categories = ["Programming"]
Tags = ["Gearman", "OS X", "PHP"]
date = "2014-04-23T23:05:00-08:00"
title = "How to install Gearman for PHP on OS X"
disqusIdentifier = "183 http://www.richardsumilang.com/blog/?p=183"
aliases = ["/blog/2014/04/23/how-to-install-gearman-for-php-on-os-x"]

+++

[1]: http://www.php.net/manual/en/book.gearman.php "Gearman PHP"
[2]: http://brew.sh/ "Homebrew"
[3]: http://gearman.info/libgearman/ "libgearman"

Setup [Gearman][1] for PHP with OS X 10.9.2 Mavericks using [brew][2]. This
requires [libgearman][3] and the easiest way to get it is probably to
[install gearman]({{< relref "install-gearman-on-os-x.md" >}}) through brew, of course.

<!--more-->

It might also be worth noting that this works for me with the brew build of PHP.
It will probably work for the distribution that comes with OS X but I haven't
tested.

<pre><code class="language-bash" title="Install">sudo pecl install gearman</code></pre>

Next copy the following contents into `/usr/local/etc/php/5.4/conf.d/ext-gearman.ini`
(or wherever your extension config directory is):

<pre><code class="language-ini" title="Extension configuration">[gearman]
extension="/usr/local/Cellar/php54/5.4.13/lib/php/extensions/no-debug-non-zts-20100525/gearman.so"</code></pre>

Restart apache:

<pre><code class="language-bash">sudo apachectl restart</code></pre>

That's it. Test to make sure it's loaded with `phpinfo`.
