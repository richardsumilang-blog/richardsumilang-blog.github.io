---
Description: Running roon on Synology NAS with restricted directory access.
Categories:
 - Apps
Tags:
 - Roon
 - Synology
Keywords:
 - Roon
 - Security
 - Audiophile
 - Software
 - Music
 - Docker
Title: Roon On NAS
SubTitle: Restrict directory access on Synology
Date: 2022-02-10T22:18:45-08:00
---

[1]: https://roononnas.org/ "Roon On Nas"
[2]: https://github.com/steefdebruijn/docker-roonserver  "Docker Roon Server"
[3]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones "List of tz database time zones"

If you run your own Synology NAS, you may want to run roon directly on your server for audio streaming. [Roon on Nas][1] provides a package to conveniently install on your Synology server. The issue with this option is that the Synology service runs without any restriction on what it can see.

I noticed this issue when configuring my client. While adding the location of my music, the roon client was able to browse the entire NAS. Though the roon app will only add music to its library, this was not something I wanted available to any roon client that was on my network.

<!--more-->

## The Solution

Using docker we can create a container to run the roon server and give the container access only to our music directory via a mount. Essentially making this a jailed environment. A roon client will still have the ability to browse the whole system the server is running on, but now the system is the container whose files don't mean much to us.

Steef de Bruijn was kind enough to provide a [dockerfile][1] for running the latest roon server. Here's my setup process:

- Open the _Docker_ app your NAS.
- Click the _Registy_ tab and enter `roonserver` in the search field.
- Find the `steefdebruijn/docker-roonserver`, click it, then click _Download_. Choose the `latest` tag.
- Click the _Image_ tab, find `steefdebruijn/docker-roonserver:latest` and click _Launch_.
  - Container name: _Whatever you want to call the server_.
  - Click _Advanced Settings_.
  - Click the _Volume_ tab and add the following folders.
    - Folder: `/path/to/data` (eg: `/roon/data`), Mount Path: `/data`.
    - Folder: `/path/to/backup` (eg: `/roon/backup`), Mount Path: `/backup`.
    - Folder: `/path/to/app` (eg: `/roon/app`), Mount Path: `/app`.
    - Folder: `/path/to/music` (eg: `/roon/music`), Mount Path: `/music`.
  - Click the _Network_ tab and check _Use the same network as Docker host_.
  - Click the _Environment_ tab and _Add_ your [time zone][3].
    - Eg: _variable_: `TZ` and _value_: `America/Los Angeles`.
  - Click _Apply_.
  - Click _Next_.
  - Click _Done_.

You should be able to see your new container running momentarily under the _Container_ tab.

The last thing to do is fire up your roon client on a device and the music directory.

- Open roon client on your device.
- Click the pullout menu.
- Click _Settings_.
- Click _Storage_.
- Click _Add folder_.
  - Select the mount path you specified on your docker container for music (eg: `/music`).

You should notice that you are browsing only the contents of your container and not all the shares on your Synology.

Wala!