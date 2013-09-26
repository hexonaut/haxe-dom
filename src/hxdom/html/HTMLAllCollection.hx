package hxdom.html;

#if js
typedef HTMLAllCollection = js.html.HTMLAllCollection;
#else
class HTMLAllCollection implements ArrayAccess<Node> {
	
	var length(default, null):Int;

	function item (index:Int):Node {
		return null;
	}

	function namedItem (name:String):Node {
		return null;
	}

	function tags (name:String):NodeList {
		return null;
	}
	
}
#end