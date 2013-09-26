package hxdom.svg;

#if js
typedef Document = js.html.svg.Document;
#else
class Document extends hxdom.Document {
	
	public var rootElement(default, null):SVGElement;
	
}
#end