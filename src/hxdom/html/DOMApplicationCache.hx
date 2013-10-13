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
typedef DOMApplicationCache = js.html.DOMApplicationCache;
#else
class DOMApplicationCache extends EventTarget {
	
	public static inline var CHECKING : Int = 2;

	public static inline var DOWNLOADING : Int = 3;

	public static inline var IDLE : Int = 1;

	public static inline var OBSOLETE : Int = 5;

	public static inline var UNCACHED : Int = 0;

	public static inline var UPDATEREADY : Int = 4;

	public var oncached : EventListener;

	public var onchecking : EventListener;

	public var ondownloading : EventListener;

	public var onerror : EventListener;

	public var onnoupdate : EventListener;

	public var onobsolete : EventListener;

	public var onprogress : EventListener;

	public var onupdateready : EventListener;

	public var status(default,null) : Int;

	public function abort() : Void {
		
	}

	public function swapCache() : Void {
		
	}

	public function update() : Void {
		
	}
	
}
#end