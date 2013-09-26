package hxdom.html.idb;

import hxdom.html.Element;
import hxdom.html.EventTarget;
import hxdom.html.NodeList;

#if js
typedef Request = js.html.idb.Request;
#else
class Request extends EventTarget {
	
	/** Getter throws DatabaseException. */
	public var error(default,null) : hxdom.html.DOMError;

	/** Getter throws DatabaseException. */
	public var errorCode(default,null) : Int;

	/** Getter throws DatabaseException. */
	public var errorMessage(default,null) : String;

	public var onerror : hxdom.html.EventListener;

	public var onsuccess : hxdom.html.EventListener;

	public var readyState(default,null) : String;

	/** Getter throws DatabaseException. */
	public var result(default,null) : Any;

	public var source(default,null) : Any;

	public var transaction(default,null) : Transaction;
	
}
#end