package hxdom;

#if js
typedef HtmlElement = js.html.HtmlElement;
#else
class HtmlElement extends Element {
	
	public var manifest:String;

	/** Version of the HTML&nbsp;Document Type Definition that governs this document. */
	public var version:String;
	
}
#end