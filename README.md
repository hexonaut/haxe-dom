haxe-dom provides target independant DOM manipulation.

Data Structures
===============

* CopyOnWriteArray - A data structure for read-heavy storage. As the name suggests, the array is copied when a modification is performed.
* ConcurrentHash/ConcurrentIntHash - Provides a Hash which is thread safe.

Performance
===========

Here are some performance tests run on a win7-64bit i7 Dell Inspiron laptop (8 CPUs) under the neko target:

Comparison to Non-Concurrent Data Structures
--------------------------------------------

* Array Write MOD 1000: 83 ns
* CopyOnWriteArray Write MOD 1000: 3487 ns
* Array Read MOD 1000: 67 ns
* CopyOnWriteArray Read MOD 1000: 130 ns
* IntHash Write: 149 ns
* ConcurrentIntHash Write: 342 ns
* IntHash Read: 66 ns
* ConcurrentIntHash Read: 236 ns

Throughput Speed Testing
------------------------

* Array Read 20M items: 1363 ms
* CopyOnWriteArray Read 20M items (2 Threads): 1431 ms
* CopyOnWriteArray Read 20M items (4 Threads): 813 ms
* CopyOnWriteArray Read 20M items (8 Threads): 597 ms
* CopyOnWriteArray Read 20M items (16 Threads): 369 ms
* CopyOnWriteArray Read 20M items (32 Threads): 182 ms

Extras
======

* neko.net.MultiThreadedServer - A fully concurrent server which is similar to neko.net.ThreadServer, except the application logic is concurrent as well.
* sys.db.PooledConnection -  A thread-safe abstraction layer for accessing databases. Connections are pooled and automatically restarted when a failure occurs.

PooledConnection Usage
----------------------

Usage is very simple. Instead of creating your sys.db.Mysql.connect() or sys.db.Sqlite.read() connections just create a new PooledConnection and pass in a factory constructor as shown below:
	
	//Create a pooled connection
	var cnx = new sys.db.PooledConnection(function ():sys.db.Connection {
		return sys.db.Mysql.connect( { host:HOST, port:PORT, user:USER, pass:PASS, socket:null, database:DATABASE } );
	}, NUM_CONNECTIONS);
	
	//Use with SPOD!
	//A point of caution - SPOD uses a global object cache by default so you will need to deal with this when using in a multithreaded application
	sys.db.Manager.cnx = cnx;