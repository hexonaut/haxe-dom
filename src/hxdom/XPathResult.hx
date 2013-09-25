package hxdom;

#if js
typedef XPathResult = js.html.XPathResult;
#else
class XPathResult {
	
	/** A result set containing whatever type naturally results from evaluation of the expression. Note that if the result is a node-set then UNORDERED_NODE_ITERATOR_TYPE is always the resulting type. */
	public static inline var ANY_TYPE:Int = 0;

	/** A result node-set containing any single node that matches the expression. The node is not necessarily the first node in the document that matches the expression. */
	public static inline var ANY_UNORDERED_NODE_TYPE:Int = 8;

	/** A result containing a single boolean value. This is useful for example, in an XPath expression using the <code>not()</code> function. */
	public static inline var BOOLEAN_TYPE:Int = 3;

	/** A result node-set containing the first node in the document that matches the expression. */
	public static inline var FIRST_ORDERED_NODE_TYPE:Int = 9;

	/** A result containing a single number. This is useful for example, in an XPath expression using the <code>count()</code> function. */
	public static inline var NUMBER_TYPE:Int = 1;

	/** A result node-set containing all the nodes matching the expression. The nodes in the result set are in the same order that they appear in the document. */
	public static inline var ORDERED_NODE_ITERATOR_TYPE:Int = 5;

	/** A result node-set containing snapshots of all the nodes matching the expression. The nodes in the result set are in the same order that they appear in the document. */
	public static inline var ORDERED_NODE_SNAPSHOT_TYPE:Int = 7;

	/** A result containing a single string. */
	public static inline var STRING_TYPE:Int = 2;

	/** A result node-set containing all the nodes matching the expression. The nodes may not necessarily be in the same order that they appear in the document. */
	public static inline var UNORDERED_NODE_ITERATOR_TYPE:Int = 4;

	/** A result node-set containing snapshots of all the nodes matching the expression. The nodes may not necessarily be in the same order that they appear in the document. */
	public static inline var UNORDERED_NODE_SNAPSHOT_TYPE:Int = 6;

	/** readonly boolean Getter throws DOMException. */
	public var booleanValue(default ,null):Bool;

	/** readonly boolean */
	public var invalidIteratorState(default, null):Bool;

	/** readonly float Getter throws DOMException. */
	public var numberValue(default, null):Float;

	/** readonly integer (short) */
	public var resultType(default, null):Int;

	/** readonly Node Getter throws DOMException. */
	public var singleNodeValue(default, null):Node;

	/** readonly Integer Getter throws DOMException. */
	public var snapshotLength(default, null):Int;

	/** readonly String Getter throws DOMException. */
	public var stringValue(default, null):String;

	public function iterateNext ():Node {
		
	}

	public function snapshotItem (index:Int):Node {
		
	}
	
}
#end