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
typedef CharacterData = js.html.CharacterData;
#else
class CharacterData extends Node {
	
	/** Setter throws DOMException. */
	public var data : String;

	public var length(default, null) : Int;

	public function appendData( data : String ) : Void {
		
	}

	public function deleteData( offset : Int, length : Int ) : Void {
		
	}

	public function insertData( offset : Int, data : String ) : Void {
		
	}

	public function remove() : Void {
		
	}

	public function replaceData( offset : Int, length : Int, data : String ) : Void {
		
	}

	public function substringData( offset : Int, length : Int ) : String {
		return null;
	}
	
}
#end