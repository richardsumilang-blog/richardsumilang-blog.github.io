+++
Categories = ["Servers"]
Tags = ["Crontab", "DSM, 4", "DSM 5", "NAS", "rsync", "SSH", "Synology"]
date = "2014-07-12T02:01:01-08:00"
title = "How to setup automated backups to SSH server with Synology DiskStation"
disqusIdentifier = "372 http://www.richardsumilang.com/blog/?p=372"
aliases = ["/blog/2014/07/12/how-to-replace-a-bad-hard-drive-on-a-synology-diskstation-raid-5-with-dsm-5-0"]

+++

[1]: https://www.freebsd.org/doc/handbook/configtuning-cron.html "FreeBSD Configuring Cron"

As a best practice, it's great great to have your data in more than one
location. I use my Synology Diskation as a local network file server at my home.
The reality is something can happen and I lose all my important data in that
little box. From a BBQ, a birthday party, or maybe the house just burns down and
now all my data is gone. Unfortunately my network rack at home will never be as
secure as a network rack in a data center. So, backup your data because that's
much easier to do rather than trying to restore from no backup. Makes logical
sense right? Derp.

<!--more-->

## Requirements

- Basic shell knowledge.
- A remote server that you can SSH into.

### Why not use the "Backup &amp; Replication" plugin?

The *Backup &amp; Replication* module does not have a way to specify my remote
server's rsync port. The default is **22** but my host runs on port **2222**.

## 1. Enable SSH on your Synology Box

First things first. [Enable SSH]({{< relref "enable-ssh-access-to-synology-diskstation.md" >}})
on your Synology box if you haven't already done so and log in (via ssh).

## 2. Generate SSH keys

We'll need to generate a pair of keys here so `rsync` is not prompted for your
password when it runs otherwise this defeats the purpose of automation. To do
this, run the following command:

<pre><code class="language-bash">ssh-keygen -v -t rsa -f ~/.ssh/backup -P ""</code></pre>

This will generate `/root/.ssh/backup` and `/root/.ssh/backup.pub`.

## 3. Copy your public key to the remote server

Login to your remote server and put the contents of `/root/.ssh/backup.pub` from
your Synology box to `~/.ssh/authorized_keys` on your remote box. If this file
on your remote box already exists, then just append the contents to it rather
than overwriting it. If this file does not exist, then create it.

*If you create it manually then make sure the following files have the following
permissions otherwise SSH will not allow you to use*

- 0700: ~/.ssh
- 0644: ~/.ssh/authorized_keys

You should be able to SSH from your Synology Diskation to your remote machine
without specifying a password. Here is an example command:

    ssh username@home -i /root/.ssh/backup -v

The `-i` command tells SSH which private key to use and the `-v` would make the
program verbose.

## 4. Configure rsync and crontab

Last but not least, we need to add a line in our crontab configuration to run
rsync at a specific time. Here is an example of mine:

<pre><code class="language-crontab">0	0	*	*	*	root	rsync -avztP --delete --inplace /volume1/photo/ username@host:/backups/glitch/photo -e "ssh -p 2222 -i /root/.ssh/backup" --exclude ".DS_Store" --exclude "@eaDir" --exclude ".apdisk"
0	1	*	*	*	root	rsync -avztP --inplace /volume1/manuals/ username@host:/backups/glitch/manuals -e "ssh -p 2222 -i /root/.ssh/backup" --exclude ".DS_Store" --exclude "@eaDir" --exclude ".apdisk"
0	2	*	*	*	root	rsync -avztP --inplace /volume1/surveillance/ username@host:/backups/glitch/surveillance -e "ssh -p 2222 -i /root/.ssh/backup" --exclude ".DS_Store" --exclude "@eaDir" --exclude ".apdisk"
0	3	*	*	*	root	rsync -avztP --inplace /volume1/video/ username@host:/backups/glitch/video -e "ssh -p 2222 -i /root/.ssh/backup" --exclude ".DS_Store" --exclude "@eaDir" --exclude ".apdisk"
0	4	*	*	*	root	rsync -avztP --inplace /volume1/applications/ username@host:/backups/glitch/applications -e "ssh -p 2222 -i /root/.ssh/backup" --exclude ".DS_Store" --exclude "@eaDir" --exclude ".apdisk"
0	5	*	*	*	root	rsync -avztP --delete --inplace /volume1/zappiti/ username@host:/backups/glitch/zappiti -e "ssh -p 2222 -i /root/.ssh/backup" --exclude ".DS_Store" --exclude "@eaDir" --exclude ".apdisk"</code></pre>

It's important to note that each field must be indented by a tab (not a space)
and the user must be root. If you configure this another way then the Synology
server will erase the entry when you reboot the machine. Here are some
[configuration options][1] for reference.

Put your configuration in `/etc/crontab`. You can use `nano` if you're on DSM 4
or `vi` if you're on DSM 5.

Lastly, we need to restart the cron daemon to take note of our changes. The
command is `restart crond` on DSM 5 machines and
`/usr/syno/sbin/synoservice --restart crond` on DSM 4 machines.
