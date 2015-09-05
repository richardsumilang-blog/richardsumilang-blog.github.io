+++
Categories = ["Servers"]
Tags = ["DSM 5", "NAS", "SSH", "Synology"]
date = "2014-07-12T18:32:00-08:00"
title = "How to enable SSH access to Synology DiskStation"
disqusIdentifier = "364 http://www.richardsumilang.com/blog/?p=364"
aliases = ["/blog/2014/07/12/how-to-enable-ssh-access-to-synology-diskstation"]

+++

Log into your system with an administrator account and open the
**<sup>1</sup>Control Panel** applet. From there, click on
**<sup>2</sup>Terminal &amp; SNMP**, **<sup>3</sup>Enabled SSH service**, and
**<sup>4</sup>Apply**.

<img src="/images/server/synology/diskstation/how-to-enable-ssh-access-to-synology-diskstation/steps.png" />

It doesn't get any easier than that! Check out the [Synology Wiki][1] for more
information. You can log to the root account using your admin password. :)

`ssh root@1.2.3.4`

[1]: http://forum.synology.com/wiki/index.php/Enabling_the_Command_Line_Interface "Enabling the command line interface"
