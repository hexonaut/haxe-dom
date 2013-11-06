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
typedef IFrameElement = js.html.IFrameElement;
#else
class IFrameElement extends Element {
	
	/** Specifies the alignment of the frame with respect to the surrounding context. */
	public var align:String;

	/** The active document in the inline frame's nested browsing context. */
	public var contentDocument(default, null):Document;

	/** The window proxy for the nested browsing context. */
	public var contentWindow(default, null):DOMWindow;

	public var frameBorder:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/iframe#attr-height">height</a></code>
 HTML&nbsp;attribute, indicating the height of the frame. */
	public var height:String;

	/** URI of a long description of the frame. */
	public var longDesc:String;

	/** Height of the frame margin. */
	public var marginHeight:String;

	/** Width of the frame margin. */
	public var marginWidth:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/iframe#attr-name">name</a></code>
 HTML&nbsp;attribute, containing a name by which to refer to the frame. */
	public var name:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/iframe#attr-sandbox">sandbox</a></code>
 HTML&nbsp;attribute, indicating extra restrictions on the behavior of the nested content. */
	public var sandbox:String;

	/** Indicates whether the browser should provide scrollbars for the frame. */
	public var scrolling:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/iframe#attr-src">src</a></code>
 HTML&nbsp;attribute, containing the address of the content to be embedded. */
	public var src:String;

	/** The content to display in the frame. */
	public var srcdoc:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/iframe#attr-width">width</a></code>
&nbsp;HTML&nbsp;attribute, indicating the width of the frame. */
	public var width:String;

	public function getSVGDocument ():hxdom.html.svg.Document {
		return null;
	}
	
}
#end