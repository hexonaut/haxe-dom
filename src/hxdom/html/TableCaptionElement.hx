package hxdom.html;

#if js
typedef TableCaptionElement = js.html.TableCaptionElement;
#else
class TableCaptionElement extends Element {
	
	/** Enumerated attribute indicating alignment of the caption with respect to the table. */
	public var align:String;
	
}
#end