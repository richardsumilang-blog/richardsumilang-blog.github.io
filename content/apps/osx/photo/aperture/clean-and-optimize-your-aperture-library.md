+++
Categories = ["Apps"]
Tags = ["Aperture", "Apple", "Mac", "OS X"]
date = "2014-07-13T20:47:01-08:00"
title = "How to clean and optimize your Aperture Library"
SubTitle = "Cleanliness is the next to godliness"
disqusIdentifier = "394 http://www.richardsumilang.com/blog/?p=394"
aliases = ["/blog/2014/07/13/how-to-clean-and-optimize-your-aperture-library"]

+++

After time you will notice your Aperture Library growing ridiculously big. Here
a are few tips to shrink it back down and keep it optimal.

### 1. Keep master files out of the Aperture Library

I strongly encourage this as it makes your Aperture Library much easier to
manage and keeps free space on your workstation for more important things. I
work in a 250gb SSD drive and space is important. Keep your masters on an
external drive or network attached storage and only import them locally while
you're working on them. Adobe Lightroom gets this and actually never puts your
masters in the Aperture Library. Or as they call it, catalog.

### 2. Create a Aperture Library for different projects

This will keep your libraries small and efficient. This is especially nifty if
you work on a laptop with limited space. Imagine going on a trip to take photos.
You don't need to carry your whole Aperture Library with you. You want as much
space possible to take as many photos as you need. You can, if needed, merge
your Aperture Library into another "master" Aperture Library to consolidate
everything in the future.

### 3. Trash your thumbnails

Some might be stale anyways and it's nice to get rid of excess. Aperture will
regenerate what it needs when you access it. Pop open a terminal and run these
commands:

<pre><code class="language-bash">find ~/Pictures -name "AP.Thumbnails" -delete
find ~/Pictures -name "AP.Minis" -delete
find ~/Pictures -name "AP.Tinies" -delete</code></pre>

That saved me about 10 gigabytes. Your mileage may very.

### 4. Rebuild your database

Hold `option + command` on your keyboard while opening Aperture. This will bring
up the *Photo Library First Aid* dialog. Click *Rebuild Database* then *Rebuild*
button.
