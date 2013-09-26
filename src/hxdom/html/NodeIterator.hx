package hxdom.html;

#if js
typedef NodeIterator = js.html.NodeIterator;
#else
class NodeIterator {
	
	public var expandEntityReferences(default,null):Bool;

	public var filter(default,null):NodeFilter;

	public var pointerBeforeReferenceNode(default,null):Bool;

	public var referenceNode(default,null):Node;

	public var root(default,null):Node;

	public var whatToShow(default,null):Int;

	public function detach ():Void {
		
	}

	public function nextNode ():Node {
		return null;
	}

	public function previousNode ():Node {
		return null;
	}
	
}
#end