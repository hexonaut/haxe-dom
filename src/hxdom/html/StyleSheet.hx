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
typedef StyleSheet = js.html.StyleSheet;
#else
class StyleSheet {
	
	/** This property indicates whether the current stylesheet has been applied or not. */
	public var disabled:Bool;

	/** Returns the location of the stylesheet. */
	public var href(default, null):String;

	/** Specifies the intended destination medium for style information. */
	public var media(default, null):MediaList;

	/** Returns the node that associates this style sheet with the document. */
	public var ownerNode(default, null):Node;

	/** Returns the stylesheet that is including this one, if any. */
	public var parentStyleSheet(default, null):StyleSheet;

	/** Returns the advisory title of the current style sheet. */
	public var title(default, null):String;

	/** Specifies the style sheet language for this style sheet. */
	public var type(default, null):String;
	
}
#end