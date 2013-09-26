package hxdom.idb;

import hxdom.Element;
import hxdom.EventTarget;
import hxdom.NodeList;

#if js
typedef Request = js.html.idb.Request;
#else
class Request extends EventTarget {
	
	/** Getter throws DatabaseException. */
	public var error(default,null) : hxdom.DOMError;

	/** Getter throws DatabaseException. */
	public var errorCode(default,null) : Int;

	/** Getter throws DatabaseException. */
	public var errorMessage(default,null) : String;

	public var onerror : hxdom.EventListener;

	public var onsuccess : hxdom.EventListener;

	public var readyState(default,null) : String;

	/** Getter throws DatabaseException. */
	public var result(default,null) : Any;

	public var source(default,null) : Any;

	public var transaction(default,null) : Transaction;
	
}
#end