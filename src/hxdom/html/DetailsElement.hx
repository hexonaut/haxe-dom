package hxdom;

#if js
typedef DetailsElement = js.html.DetailsElement;
#else
class DetailsElement extends Element {
	
	/** This Boolean attribute indicates whether the details will be shown to the user on page load. If omitted the details will be hidden. */
	public var open:Bool;
	
}
#end