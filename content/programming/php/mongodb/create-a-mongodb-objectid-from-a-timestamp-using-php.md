+++
Categories = ["Programming"]
Tags = ["Database", "MongoDB", "ObjectID", "PHP"]
date = "2014-03-31T01:01:01-07:00"
title = "How to create a MongoDB ObjectID from a timestamp using PHP"
disqusIdentifier = "42 http://www.richardsumilang.com/blog/?p=42"
aliases = ["/blog/2014/03/31/how-to-create-a-mongodb-objectid-from-a-timestamp-using-php"]

+++

This is a useful tidbit of code to have until PHP adds this feature into their
MongoDB extension. I stumbled on an example on
[Stack Overflow](http://stackoverflow.com/questions/14370143/create-mongodb-objectid-from-date-in-the-past-using-php-driver "Create MongoDB ObjectID from date in the past using PHP driver")
illustration showing how to do this and rewrote it in what I think is a slightly
more modern way that does the same thing.

[ObjectId](http://docs.mongodb.org/manual/reference/object-id/ "ObjectId - MongoDB Manual 2.4.9")'s
are constructed using a 4-byte timestamp value, 3-byte machine identifier, 2-byte process id, and a 3-byte counter which create a 12-byte BSON type:


<pre><code>
 --------------------------------------------------
| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 |
|---------------|-----------|-------|--------------|
| time          | machine   | pid   | counter      |
 --------------------------------------------------
</code></pre>


Knowing that makes this PHP code easy to understand:

## MongoUtil:

<pre><code class="language-php" title="MongoUtil.php">/**
 * Class MongoUtil.
 */
class MongoUtil {

	/**
	 * This is needed to keep documents unique that have the same timestamp.
	 * @var integer
	 * @see $timestamp
	 */
	public static $_mongoIdFromTimestampCounter = 0;

	/**
	 * Mongo Id From Timestamp
	 * @param integer $timestamp
	 * @return MongoID
	 * @see http://docs.mongodb.org/manual/reference/object-id/
	 */
	public static function mongoIdFromTimestamp( $timestamp ) {
		// Build Binary Id
		$binaryTimestamp = pack('N', $timestamp); // unsigned long
		$machineId = substr(md5(gethostname()), 0, 3); // 3 bit machine identifier
		$binaryPID = pack('n', posix_getpid()); // unsigned short
		$counter = substr(pack('N', self::$_mongoIdFromTimestampCounter++), 1, 3); // Counter
		$binaryId = "{$binTimestamp}{$machineId}{$machineId}{$counter}";

		// Convert to ASCII
		$id = '';
		for ($i = 0; $i &lt; 12; $i++) {
			$id .= sprintf("%02X", ord($binaryId[$i]));
		}

		// Return Mongo ID
		return new MongoID($id);
	}

}</code></pre>


## Example of usage:


<pre><code class="language-php" title="Example">$date = strtotime('today');
$mongoId = MongoUtil::mongoIdFromTimestamp( $date );

// Do more stuff.</code></pre>