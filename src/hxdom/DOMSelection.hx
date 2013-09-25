package hxdom;

#if js
typedef DOMSelection = js.html.DOMSelection;
#else
class DOMSelection {
	
	/** Returns the node in which the selection begins. */
	public var anchorNode(default, null):Node;

	/** Returns the number of characters that the selection's anchor is offset within the anchorNode. */
	public var anchorOffset(default, null):Int;

	public var baseNode(default, null):Node;

	public var baseOffset(default, null):Int;

	public var extentNode(default, null):Node;

	public var extentOffset(default, null):Int;

	/** Returns the node in which the selection ends. */
	public var focusNode(default, null):Node;

	/** Returns the number of characters that the selection's focus is offset within the focusNode. */
	public var focusOffset(default, null):Int;

	/** Returns a Boolean indicating whether the selection's start and end points are at the same position. */
	public var isCollapsed(default, null):Bool;

	/** Returns the number of ranges in the selection. */
	public var rangeCount(default, null):Int;

	public var type(default, null):String;

	function addRange (range:Range):Void {
		
	}

	function collapse (node:Node, index:Int):Void {
		
	}

	function collapseToEnd ():Void {
		
	}

	function collapseToStart ():Void {
		
	}

	function containsNode (node:Node, allowPartial:Bool):Bool {
		
	}

	function deleteFromDocument ():Void {
		
	}

	function empty ():Void {
		
	}

	function extend (node:Node, offset:Int):Void {
		
	}

	function getRangeAt (index:Int):Range {
		
	}

	function modify (alter:String, direction:String, granularity:String):Void {
		
	}

	function removeAllRanges ():Void {
		
	}

	function selectAllChildren (node:Node):Void {
		
	}

	function setBaseAndExtent (baseNode:Node, baseOffset:Int, extentNode:Node, extentOffset:Int):Void {
		
	}

	function setPosition (node:Node, offset:Int):Void {
		
	}

	function toString ():String {
		
	}
	
}
#end