+++
Categories = ["Servers"]
Tags = ["Bash", "init.d", "LSB", "Templates"]
date = "2014-07-07T14:08:00-08:00"
title = "LSB Init.d Script Template"
SubTitle = "Managing daemons on Linux"
disqusIdentifier = "359 http://www.richardsumilang.com/blog/?p=359"
aliases = ["/blog/2014/07/07/lsb-init-d-script-template"]

+++

Quick little `init.d` template:

<pre><code class="language-bash" >#!/bin/bash
# &lt;Application Name&gt;
# chkconfig: 345 20 80
# description: &lt;Description&gt;
# processname: &lt;Process Name|Application Name|Short name&gt;
# author: Richard Sumilang &lt;me@richardsumilang.com&gt;
# see: https://wiki.debian.org/LSBInitScripts


CMD=""                             # Command goes here
NAME="&lt;Short Application Name&gt;"    # Short Application Name
PIDFILE=/var/run/$NAME.pid         # Process ID File
SCRIPTNAME=/etc/init.d/$NAME       # This script name

case "$1" in
start)

    # Make sure process is not already running
    if [ -f $PIDFILE ]; then
        echo "PID already exists: $PIDFILE"
        exit 1
    fi

    # Use pgrep to retrieve the Process ID
    $CMD
    sleep 1
    PID=`pgrep -fn "$CMD"`

    # Save process ID to file
    if [ -z $PID ]; then
        printf "%s\n" "Failed to start $NAME"
    else
        echo $PID &gt; $PIDFILE
        printf "%s\n" "$NAME ... Ok"
    fi
;;
status)
    printf "%-50s" "Checking $NAME..."
    if [ -f $PIDFILE ]; then
        PID=`cat $PIDFILE`
        if [ -z "`ps axf | grep ${PID} | grep -v grep`" ]; then
            printf "%s\n" "Process dead but pidfile exists"
        else
            echo "$NAME is Running"
        fi
    else
        printf "%s\n" "$NAME is not running"
    fi
;;
stop)
    printf "%-50s" "Stopping $NAME"
    PID=`cat $PIDFILE`
    if [ -f $PIDFILE ]; then
        kill $PID
        printf "%s\n" "Ok"
        rm -f $PIDFILE
    else
        printf "%s\n" "pidfile not found"
    fi
;;

restart)
    $0 stop
    $0 start
;;

*)
    echo "Usage: $0 {status|start|stop|restart}"
    exit 1
esac</code></pre>


[1]: http://gearman.org/ "Gearman"
[2]: http://brew.sh/ "Homebrew"
