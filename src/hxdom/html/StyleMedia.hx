package hxdom.html;

#if js
typedef StyleMedia = js.html.StyleMedia;
#else
class StyleMedia {
	
	public var type(default,null) : String;

	public function matchMedium( mediaquery : String ) : Bool {
		return null;
	}
	
}
#end