---
Description: How to unlock all Fujifilm film simulations in Capture One or Lightroom.
Categories:
 - Photography
Tags:
 - Fujifilm
 - Film Simulations
 - Capture One
 - Adobe Lightroom
Keywords:
 - Fujifilm
 - Film Simulations
 - Capture One
 - Adobe Lightroom
Title: Unlock Fujifilm Film Simulations
SubTitle: with Capture One and Lightroom
Date: "2021-07-01T20:48:47.258Z"
draft: true
---

[1]: https://brew.sh/ "Homebrew"

Every Fujifilm camera iteration seems to come out with new film simulations which is a cool thing! The sad thing is the previous iterations don't receive the new simulations. However, Capture One and Adobe Lightroom have their own versions of the simulations built in that you can have access to!

<!--more-->

# How to?

There are two ways to do it. The first method requires editing your image(s) exif data. This method will work with both Capture One and Lightroom by tricking them to think your images were shot with a later camera version. The problem with this is only that your exif data will say you shot with an `XT-4` camera instead of maybe an `XT-3`. Not a huge deal unless you care about that stuff. And if you do, you can run the script to change it back to say `XT-3` when you're done with the edits.

The second method only works with Lightroom. It will not require editing exif data - which is nice. You will only have to edit your camera profiles once in Lightroom, and probably re-apply the edit after a software update.

# Warning

These methods only work with Fujifilm raw files. This has something to do with how the software is interpreting the raw data and applying a camera profile. Each camera manufacturer saves raw data differently thus Fujifilm camera profiles are incompatible with something like a Leica raw image. Styles/presets on the otherhand are applied to an image after it's interpreted which allows them to work on any type of image.

Also, use the instructions below at your own risk.


## Exif Method

Being the nerd that I am, we'll go over the exif method one first. (Also because I favor Capture One.) The first thing you'll need to do is install [brew][1] if you don't already have it.

Now we can use brew to install `exiftool`. This tool is going to do the heaving lifting for us.

<pre><code class="language-bash" title="exiftoo.sh">brew install exiftool</code></pre>

Lastly create this file in `/usr/local/bin/fujifilm-exif-update`.

<pre><code class="language-bash" title="fujifilm-exit-update.sh">#!/bin/bash
# fujifilm-exif-update
# ------------------------------
# This script requires `exiftool`. Will update the exif metadata to the
# latest fujifilm camera model (XT-4) which will unlock the film simulations
# for that model in your editing software.
#
# brew install exiftool
#
# Example:
# ------------------------------
# fujifilm-exif-update [MODEL=XT-4] FILE_NAME 


if [ $2 ];
then
    model="$1"
    file="$2"
else
    model='XT-4'
    file="$1"
fi

exiftool -make="FUJIFILM" -model="$model" "$file"</code></pre>

Make the above command executable:

<pre><code class="language-bash">chmod u+x /usr/local/bin/fujifilm-exif-update</code></pre>

If you're not a tech person you're probably thinking, "wow that was fun!" /sarcasm.

Now you use this script on any of your raw Fujifilm files to access your softwares film built in film simulations.

### Example

<pre><code class="language-bash">fujifilm-exif-update example.raf</code></pre>

### Example 2
This will run the command in all files in a directory:

<pre><code class="language-bash">for file in *.raf
do
  fujifilm-exif-update "$file"
done</code></pre>

## Adobe Lightroom Method

This method is far simpler and non destructive to your raw files. You're going to need to navigate to the following path:

<pre><code class="language-bash">open /Applications/Adobe\ Lightroom\ Classic/Adobe\ Lightroom\ Classic\ App/Contents/Resources/Settings/Adobe\ Profiles/Camera/Fujifilm/Fujifilm\ X-T4</code></pre>

You should find the following three files in here:

* `Fujifilm X-T4 Camera BLEACH BYPASS.xmp`
* `Fujifilm X-T4 Camera CLASSIC Neg.xmp`
* `Fujifilm X-T4 Camera Sepia.xmp`

Run the following steps on each of the files...

1. Open `.xmp` file in your favorite text editor.
2. Find the line that reads `crs:CameraModelRestriction="Fujifilm XT-4"`.
3. Change that to `crs:CameraModelRestriction=""`.
4. Save and close the file.

Once done, you should restart Lightroom and you will see your profiles now available for your Fujifilm raw files.