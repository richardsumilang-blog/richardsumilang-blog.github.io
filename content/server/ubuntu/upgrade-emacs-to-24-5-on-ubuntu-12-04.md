---
Description: Installing emacs 24.5 on Ubuntu 12.04
Categories:
 - Servers
 - Apps
Tags:
 - Emacs
 - Ubuntu
Keywords:
 - GNU
 - Emacs
 - Free Software
 - Text Editor
 - OS
Title: Upgrading Emacs to 24.5
SubTitle: on Ubuntu 12.04
Date: "2017-04-05T14:08:00-08:00"
---

[1]: https://github.com/syl20bnr/spacemacs "Spacemacs"

<img src="/images/server/ubuntu/upgrade-emacs-to-24-5-on-ubuntu-12-04/gnulogo-370x229.png" class="center" />

Dump this in your terminal:

<pre><code class="language-bash">sudo apt-get install checkinstall
mkdir -p ~/src
cd ~/src
wget https://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.gz
tar xf emacs-24.5.tar.gz
cd emacs-24.5
./configure
make
sudo checkinstall
</code></pre>

<!--more-->

Take it a step further and install [Spacemacs][1]:

<pre><code class="language-bash">
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
</code></pre>
