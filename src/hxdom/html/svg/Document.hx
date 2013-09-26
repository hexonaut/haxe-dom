package hxdom.html.svg;

#if js
typedef Document = js.html.svg.Document;
#else
class Document extends hxdom.html.Document {
	
	public var rootElement(default, null):SVGElement;
	
}
#end