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