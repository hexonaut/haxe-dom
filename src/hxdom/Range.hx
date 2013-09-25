package hxdom;

#if js
typedef Range = js.html.Range;
#else
class Range {
	
	public static inline var END_TO_END:Int = 2;

	public static inline var END_TO_START:Int = 3;

	public static inline var NODE_AFTER:Int = 1;

	public static inline var NODE_BEFORE:Int = 0;

	public static inline var NODE_BEFORE_AND_AFTER:Int = 2;

	public static inline var NODE_INSIDE:Int = 3;

	public static inline var START_TO_END:Int = 1;

	public static inline var START_TO_START:Int = 0;

	/** Returns a&nbsp;<code>boolean</code>&nbsp;indicating whether the range's start and end points are at the same position. Getter throws DOMException. */
	public var collapsed(default, null):Bool;

	/** Returns the deepest&nbsp;<code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Node">Node</a></code>
&nbsp;that contains the startContainer and endContainer Nodes. Getter throws DOMException. */
	public var commonAncestorContainer(default, null):Node;

	/** Returns the&nbsp;<code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Node">Node</a></code>
&nbsp;within which the Range ends. Getter throws DOMException. */
	public var endContainer(default, null):Node;

	/** Returns a number representing where in the endContainer the Range ends. Getter throws DOMException. */
	public var endOffset(default, null):Int;

	/** Returns the&nbsp;<code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Node">Node</a></code>
&nbsp;within which the Range starts. Getter throws DOMException. */
	public var startContainer(default, null):Node;

	/** Returns a number representing where in the startContainer the Range starts. Getter throws DOMException. */
	public var startOffset(default, null):Int;

	public function cloneContents ():DocumentFragment {
		
	}

	public function cloneRange ():Range {
		
	}

	public function collapse (toStart:Bool):Void {
		
	}

	public function compareBoundaryPoints (how:Int, sourceRange:Range):Int {
		
	}

	public function compareNode (refNode:Node):Int {
		
	}

	public function comparePoint (refNode:Node, offset:Int):Int {
		
	}

	public function createContextualFragment (html:String):DocumentFragment {
		
	}

	public function deleteContents ():Void {
		
	}

	public function detach ():Void {
		
	}

	public function expand (unit:String):Void {
		
	}

	public function extractContents ():DocumentFragment {
		
	}

	public function getBoundingClientRect ():ClientRect {
		
	}

	public function getClientRects ():ClientRectList {
		
	}

	public function insertNode (newNode:Node):Void {
		
	}

	public function intersectsNode (refNode:Node):Bool {
		
	}

	public function isPointInRange (refNode:Node, offset:Int):Bool {
		
	}

	public function selectNode (refNode:Node):Void {
		
	}

	public function selectNodeContents (refNode:Node):Void {
		
	}

	public function setEnd (refNode:Node, offset:Int):Void {
		
	}

	public function setEndAfter (refNode:Node):Void {
		
	}

	public function setEndBefore (refNode:Node):Void {
		
	}

	public function setStart (refNode:Node, offset:Int):Void {
		
	}

	public function setStartAfter (refNode:Node):Void {
		
	}

	public function setStartBefore (refNode:Node):Void {
		
	}

	public function surroundContents (newParent:Node):Void {
		
	}

	public function toString ():String {
		
	}
	
}
#end