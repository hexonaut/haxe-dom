package hxdom.idb;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef VersionChangeRequest = js.html.idb.VersionChangeRequest;
#else
class VersionChangeRequest extends Request {
	
	/** The event handler for the blocked event. */
	public var onblocked : hxdom.EventListener;
	
}
#end