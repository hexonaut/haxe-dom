package hxdom.html;

#if js
typedef NamedNodeMap = js.html.NamedNodeMap;
#else
class NamedNodeMap implements ArrayAccess<Node> {
	
	public var length(default, null):Int;
	
	public function new () {
		
	}

	public function getNamedItem (name:String):Node {
		return null;
	}

	public function getNamedItemNS (?namespaceURI:String, localName:String):Node {
		return null;
	}

	public function item (index:Int):Node {
		return null;
	}

	public function removeNamedItem (name:String):Node {
		return null;
	}

	public function removeNamedItemNS (?namespaceURI:String, localName:String):Node {
		return null;
	}

	public function setNamedItem (node:Node):Node {
		return null;
	}

	public function setNamedItemNS (node:Node):Node {
		return null;
	}
	
}
#end