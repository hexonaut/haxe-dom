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
typedef Attr = js.html.Attr;
#else
class Attr extends Node {
	
	/** Indicates whether the attribute is an "ID attribute". An "ID attribute" being an attribute which value is expected to be unique across a DOM Document. In HTML DOM, "id" is the only ID attribute, but XML documents could define others. Whether or not an attribute is unique is often determined by a DTD or other schema description. */
	public var isId(default, null):Bool;

	/** The attribute's name. */
	public var name(default, null):String;

	/** This property has been deprecated and will be removed in the future. Since you can only get Attr objects from elements, you should already know th */
	public var ownerElement(default, null):Element;

	/** This property has been deprecated and will be removed in the future; it now always returns <code>true</code>. */
	public var specified(default, null):Bool;

	/** The attribute's value. Setter throws DOMException. */
	public var value:String;
	
}
#end