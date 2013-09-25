package hxdom;

#if js
typedef NamedNodeMap = js.html.NamedNodeMap;
#else
class NamedNodeMap extends ArrayAccess<Node> {
	
	public var length(default, null):Int;
	
	public function new () {
		
	}

	public function getNamedItem (name:String):Node {
		
	}

	public function getNamedItemNS (?namespaceURI:String, localName:String):Node {
		
	}

	public function item (index:Int):Node {
		
	}

	public function removeNamedItem (name:String):Node {
		
	}

	public function removeNamedItemNS (?namespaceURI:String, localName:String):Node {
		
	}

	public function setNamedItem (node:Node):Node {
		
	}

	public function setNamedItemNS ( node:Node ):Node {
		
	}
	
}
#end