package hxdom;

#if js
typedef TitleElement = js.html.TitleElement;
#else
class TitleElement extends Element {
	
	/** Gets or sets the text content of the document's title. */
	public var text:String;
	
}
#end