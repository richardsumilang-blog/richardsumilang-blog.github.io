---
Categories:
 - Apps
 - Unix-like
CoverImage: images/unix-like/darwin/cask/casks-installer/cover-900x477.png
CoverImageType: "image/png"
CoverImageHeight: 477
CoverImageWidth: 900
Tags:
 - Apple
 - brew
 - cask
 - Darwin
 - El Capitan
 - Homebrew
 - OS X
 - Software
Date: 2015-09-20T17:59:00-07:00
Title: Automate Your OS X App Installations
SubTitle: "\"To install, drag this icon...\" no more!"
Description: An example of automating app installations for Mac OS X using Homebrew and Cask.
---

[1]: {{< relref "posts/unix-like/darwin/cask/my-cask-script.md" >}} "My Cask Script"
[2]: https://github.com/rsumilang/casks-installer "Casks Installer"
[3]: https://github.com/rsumilang/casks-installer/fork "Casks Installer Fork"
[4]: https://github.com/rsumilang/casks-installer/blob/master/install.rb "install.rb script"
[5]: https://github.com/rsumilang/casks-installer/tree/master/category "Casks Installer Categories"
[6]: https://github.com/rsumilang/casks-installer/issues "Casks Installer Issues"

I refined my [original cask script][1] for installing the software needed on
multiple Mac workstations. The new version now allows you to configure parameters of
the installation such as install path and which category of applications you
wish to install.

The point of this tool is to help me configure (or reconfigure) workstations as
needed by removing the manual work of finding the applications I always use
online, unpacking, and copying to applications folder. That process becomes a
tedious task when working with dozens of pieces of software.

[Fork it][3] for your own use on [Github][2]!

<!--more-->

### Why a sudden update?

A new version of OS X El Capitan is to be released very soon. I've always felt
installing a fresh OS ran smoother than doing an upgrade. Maybe the scars are
that deep from the days of going Windows 95 to 98? Idk.

Anyways, I'll be doing a fresh install of El Capitan and I wanted to make sure
my apps were in order since I've last used [my cask script][1]. The process of
manually installing each app takes longer than the actual OS install.
Furthermore, I don't need all apps installed in one shot so I broke them up into
installable category groups... Something I have been itching to do since the
original mockup.

### How it works

You'll notice a file called [`install.rb`][4] in the project root. This is the
script you will interface with for installing (or uninstalling) applications.
Applications are grouped by categories located in the [`./category`][5] folder
where you can add more or less.

You can get a list of configurable options by running the `-h` help option.

<pre><code class="language-bash">ruby install.rb -h</code></pre>

### Options

#### --appdir

The default location cask uses for Application shortcuts is `~/Applications`. I
change this setting in my install command to point to `/Applications`.

*Default:* `/Applications`

*Example:*

<pre><code class="language-bash">ruby install.rb --appdir=/Applications</code></pre>

#### --category

Name of the application category group to install (or uninstall). The category
name should reference a file in the `./category/` directory, excluding the file
extension. If no category group is specified then all will be installed.

*Example:*

<pre><code class="language-bash">ruby install.rb --category=browsers</code></pre>

*or:*

<pre><code class="language-bash">ruby install.rb -c browsers</code></pre>

#### --uninstall

This changes the default `install` option to `uninstall`. With this flag on you
can uninstall a category group or uninstall everything. This option requires no additional arguments.

*Example:*

<pre><code class="language-bash">ruby install.rb -c browsers --uninstall</code></pre>

*or*

<pre><code class="language-bash">ruby install.rb -c browsers -u</code></pre>

### Updates

Follow the [GitHub repository][2] for updates and please add any feature
requests to the [project issues][6]. I welcome pull requests :)

### Known issues

Unfortunately there is no way to specify the specific version of an app that you
need. This hasn't been much of an issue for me yet but I know it would be nice
to have.

## License

This was created by [Richard Sumilang](https://richardsumilang.com/) and is
licensed under the [CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0/)
license. You are encouraged to fork this repository and make adjustments
according to your preferences.

![Creative Commons License](https://i.creativecommons.org/l/by-sa/3.0/88x31.png)
