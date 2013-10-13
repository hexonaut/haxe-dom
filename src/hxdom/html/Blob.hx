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
typedef Blob = js.html.Blob;
#else
class Blob  {
	
	/** The size, in bytes, of the data contained in the <code>Blob</code> object. <strong>Read only.</strong> */
	public var size(default,null) : Int;

	/** An ASCII-encoded string, in all lower case, indicating the MIME&nbsp;type of the data contained in the <code>Blob</code>. If the type is unknown, this string is empty. <strong>Read only.</strong> */
	public var type(default,null) : String;

	public function new( ?arg0 : Dynamic, ?arg1 : Dynamic ) : Void {
		
	}

	public function slice( ?start : Int, ?end : Int, ?contentType : String ) : Blob {
		return null;
	}
	
}
#end