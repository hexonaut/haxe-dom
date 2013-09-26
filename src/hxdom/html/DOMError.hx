package hxdom;

#if js
typedef DOMError = js.html.DOMError;
#else
class DOMError {
	
	public var name(default,null) : String;
	
}
#end