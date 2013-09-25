package hxdom;

#if js
typedef OptGroupElement = js.html.OptGroupElement;
#else
class OptGroupElement extends Element {
	
	/** If this Boolean attribute is set, none of the items in this option group is selectable. Often browsers grey out such control and it won't received any browsing events, like mouse clicks or focus-related ones. */
	public var disabled:Bool;

	/** The name of the group of options, which the browser can use when labeling the options in the user interface. This attribute is mandatory if this element is used. */
	public var label:String;
	
}
#end