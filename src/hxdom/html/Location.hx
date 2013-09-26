package hxdom.html;

#if js
typedef Location = js.html.Location;
#else
class Location {
	
	public var ancestorOrigins(default, null):DOMStringList;

	/** the part of the URL that follows the # symbol, including the # symbol.<br> You can listen for the <a title="en/DOM/window.onhashchange" rel="internal" href="https://developer.mozilla.org/en/DOM/window.onhashchange">hashchange event</a> to get notified of changes to the hash in supporting browsers. */
	public var hash:String;

	/** the host name and port number. */
	public var host:String;

	/** the host name (without the port number or square brackets). */
	public var hostname:String;

	/** the entire URL. */
	public var href:String;

	public var origin(default,null):String;

	/** the path (relative to the host). */
	public var pathname:String;

	/** the port number of the URL. */
	public var port:String;

	/** the protocol of the URL. */
	public var protocol:String;

	/** the part of the URL that follows the&nbsp;? symbol, including the&nbsp;? symbol. */
	public var search:String;

	public function assign (url:String):Void {
		
	}

	public function reload ():Void {
		
	}

	public function replace ( url:String ):Void {
		
	}

	public function toString ():String {
		return null;
	}
	
}
#end