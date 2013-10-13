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
typedef FrameElement = js.html.FrameElement;
#else
class FrameElement extends Element {
	
	public var contentDocument(default, null):Document;

	public var contentWindow(default, null):DOMWindow;

	public var frameBorder:String;

	public var height(default,null):Int;

	public var location:String;

	public var longDesc:String;

	public var marginHeight:String;

	public var marginWidth:String;

	/** This attribute is used to labeling frames. Without labeling all links will open in the frame that they are in. */
	public var name:String;

	public var noResize:Bool;

	/** This attribute defines existence of scrollbar. If this attribute is not used, browser put a scrollbar when necessary. There are two choices; "yes" for showing a scrollbar even when it is not necessary and "no" for do not showing a scrollbar even when it is necessary. */
	public var scrolling:String;

	/** This attribute is specify document which will be displayed by frame. */
	public var src:String;

	public var width(default, null):Int;

	public function getSVGDocument ():hxdom.html.svg.Document {
		return null;
	}
	
}
#end