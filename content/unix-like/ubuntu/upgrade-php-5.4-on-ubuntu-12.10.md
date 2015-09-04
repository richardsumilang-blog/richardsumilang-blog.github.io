+++
Categories = ["Unix-like"]
Tags = ["PHP", "Ubuntu"]
Description = "How to upgrade to PHP 5.4 on Ubuntu 12.10"
date = "2014-03-31T01:01:01-07:00"
title = "How to upgrade to PHP 5.4 on Ubuntu 12.10"
disqusIdentifier = "62 http://www.richardsumilang.com/blog/?p=62"
aliases = ["/blog/2014/03/31/how-to-upgrade-to-php-5-4-on-ubuntu-12-10"]

+++

PHP 5.4 is not in the standard Ubuntu 12.10 repositories. We will use a
backported version of PHP 5.4 by configuring a 3rd party PPA. Open a terminal
and run the following commands:

<pre><code class="language-bash" title="Installation Instructions">sudo apt-get install python-software-properties
sudo add-apt-repository ppa:ondrej/php5-oldstable
sudo apt-get update; sudo apt-get install php5</code></pre>


If you compiled or installed any PHP extensions via `pecl` then you will need to
reinstall those too. Development packages must be upgraded before you run `pecl`
or `phpize`:

<pre><code class="language-bash" title="Development packages">sudo apt-get install php-pear php5-dev</code></pre>

Test if everything is ok by running `phpinfo();` from a PHP script on your
web-server and `php -i` from your terminal.

Enjoy!