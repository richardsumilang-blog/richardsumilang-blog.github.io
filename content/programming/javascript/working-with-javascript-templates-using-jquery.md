+++
Categories = ["Programming"]
Tags = ["HTML", "JavaScript", "jQuery", "XHTML"]
date = "2014-04-01T01:01:01-07:00"
title = "Working with JavaScript templates using jQuery"
disqusIdentifier = "97 http://www.richardsumilang.com/blog/?p=97"
aliases = ["/blog/2014/04/01/working-with-javascript-templates-using-jquery"]

+++

I picked up this nifty way of templating HTML code for JavaScript while working
at [Monkey Quest][1] and haven't looked back. The idea here is to separate your
design from your code. This is particularly useful when you are adding content
to your site after the initial rendering. Data can be fed in from a number of
sources and added to a page using a template.

Creating an example the old fashion way using concatenation:

<pre><code class="language-js">//Variables
var title = "Hello World";
var excerpt = "This is the world's shortest lorem ipsum. Jk.";

// Template
var template = "&lt;div style='article'&gt;";
template += "&lt;h1&gt;" + title + "&lt;/h1&gt;";
template += "&lt;div style='excerpt'&gt;" + excerpt + "&lt;/div&gt;";
template += "&lt;/div&gt;";

// Append to "foo" element
document.getElementById("foo").appendChild( template );</code></pre>

While this may work, it's a nightmare to update your markup as it changes because it's mixed in with your code and will eventually give you gray hairs.

Consider this piece of markup on your page for your template:

<pre><code>&lt;script type="text/xhtml" id="tmpl-foo"&gt;
&lt;div style="article"&gt;
	&lt;h1 /&gt;
	&lt;div class="exerpt" /&gt;
&lt;/div&gt;
&lt;/script&gt;</code></pre>

That's very easy to read right? The trick is setting the [script type][2] to a
value your browser doesn't know how to render. Try to give it a meaningful mime
type but anything that your browser doesn't know how to render will work.

Now your JavaScript (sprinkled with a little jQuery) could look like this:

<pre><code class="language-javascript">// Variables
var title = "Hello World";
var excerpt = "This is the world's shortest lorem ipsum. Jk.";
var template = $( $("tmpl-foo") );

// Set variables in template
template.find("h1").html( title );
template.find("div.excerpt").html( excerpt );

// Append to "foo" element
$("#foo").append( template );</code></pre>

## Conclusion

Some people also like to load templates externally by putting the code in a HTML
file on the server and using jQuery's `$.get` method to pull it in as needed.
There are also plugins for jQuery that simply do string replacements in your
template string.

[1]: http://www.monkeyquest.com "MonkeyQuest"
[2]: http://www.iana.org/assignments/media-types/media-types.xhtml "Media types"
