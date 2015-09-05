+++
Categories = ["Programming"]
Tags = ["Babel", "ECMAScript 6", "JavaScript", "jQuery Mobile", "Node.js", "NPM"]
SubTitle = "Oh the pain..."
date = "2015-03-11T01:01:01-07:00"
title = "Using jQuery mobile in a ECMAScript 6 project"
disqusIdentifier = "505 http://www.richardsumilang.com/blog/?p=505"
aliases = ["/blog/2015/03/11/using-jquery-mobile-in-a-ecmascript-6-project"]

+++

I started using ECMAScript 6 in a project which required supporting the
dependencies I was upgrading from. I used [Babel JS][1] to transpile my ES6 code
with [browserify][2] and everything was working fine until I got to
[jQuery-mobile][3].

<p align="center"><img src="/images/reactions/why/jon-stewart.gif" /></p>

After a quick inspection, I see that jQuery-mobile is having trouble binding
itself to the `root` aka `this` aka `window` object. This is because the way
jQuery-mobile is wrapped in a block where `this` is `undefined` because the
code is not being executed in the assumed scope.

### Example:

<pre><code class="language-javascript">function(require,module,exports){
(function (global){
;__browserify_shim_require__=require;(function browserifyShim(module, exports, require, define, browserify_shim__define__module__export__) {
"use strict";(function(root, doc, factory){if(typeof define === "function" &amp;&amp; define.amd){define(["jquery"], function($){factory($, root, doc);return $.mobile;});}else {factory(root.jQuery, root, doc);}})(undefined || window, document, function(jQuery, window, document, undefine) {

/*!
* jQuery Mobile 1.4.5
* Git HEAD hash: 68e55e78b292634d3991c795f06f5e37a512decc <> Date: Fri Oct 31 2014 17:33:30 UTC
* http://jquerymobile.com
*
* Copyright 2010, 2014 jQuery Foundation, Inc. and othercontributors
* Released under the MIT license.
* http://jquery.org/license
*
*/

(function ( root, doc, factory ) {
	if ( typeof define === "function" &amp;&amp; define.amd ) {
		// AMD. Register as an anonymous module.
		define( [ "jquery" ], function ( $ ) {
			factory( $, root, doc );
			return $.mobile;
		});
	} else {
		// Browser globals
		factory( root.jQuery, root, doc );
	}
}( this, document, function ( jQuery, window, document, undefined ) {
(function( $ ) {
	$.mobile = {};
}( jQuery ));

// more jquery code
}</code></pre>

The jQuery-mobile team doesn't want to make fixes for this because they would
have to continue to make patches for their code when another build system comes
out and whose got time to keep up with that? Needless to say, I wish they had
the time for it to make their libraries more compatible for users and they are a
bigger team than just little ole independent me but that's just my opinion.

Today is going on my 2nd day being stuck with the issue (also second day of
using gulp and browserify so give me a break) and I've tried just about every
solution I can find on the web before I just gave up and wrote my own. Though,
not exactly the most elegant solution, I simply replaced all instances of `this`
to `this || window` and walla it worked.

Now I have jQuery-mobile working just fine in my ES6 project. I've bundled my
changes up in a npm project under the name **jquery-mobile-babel-safe**. Here is
how I use it in my project:

### Install

Run this command in your project room:

		npm install jquery-mobile-babel-safe --save

**package.json**
 
<pre><code class="language-javascript">    "browser": {
      "jquery-mobile": "./node_modules/jquery-mobile-babel-safe/dist/jquery.mobile-1.4.5.js"
    },
    "browserify-shim": {
      "jquery-mobile": {
        "exports": "jQuery.mobile"
      }
    }</code></pre> 

And that's about it. You can test by importing `jquery-mobile` on your page. You
should have access to `$.mobile` in your scripts.

### Wrap up...

I'd like to hear from you if you have a simpler way of making this work. I do
feel a little bad about polluting the npm package repository with yet another
jQuery package and I'd like to know of a better way of doing this but I know a
few other people were stuck with this issue so be it.

Happy hacking!

[1]: https://babeljs.io/ "Babel JS"
[2]: http://browserify.org/ "Browserify"
[3]: http://jquerymobile.com/ "jQuery Mobile"
