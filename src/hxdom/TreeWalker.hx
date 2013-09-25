package hxdom;

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
		
	}

	function lastChild ():Node {
		
	}

	function nextNode ():Node {
		
	}

	function nextSibling ():Node {
		
	}

	function parentNode ():Node {
		
	}

	function previousNode ():Node {
		
	}

	function previousSibling ():Node {
		
	}
	
}
#end