package hxdom.html.idb;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef VersionChangeRequest = js.html.idb.VersionChangeRequest;
#else
class VersionChangeRequest extends Request {
	
	/** The event handler for the blocked event. */
	public var onblocked : hxdom.html.EventListener;
	
}
#end