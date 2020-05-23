+++
Categories = ["Programming"]
Tags = ["Apple", "exif", "ImageMagick", "imagick", "iOS", "iPad", "iPhone", "Jpeg", "PHP", "Tiff"]
date = "2014-10-17T14:33:00-08:00"
title = "Working with Apple's iOS image orientation"
SubTitle = "Using PHP and ImageMagick"
disqusIdentifier = "432 http://www.richardsumilang.com/blog/?p=432"
aliases = ["/blog/2014/10/17/working-with-apples-ios-image-orientation", "/programming/php/graphics/working-with-apples-ios-image-orientation"]

+++

You might notice pictures taken with an iOS device (iPhone or iPad) look like
they are not rotated properly when transferring them to another device or
software. This happens because the device is held at a certain angle when the
picture is taken and it's up to the software at the receiving end to display it
however it wants.

Apple's camera will write orientation info into the exif headers of images
taken and you can rotate it accordingly.

Here is an example of rotating an image using PHP with the ImageMagick library;

<!--more-->

<pre><code class="language-php" title="Rotate iOS image">&lt;?php

// Rotate iOS image
// @author Richard Sumilang &lt;me@richardsumilang.com&gt;

$imageFile = '/foo/bar.jpg';
$finfo = finfo_open(FILEINFO_MIME_TYPE);
$mimeType = finfo_file($finfo, $imageFile);
finfo_close($finfo);

// Detect if jpeg or tiff
if ( in_array($mimeType, ['image/jpeg', 'image/tiff']) ) {
	$exif = exif_read_data($imageFile);
	if ( isset($exif['Orientation']) &amp;&amp; !empty($exif['Orientation']) ) {

		// Decide orientation
		if ( $exif['Orientation'] == 3 ) {
			$rotation = 180;
		} else if ( $exif['Orientation'] == 6 ) {
			$rotation = 90;
		} else if ( $exif['Orientation'] == 8 ) {
			$rotation = -90;
		} else {
			$rotation = 0;
		}

		// Rotate the image
		if ( $rotation ) {
			$imagick = new Imagick();
			$imagick-&gt;readImage($imageFile);
			$imagick-&gt;rotateImage(new ImagickPixel('none'), $rotation);
			$imagick-&gt;writeImage($imageFile);
			$imagick-&gt;clear();
			$imagick-&gt;destroy();
		}

	}
}</code></pre>

Note: Only jpeg and tiff files contain exif information.
