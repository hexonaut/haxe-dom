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
typedef Clipboard = js.html.Clipboard;
#else
class Clipboard extends Element {
	
	public var dropEffect:String;

	public var effectAllowed:String;

	public var files(default, null):FileList;

	public var items(default, null):DataTransferItemList;

	public var types(default, null):Array<Dynamic>;
	
	public function new () {
		
	}
	
	public function clearData (?type:String):Void {
		
	}

	public function getData (type:String):String {
		return null;
	}

	public function setData (type:String, data:String):Bool {
		return null;
	}

	public function setDragImage (image:ImageElement, x:Int, y:Int):Void {
		
	}
	
}
#end