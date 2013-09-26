package hxdom;

#if js
typedef HTMLCollection = js.html.HTMLCollection;
#else
class HTMLCollection implements ArrayAccess<Node> {
	
	/** The number of items in the collection. <strong>Read only</strong>. */
	public var length(default, null):Int;

	public function item (index:Int):Node {
		return null;
	}

	public function namedItem (name:String):Node {
		return null;
	}

	
}
#end