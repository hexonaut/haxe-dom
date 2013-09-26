package hxdom.html;

#if js
typedef TreeWalker = js.html.TreeWalker;
#else
class TreeWalker {
	
	/** Setter throws DOMException. */
	public var currentNode:Node;

	public var expandEntityReferences(default, null):Bool;

	public var filter(default, null):NodeFilter;

	public var root(default, null):Node;

	public var whatToShow(default, null):Int;

	function firstChild ():Node {
		return null;
	}

	function lastChild ():Node {
		return null;
	}

	function nextNode ():Node {
		return null;
	}

	function nextSibling ():Node {
		return null;
	}

	function parentNode ():Node {
		return null;
	}

	function previousNode ():Node {
		return null;
	}

	function previousSibling ():Node {
		return null;
	}
	
}
#end