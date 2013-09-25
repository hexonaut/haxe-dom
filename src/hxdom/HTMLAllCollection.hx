package hxdom;

#if js
typedef HTMLAllCollection = js.html.HTMLAllCollection;
#else
class HTMLAllCollection implements ArrayAccess<Node> {
	
	var length(default, null):Int;

	function item (index:Int):Node {
		
	}

	function namedItem (name:String):Node {
		
	}

	function tags (name:String):NodeList {
		
	}
	
}
#end