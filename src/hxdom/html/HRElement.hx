package hxdom.html;

#if js
typedef HRElement = js.html.HRElement;
#else
class HRElement extends Element {
	
	/** Enumerated attribute indicating alignment of the rule with respect to the surrounding context. */
	public var align:String;

	public var noShade:Bool;

	/** The height of the rule. */
	public var size:String;

	/** The width of the rule on the page. */
	public var width:String;
	
}
#end