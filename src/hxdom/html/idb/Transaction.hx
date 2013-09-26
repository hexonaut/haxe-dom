package hxdom.idb;

import hxdom.Element;
import hxdom.EventTarget;
import hxdom.NodeList;

#if js
typedef Transaction = js.html.idb.Transaction;
#else
class Transaction extends EventTarget {
	
	/** Allows data to be read but not changed.&nbsp; */
	public static inline var READ_ONLY : Int = 0;

	/** Allows reading and writing of data in existing data stores to be changed. */
	public static inline var READ_WRITE : Int = 1;

	/** Allows any operation to be performed, including ones that delete and create object stores and indexes. This mode is for updating the version number of transactions that were started using the <a title="en/IndexedDB/IDBDatabase#setVersion" rel="internal" href="https://developer.mozilla.org/en/IndexedDB/IDBDatabase#setVersion"><code>setVersion()</code></a> method of <a title="en/IndexedDB/IDBDatabase" rel="internal" href="https://developer.mozilla.org/en/IndexedDB/IDBDatabase">IDBDatabase</a> objects. Transactions of this mode cannot run concurrently with other transactions. */
	public static inline var VERSION_CHANGE : Int = 2;

	/** The database connection that this transaction is associated with. */
	public var db(default,null) : Database;

	public var error(default,null) : hxdom.DOMError;

	/** The mode for isolating access to data in the object stores that are in the scope of the transaction. For possible values, see Constants. The default value is <code><a href="#const_read_only" title="#const read only">READ_ONLY</a></code>. */
	public var mode(default,null) : String;

	/** The event handler for the <code>onabort</code> event. */
	public var onabort : hxdom.EventListener;

	/** The event handler for the <code>oncomplete</code> event. */
	public var oncomplete : hxdom.EventListener;

	/** The event handler for the <code>error </code>event. */
	public var onerror : hxdom.EventListener;

	public function abort() : Void {
		
	}

	public function objectStore( name : String ) : ObjectStore {
		return null;
	}
	
}
#end