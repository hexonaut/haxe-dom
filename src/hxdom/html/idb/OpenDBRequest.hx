package hxdom.html.idb;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef OpenDBRequest = js.html.idb.OpenDBRequest;
#else
class OpenDBRequest extends Request {
	
	public var onblocked : hxdom.html.EventListener;

	public var onupgradeneeded : hxdom.html.EventListener;
	
}
#end