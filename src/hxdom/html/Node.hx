package hxdom;

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

	public function appendChild (newChild:Node):Node {
		return null;
	}

	public function cloneNode (deep:Bool):Node {
		return null;
	}

	public function compareDocumentPosition (other:Node):Int {
		return null;
	}

	public function contains (other:Node):Bool {
		return null;
	}

	public function hasAttributes ():Bool {
		return null;
	}

	public function hasChildNodes ():Bool {
		return null;
	}

	public function insertBefore (newChild:Node, refChild:Node):Node {
		return null;
	}

	public function isDefaultNamespace (?namespaceURI:String):Bool {
		return null;
	}

	public function isEqualNode (other:Node):Bool {
		return null;
	}

	public function isSameNode (other:Node):Bool {
		return null;
	}

	public function isSupported (feature:String, ?version:String):Bool {
		return null;
	}

	public function lookupNamespaceURI (?prefix:String):String {
		return null;
	}

	public function lookupPrefix (?namespaceURI:String):String {
		return null;
	}

	public function normalize ():Void {
		
	}

	public function removeChild (oldChild:Node):Node {
		return null;
	}

	public function replaceChild (newChild:Node, oldChild:Node):Node {
		return null;
	}
	
}
#end