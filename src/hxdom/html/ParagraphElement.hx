package hxdom.html;

#if js
typedef ParagraphElement = js.html.ParagraphElement;
#else
class ParagraphElement extends Element {
	
	/** Enumerated attribute indicating alignment of the element's contents with respect to the surrounding context. */
	public var align:String;
	
}
#end