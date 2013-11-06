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

#if (js && !use_vdom)
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
		return null;
	}

	public function cloneRange ():Range {
		return null;
	}

	public function collapse (toStart:Bool):Void {
		
	}

	public function compareBoundaryPoints (how:Int, sourceRange:Range):Int {
		return null;
	}

	public function compareNode (refNode:Node):Int {
		return null;
	}

	public function comparePoint (refNode:Node, offset:Int):Int {
		return null;
	}

	public function createContextualFragment (html:String):DocumentFragment {
		return null;
	}

	public function deleteContents ():Void {
		
	}

	public function detach ():Void {
		
	}

	public function expand (unit:String):Void {
		
	}

	public function extractContents ():DocumentFragment {
		return null;
	}

	public function getBoundingClientRect ():ClientRect {
		return null;
	}

	public function getClientRects ():ClientRectList {
		return null;
	}

	public function insertNode (newNode:Node):Void {
		
	}

	public function intersectsNode (refNode:Node):Bool {
		return null;
	}

	public function isPointInRange (refNode:Node, offset:Int):Bool {
		return null;
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
		return null;
	}
	
}
#end