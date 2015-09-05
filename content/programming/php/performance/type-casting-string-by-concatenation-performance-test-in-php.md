+++
Categories = ["Programming"]
Tags = ["Optimization", "PHP", "Type Casting"]
date = "2014-05-08T18:15:00-08:00"
title = "Type Casting String by Concatenation Performance Test in PHP"
disqusIdentifier = "212 http://www.richardsumilang.com/blog/?p=212"
aliases = ["/blog/2014/05/08/type-casting-string-by-concatenation-performance-test-in-php"]

+++

The purpose of this test is to see if casting an object to a string by
concatenating it was actually slower than using normal type casting. Here is my
source:

<pre><code class="language-php" title="test-typecast.php">&lt;?php

// Setup
$tests = 1000000;
class Foo {
	public function __toString() {
		return "bar";
	}
}

// Test 1
$x = new Foo();
$timer = microtime();

for ($i = 0; $i &lt; $tests; $i++) {
	$y = "" . $x;
}

$timer -= microtime();
echo "Test 1 complete. Total time: {$timer}\n" . PHP_EOL;

// Test 2
$x = new Foo();
$timer = microtime();

for ($i = 0; $i &lt; $tests; $i++) {
	$y = (string)$x;
}

$timer -= microtime();
echo "Test 2 complete. Total time: {$timer}\n" . PHP_EOL;

// Done.
exit();</code></pre>

This is what I got in my terminal:

<pre><code class="language-php" title="Results">$php -f test-typecast.php
Test 1 complete. Total time: -0.203729
Test 2 complete. Total time: -0.16766</code></pre>

## Explanation

*Test 1* tells PHP to 1) create a string, 2) concatenate it to an object, 3) PHP
can't do that so it tries to call the `$x->__toString()` method, 4) now
concatenate `"" . $x->__toString();`.

*Test 2* in this case will 1) check the type of `$x`, and 2) return the value of
`$x->__toString()`.

Naturally the process with the least steps would be faster.
