package hxdom;

#if js
typedef BRElement = js.html.BRElement;
#else
class BRElement extends Element {
	
	/** Indicates flow of text around floating objects. */
	public var clear:String;
	
}
#end