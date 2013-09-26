package hxdom.idb;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef OpenDBRequest = js.html.idb.OpenDBRequest;
#else
class OpenDBRequest extends Request {
	
	public var onblocked : hxdom.EventListener;

	public var onupgradeneeded : hxdom.EventListener;
	
}
#end