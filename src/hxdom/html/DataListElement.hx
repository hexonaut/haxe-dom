package hxdom;

#if js
typedef DataListElement = js.html.DataListElement;
#else
class DataListElement extends Element {
	
	/** A collection of the contained option elements. */
	public var options(default, null):HTMLCollection;
	
}
#end