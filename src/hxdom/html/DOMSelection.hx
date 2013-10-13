/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.html;

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
		return null;
	}

	function deleteFromDocument ():Void {
		
	}

	function empty ():Void {
		
	}

	function extend (node:Node, offset:Int):Void {
		
	}

	function getRangeAt (index:Int):Range {
		return null;
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
		return null;
	}
	
}
#end