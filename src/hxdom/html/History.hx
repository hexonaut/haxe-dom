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
typedef History = js.html.History;
#else
class History {
	
	/** Read-only. Returns the number of elements in the session history, including the currently loaded page. For example, for a page loaded in a new tab this property returns <code>1</code>. */
	public var length(default,null) : Int;

	/** Returns the state at the top of the history stack. This is a way to look at the state without having to wait for a <code>popstate</code> event. <strong>Read only.</strong> */
	public var state(default,null) : Dynamic;

	public function back() : Void {
		
	}

	public function forward() : Void {
		
	}

	public function go( distance : Int ) : Void {
		
	}

	public function pushState( data : Dynamic, title : String, ?url : String ) : Void {
		
	}

	public function replaceState( data : Dynamic, title : String, ?url : String ) : Void {
		
	}
	
}
#end