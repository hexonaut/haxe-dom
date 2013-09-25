package hxdom;

#if js
typedef HTMLCollection = js.html.HTMLCollection;
#else
class HTMLCollection implements ArrayAccess<Node> {
	
	/** The number of items in the collection. <strong>Read only</strong>. */
	public var length(default, null):Int;

	function item (index:Int):Node;

	function namedItem (name:String):Node;

	
}
#end