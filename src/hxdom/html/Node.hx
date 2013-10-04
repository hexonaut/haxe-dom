package hxdom.html;

#if js
typedef Node = js.html.Node;
#else
class Node extends EventTarget {
	
	public static inline var ATTRIBUTE_NODE:Int = 2;
	
	public static inline var CDATA_SECTION_NODE:Int = 4;
	
	public static inline var COMMENT_NODE:Int = 8;
	
	public static inline var DOCUMENT_FRAGMENT_NODE:Int = 11;
	
	public static inline var DOCUMENT_NODE:Int = 9;

	public static inline var DOCUMENT_POSITION_CONTAINED_BY:Int = 0x10;

	public static inline var DOCUMENT_POSITION_CONTAINS:Int = 0x08;

	public static inline var DOCUMENT_POSITION_DISCONNECTED:Int = 0x01;

	public static inline var DOCUMENT_POSITION_FOLLOWING:Int = 0x04;

	public static inline var DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC:Int = 0x20;

	public static inline var DOCUMENT_POSITION_PRECEDING:Int = 0x02;

	public static inline var DOCUMENT_TYPE_NODE:Int = 10;

	public static inline var ELEMENT_NODE:Int = 1;

	public static inline var ENTITY_NODE:Int = 6;

	public static inline var ENTITY_REFERENCE_NODE:Int = 5;

	public static inline var NOTATION_NODE:Int = 12;

	public static inline var PROCESSING_INSTRUCTION_NODE:Int = 7;

	public static inline var TEXT_NODE:Int = 3;

	public var attributes(default, null):NamedNodeMap;

	public var baseURI(default, null):String;

	public var childNodes(default, null):NodeList;
	
	public var firstChild(default, null):Node;
	
	public var lastChild(default, null):Node;
	
	public var localName(default, null):String;
	
	public var namespaceURI(default, null):String;
	
	public var nextSibling(default, null):Node;
	
	public var nodeName(default, null):String;
	
	public var nodeType(default, null):Int;
	
	/** Setter throws DOMException. */
	public var nodeValue:String;

	public var ownerDocument(default, null):Document;
	
	public var parentElement(default, null):Element;
	
	public var parentNode(default, null):Node;
	
	/** Setter throws DOMException. */
	public var prefix:String;
	
	public var previousSibling(default, null):Node;

	/** Setter throws DOMException. */
	public var textContent:String;
	
	inline function __add (i:Int, node:Node):Void {
		//Update sibling refs
		if (childNodes.length > 0) {
			if (childNodes.length == i) {
				//Last child
				childNodes[childNodes.length - 1].nextSibling = node;
				node.previousSibling = childNodes[childNodes.length - 1];
			} else if (i == 0) {
				//First child
				childNodes[0].previousSibling = node;
				node.nextSibling = childNodes[0];
			} else {
				//Somewhere in the middle
				childNodes[i - 1].nextSibling = node;
				node.previousSibling = childNodes[i - 1];
				
				childNodes[i].previousSibling = node;
				node.nextSibling = childNodes[i];
			}
		}
		
		//Insert element
		if (i != childNodes.length) childNodes.insert(i, node);
		else childNodes.push(node);
		
		//Update parent
		node.parentNode = this;
	}
	
	inline function __remove (i:Int, node:Node):Void {
		//Remove sibling refs
		if (node.previousSibling != null) node.previousSibling.nextSibling = node.nextSibling;
		if (node.nextSibling != null) node.nextSibling.previousSibling = node.previousSibling;
		
		//Null parent ref
		node.parentNode = null;
		
		//Remove from array
		childNodes.splice(i, 1);
	}
	
	public function appendChild (newChild:Node):Node {
		if (newChild.parentNode != null) newChild.parentNode.removeChild(newChild);
		__add(childNodes.length, newChild);
		
		return newChild;
	}

	public function cloneNode (deep:Bool):Node {
		throw "Not implemented.";
		
		return null;
	}

	public function compareDocumentPosition (other:Node):Int {
		throw "Not implemented.";
		
		return null;
	}

	public function contains (other:Node):Bool {
		var exists = false;
		for (i in childNodes) {
			if (i == other) return true;
		}
		return false;
	}

	public function hasAttributes ():Bool {
		throw "Depreciated.";
		
		return null;
	}

	public function hasChildNodes ():Bool {
		return childNodes.length > 0;
	}

	public function insertBefore (newChild:Node, ?refChild:Node):Node {
		var insertPos = childNodes.length;
		for (i in 0 ... childNodes.length) {
			if (childNodes[i] == refChild) {
				insertPos = i;
				break;
			}
		}
		__add(insertPos, newChild);
		return newChild;
	}

	public function isDefaultNamespace (?namespaceURI:String):Bool {
		throw "Not implemented.";
		
		return null;
	}

	public function isEqualNode (other:Node):Bool {
		return this == other;
	}

	public function isSameNode (other:Node):Bool {
		throw "Depreciated.";
		
		return null;
	}

	public function isSupported (feature:String, ?version:String):Bool {
		throw "Depreciated.";
		
		return null;
	}

	public function lookupNamespaceURI (?prefix:String):String {
		throw "Not implemented.";
		
		return null;
	}

	public function lookupPrefix (?namespaceURI:String):String {
		throw "Not implemented.";
		
		return null;
	}

	public function normalize ():Void {
		throw "Not implemented.";
	}

	public function removeChild (oldChild:Node):Node {
		for (i in 0 ... childNodes.length) {
			if (childNodes[i] == oldChild) {
				__remove(i, oldChild);
				return oldChild;
			}
		}
		throw "Not a child.";
	}

	public function replaceChild (newChild:Node, oldChild:Node):Node {
		//Remove from previous node if applicable
		if (newChild.parentNode != null) newChild.parentNode.removeChild(newChild);
		
		for (i in 0 ... childNodes.length) {
			if (childNodes[i] == oldChild) {
				__remove(i, oldChild);
				__add(i, newChild);
				break;
			}
		}
		return oldChild;
	}
	
}
#end