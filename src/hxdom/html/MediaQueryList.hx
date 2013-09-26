package hxdom.html;

#if js
typedef MediaQueryList = js.html.MediaQueryList;
#else
class MediaQueryList {
	
	/** <code>true</code> if the <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/document">document</a></code>
 currently matches the media query list; otherwise <code>false</code>. <strong>Read only.</strong> */
	public var matches(default,null) : Bool;

	/** The serialized media query list. */
	public var media(default,null) : String;

	public function addListener( listener : MediaQueryListListener ) : Void {
		
	}

	public function removeListener( listener : MediaQueryListListener ) : Void {
		
	}
	
}
#end