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
typedef DOMPlugin = js.html.DOMPlugin;
#else
class DOMPlugin implements ArrayAccess<DOMMimeType> {
	
	/** A human readable description of the plugin. <strong>Read only.</strong> */
	public var description(default,null) : String;

	/** The filename of the plugin file. <strong>Read only.</strong> */
	public var filename(default,null) : String;

	public var length(default,null) : Int;

	/** The name of the plugin. <strong>Read only.</strong> */
	public var name(default,null) : String;

	public function item( index : Int ) : DOMMimeType {
		return null;
	}

	public function namedItem( name : String ) : DOMMimeType {
		return null;
	}
	
}
#end