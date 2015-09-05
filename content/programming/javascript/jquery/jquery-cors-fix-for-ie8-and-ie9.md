+++
Categories = ["Programming"]
Tags = ["CORS", "Internet Explorer", "JavaScript", "jQuery"]
SubTitle = "No browser is left behind"
date = "2014-06-20T01:01:01-07:00"
title = "jQuery CORS fix for IE8 and IE9"
disqusIdentifier = "302 http://www.richardsumilang.com/blog/?p=302"
aliases = ["/blog/2014/06/20/working-with-javascript-templates-using-jquery"]

+++

Who can blame jQuery for not wanting to support Internet Explorer? Despite
whatever the reason, it doesn't always make business sense and we must support
it. I found this [piece of code][1] that patches the issue with jQuery.

<pre><code class="language-javascript" title="jQuery CORS IE8 and IE9 fix.">if ( window.XDomainRequest ) {
	jQuery.ajaxTransport(function( s ) {
		if ( s.crossDomain &amp;&amp; s.async ) {
			if ( s.timeout ) {
				s.xdrTimeout = s.timeout;
				delete s.timeout;
			}
			var xdr;
			return {
				send: function( _, complete ) {
					function callback( status, statusText, responses, responseHeaders ) {
						xdr.onload = xdr.onerror = xdr.ontimeout = jQuery.noop;
						xdr = undefined;
						complete( status, statusText, responses, responseHeaders );
					}
					xdr = new XDomainRequest();
					xdr.onload = function() {
						callback( 200, "OK", { text: xdr.responseText }, "Content-Type: " + xdr.contentType );
					};
					xdr.onerror = function() {
						callback( 404, "Not Found" );
					};
					xdr.onprogress = jQuery.noop;
					xdr.ontimeout = function() {
						callback( 0, "timeout" );
					};
					xdr.timeout = s.xdrTimeout || Number.MAX_VALUE;
					xdr.open( s.type, s.url );
					xdr.send( ( s.hasContent &amp;&amp; s.data ) || null );
				},
				abort: function() {
					if ( xdr ) {
						xdr.onerror = jQuery.noop;
						xdr.abort();
					}
				}
			};
		}
	});
}</code></pre>

Note: This doesn't work when using the `{async: false}` option in jQuery methods.

Be sure to set the `{crossDomain: true}` setting and you're good to go.

[1]: https://github.com/jaubourg/ajaxHooks/blob/master/src/xdr.js "XDR Patch"