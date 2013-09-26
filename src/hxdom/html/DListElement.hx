package hxdom;

#if js
typedef DListElement = js.html.DListElement;
#else
class DListElement extends Element {
	
	/** Indicates that spacing between list items should be reduced. */
	public var compact:Bool;
	
}
#end