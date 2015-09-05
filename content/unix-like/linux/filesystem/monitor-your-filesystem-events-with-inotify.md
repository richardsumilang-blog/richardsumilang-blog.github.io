+++
Categories = ["Unix-like"]
Tags = ["Linux", "File System", "inotify", "monitor"]
date = "2014-07-14T01:01:01-07:00"
title = "Monitor your filesystem events on Linux with inotify"
disqusIdentifier = "402 http://www.richardsumilang.com/blog/?p=402"
aliases = ["/blog/2014/07/14/monitor-your-filesystem-events-with-inotify"]

+++

[Inotify][1] provides a nifty C API to monitor files and directories. The API
hooks into your kernel and responding to events on your filesystem is much more
efficient than doing something like writing a cron job to check for changes in a
directory every minute. Fortunately, if you're not a C developer, there is a
package called [inotify-tools][2] that comes with two programs, `inotifywait`
and `inotifywatch`. The difference is `inotifywait` waits for changes and
`inotifywatch` gathers filesystem access statistics.

Here is an example of using `inotifywait` to keep two directories synced:

<pre><code class="language-bash" title="Example using inotifywait" >#!/bin/sh
# Example: inotifywait
# Description: This example keeps the directory "/put-here" in sync with "/watch-here" when changes are made to anything in "/watch-here"
# Author: Richard Sumilang &lt;me@richardsumilang.com&gt;
#
$watch_dir=/watch-here
$put_dir=/put-here

inotifywait -mr -e modify,attrib,moved_to,moved_from,move,move_self,create,delete,delete_self $watch_dir |
while read dir ev file;
do
	if [[ $ev == "DELETE"  ]]; then
		rm -rf $put_dir$file
	elif [[ $file != *~ ]] || [[ $file != *swp ]] || [[ $file != *swx ]]; then
		rsync -azvhp --delete --exclude '.idea' --exclude '.svn' --exclude '.vagrant' --exclude 'tmp' --exclude 'crowdfusion' --exclude 'system' "$watch_dir$file" "$put_dir$file"
	fi
done;</code></pre> 

### What if I'm monitoring a network mount?

There are a few gotchas here. If you are monitoring a network mount then you
will **NOT** receive notifications if files are edited on the remote machine.
This is simply because the kernel has no knowledge of this. A solution would be
to run another process on the host machine that can send a notification.
However, it should work if you modify files in the mount from the machine
running `inotify`.

[1]: http://man7.org/linux/man-pages/man7/inotify.7.html "inotify man page"
[2]: https://github.com/rvoicilas/inotify-tools/wiki "inotify tools"
