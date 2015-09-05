+++
Categories = ["Networking"]
Tags = ["AirPort", "Apple", "Mac", "WiFi"]
date = "2015-01-09T01:57:00-08:00"
title = "Getting the most out of your Apple AirPort Extreme network"
disqusIdentifier = "466 http://www.richardsumilang.com/blog/?p=466"
aliases = ["/blog/2015/01/09/getting-the-most-out-of-your-airport-extreme-network"]

+++

My home network is wired through a Dell gigabit switch which is connected to my
AirPort extreme. Needless to say, this has worked well for me as the only
wireless devices connected are mobile devices. I decided to set up another room
in the house but I didn't want to go through the hassle of running wires through
the walls again. It's undoubtably the best thing to do but this isn't meant to
be permanent. I figured the next best thing to do is extend the network by
purchasing another AirPort Extreme. The hardware in it is better than an AirPort
Express plus I get a few ports to hardwire a few devices. My rule of thumb is
the less WiFi, the better.

I configured the extended network with the defaults and I never spent much time
optimizing the wifi because it's primarily used for my iPhone and iPad.
Streaming media online from Netflix through a device in the new setup worked
fine at first. The issue became immediately apparent when a hardwired device
decided to come online and start streaming as well. After doing some connection
testing, it was obvious that any hardwired device sucked all the bandwidth away
from the WiFi leaving it with little to no room to breathe.

After a bit of research, I've found how to boost my WiFi signal significantly so
my additional room can enjoy streaming as well. Here is what I did:

*Note: The below is all configured through your **AirPort Utility** app.*

1. Do not use **WEP or WPA (TKIP)** authentication. WEP was deprecated in 2004 by
the FBI due to it's security flaws. WPA was superseded by WPA2 in 2006. If you
must, use **WPA/WPA2 Personal** but I feel it would be best to strictly use
**WPA2 Personal** alone to ensure best transfer rates. You can do this by
navigating to the **Wireless** tab then choosing the appropiate option under
**Wireless Security**.
2. In the same area screen, click the **Wireless Options** button. All my
wireless devices support 5GHz radio frequencies so it's best to remove 2.4GHz
support. You will notice additional settings if you hold the *option* key and
clicking the **Radio Mode:** drop down box. I selected **802.11n only 5GHz -
802.11b/g/n**.
3. You can leave the **2.4GHz Channel:** and the **5Ghz Channel:** setting
beneath set to **Automatic**.
4. Lastly you would like to go to the **Internet** tab and click on the
**Internet Options...** button. **Configure IPv6:** should be set to
**Automatically** and **IPv6 Mode:** should be set to **Native**.
5. Save all settings and click **Update**.

### Conclusion

After applying the above settings WiFi speeds multiplied. The only drawback is
if you are trying to support legacy devices that either do not support WPA2 or
5GHz radio mode. Naturally, the 5GHz band has a shorter range but the 2.4GHz
band is more prone to interference due to the fact that more devices use it.
Another important thing to note is that the 5GHz band has 23 non-overlapping
channels as opposed to 3 in the 2.4GHz band.
