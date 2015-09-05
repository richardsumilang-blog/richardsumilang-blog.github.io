+++
Categories = ["Servers"]
Tags = ["Backup", "Database", "MongoDB", "Restore"]
date = "2014-05-30T16:33:00-08:00"
title = "Backing up and Restoring with MongoDB"
disqusIdentifier = "260 http://www.richardsumilang.com/blog/?p=260"
aliases = ["/blog/2014/05/30/backing-up-and-restoring-with-mongodb"]

+++

## Dump
You can dump the database locally using the following `mongodump`:

<pre><code class="language-bash" title="Dump Database">mongodump --host DATABASE_HOST --port PORT -d YOUR_DATABASE_NAME -u YOUR_DB_USERNAME -p YOUR_DB_PASSWORD</code></pre>

This will create a `dump` folder containing a subfolder named after your
database. The default port for MongoDB is `27017`.

## Import

You can import the same dump to a local MongoDB instance using something like
the following `mongorestore` after changing into the `dump` directory:

<pre><code class="language-bash" title="Restore Database">mongorestore --host DATABASE_HOST --port PORT -d DATABASE_NAME_TO_IMPORT_TO --drop DATABASE_NAME_TO_IMPORT_FROM</code></pre>

**Note: This will drop the collections in the DATABASE_NAME_TO_IMPORT_TO database before restoring the same collections from your database dump.**
