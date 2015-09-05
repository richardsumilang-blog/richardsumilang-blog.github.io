+++
Categories = ["Servers"]
Tags = ["Chef", "Opscode", "Ruby", "Vagrant", "Virtualization"]
date = "2014-06-10T15:50:00-08:00"
title = "Update Chef Solo on your Vagrant"
disqusIdentifier = "290 http://www.richardsumilang.com/blog/?p=290"
aliases = ["/blog/2014/06/10/update-chef-solo-on-your-vagrant"]

+++

Install [vagrant-omnibus][1]:

<pre><code class="language-bash" title="Install vagrant-omnibus">vagrant plugin install vagrant-omnibus</code></pre>

Configure your [Vagrantfile][2] before provisioning to the latest version of
Chef:

<pre><code class="language-ruby" title="Configure Vagrantfile">config.omnibus.chef_version = :latest</code></pre>

You can also upgrade to a specific version like so:

<pre><code class="language-ruby" title="Configure Vagrantfile">config.omnibus.chef_version = "11.12.8"</code></pre>

[1]: https://github.com/schisamo/vagrant-omnibus "Vagrant Omnibus"
[2]: http://docs.vagrantup.com/v2/vagrantfile/index.html "Vagrantfile Doc"
