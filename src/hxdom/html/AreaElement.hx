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
typedef AreaElement = js.html.AreaElement;
#else
class AreaElement extends Element {
	
	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/area#attr-alt">alt</a></code>
 HTML attribute, containing alternative text for the element. */
	public var alt:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/area#attr-coords">coords</a></code>
 HTML attribute, containing coordinates to define the hot-spot region. */
	public var coords:String;

	/** The fragment identifier (including the leading hash mark (#)), if any, in the referenced URL. */
	public var hash(default, null):String;

	/** The hostname and port (if it's not the default port) in the referenced URL. */
	public var host(default, null):String;

	/** The hostname in the referenced URL. */
	public var hostname(default, null):String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/area#attr-href">href</a></code>
 HTML attribute, containing a valid URL&nbsp;of a linked resource. */
	public var href:String;

	/** Indicates that this area is inactive. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> */
	public var noHref:Bool;

	/** The path name component, if any, of the referenced URL. */
	public var pathname(default, null):String;

	public var ping:String;

	/** The port component, if any, of the referenced URL. */
	public var port(default, null):String;

	/** The protocol component (including trailing colon (:)), of the referenced URL. */
	public var protocol(default, null):String;

	/** The search element (including leading question mark (?)), if any, of the referenced URL */
	public var search(default, null):String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/area#attr-shape">shape</a></code>
 HTML&nbsp;attribute, indicating the shape of the hot-spot, limited to known values. */
	public var shape:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/area#attr-target">target</a></code>
 HTML&nbsp;attribute, indicating the browsing context in which to open the linked resource. */
	public var target:String;
	
}
#end