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
typedef Element = js.html.Element;
#else
class Element extends Node {

	public static inline var ALLOW_KEYBOARD_INPUT:Int = 1;
	
	public var accessKey:String;

	/** The number of child nodes that are elements. */
	public var childElementCount(default, null):Int;

	/** A live <code><a rel="internal" href="https://developer.mozilla.org/Article_not_found?uri=en/XPCOM_Interface_Reference/nsIDOMNodeList&amp;ident=nsIDOMNodeList" class="new">nsIDOMNodeList</a></code>
 of the current child elements. */
	public var children(default, null):HTMLCollection;

	/** Token list of class attribute */
	public var classList(default, null):DOMTokenList;

	/** Gets/sets the class of the element. */
	public var className:String;

	/** The inner height of an element. */
	public var clientHeight(default, null):Int;

	/** The width of the left border of an element. */
	public var clientLeft(default, null):Int;

	/** The width of the top border of an element. */
	public var clientTop(default, null):Int;

	/** The inner width of an element. */
	public var clientWidth(default, null):Int;

	/** Gets/sets whether or not the element is editable. Setter throws DOMException. */
	public var contentEditable:String;

	/** Allows access to read and write custom data attributes on the element. */
	public var dataset(default, null):DOMStringMap;

	/** Gets/sets the directionality of the element. */
	public var dir:String;

	public var draggable:Bool;

	public var dropzone:String;

	/** The first direct child element of an element, or <code>null</code> if the element has no child elements. */
	public var firstElementChild(default, null):Element;

	public var hidden:Bool;

	/** Gets/sets the id of the element. */
	public var id:String;

	/** Gets/sets the markup of the element's content. Setter throws DOMException. */
	public var innerHTML:String;

	/** Setter throws DOMException. */
	public var innerText:String;

	/** Indicates whether or not the content of the element can be edited. Read only. */
	public var isContentEditable(default, null):Bool;

	/** Gets/sets the language of an element's attributes, text, and element contents. */
	public var lang:String;

	/** The last direct child element of an element, or <code>null</code> if the element has no child elements. */
	public var lastElementChild(default, null):Element;

	/** The element immediately following the given one in the tree, or <code>null</code> if there's no sibling node. */
	public var nextElementSibling(default, null):Element;

	/** The height of an element, relative to the layout. */
	public var offsetHeight(default, null):Int;

	/** The distance from this element's left border to its <code>offsetParent</code>'s left border. */
	public var offsetLeft(default, null):Int;

	/** The element from which all offset calculations are currently computed. */
	public var offsetParent(default, null):Element;

	/** The distance from this element's top border to its <code>offsetParent</code>'s top border. */
	public var offsetTop(default, null):Int;

	/** The width of an element, relative to the layout. */
	public var offsetWidth(default, null):Int;

	public var onabort:EventListener;

	public var onbeforecopy:EventListener;

	public var onbeforecut:EventListener;

	public var onbeforepaste:EventListener;

	/** Returns the event handling code for the blur event. */
	public var onblur:EventListener;

	/** Returns the event handling code for the change event. */
	public var onchange:EventListener;

	/** Returns the event handling code for the click event. */
	public var onclick:EventListener;

	/** Returns the event handling code for the contextmenu event. */
	public var oncontextmenu:EventListener;

	/** Returns the event handling code for the copy event. */
	public var oncopy:EventListener;

	/** Returns the event handling code for the cut event. */
	public var oncut:EventListener;

	/** Returns the event handling code for the dblclick event. */
	public var ondblclick:EventListener;

	public var ondrag:EventListener;

	public var ondragend:EventListener;

	public var ondragenter:EventListener;

	public var ondragleave:EventListener;

	public var ondragover:EventListener;

	public var ondragstart:EventListener;

	public var ondrop:EventListener;

	public var onerror:EventListener;

	/** Returns the event handling code for the focus event. */
	public var onfocus:EventListener;

	public var onfullscreenchange:EventListener;

	public var onfullscreenerror:EventListener;

	public var oninput:EventListener;

	public var oninvalid:EventListener;

	/** Returns the event handling code for the keydown event. */
	public var onkeydown:EventListener;

	/** Returns the event handling code for the keypress event. */
	public var onkeypress:EventListener;

	/** Returns the event handling code for the keyup event. */
	public var onkeyup:EventListener;

	public var onload:EventListener;

	/** Returns the event handling code for the mousedown event. */
	public var onmousedown:EventListener;

	/** Returns the event handling code for the mousemove event. */
	public var onmousemove:EventListener;

	/** Returns the event handling code for the mouseout event. */
	public var onmouseout:EventListener;

	/** Returns the event handling code for the mouseover event. */
	public var onmouseover:EventListener;

	/** Returns the event handling code for the mouseup event. */
	public var onmouseup:EventListener;

	public var onmousewheel:EventListener;

	/** Returns the event handling code for the paste event. */
	public var onpaste:EventListener;

	public var onreset:EventListener;

	/** Returns the event handling code for the scroll event. */
	public var onscroll:EventListener;

	public var onsearch:EventListener;

	public var onselect:EventListener;

	public var onselectstart:EventListener;

	public var onsubmit:EventListener;

	public var ontouchcancel:EventListener;

	public var ontouchend:EventListener;

	public var ontouchmove:EventListener;

	public var ontouchstart:EventListener;

	/** Gets the markup of the element including its content. When used as a setter, replaces the element with nodes parsed from the given string. Setter throws DOMException. */
	public var outerHTML:String;

	/** Setter throws DOMException. */
	public var outerText:String;

	/** The element immediately preceding the given one in the tree, or <code>null</code> if there is no sibling element. */
	public var previousElementSibling(default, null):Element;

	public var pseudo:String;

	/** The scroll view height of an element. */
	public var scrollHeight(default, null):Int;

	/** Gets/sets the left scroll offset of an element. */
	public var scrollLeft:Int;

	/** Gets/sets the top scroll offset of an element. */
	public var scrollTop:Int;

	/** The scroll view width of an element. */
	public var scrollWidth(default, null):Int;

	/** Controls <a title="en/Controlling_spell_checking_in_HTML_forms" rel="internal" href="https://developer.mozilla.org/en/HTML/Controlling_spell_checking_in_HTML_forms">spell-checking</a> (present on all HTML&nbsp;elements) */
	public var spellcheck:Bool;

	/** An object representing the declarations of an element's style attributes. */
	public var style(default, null):CSSStyleDeclaration;

	/** Gets/sets the position of the element in the tabbing order. */
	public var tabIndex:Int;

	/** The name of the tag for the given element. */
	public var tagName(default, null):String;

	/** A string that appears in a popup box when mouse is over the element. */
	public var title:String;

	public var translate:Bool;

	public function blur ():Void {
		
	}

	public function click ():Void {
		
	}

	public function focus ():Void {
		
	}

	public function getAttribute (name:String):String {
		return null;
	}

	public function getAttributeNS (?namespaceURI:String, localName:String):String {
		return null;
	}

	public function getAttributeNode (name:String):Attr {
		return null;
	}

	public function getAttributeNodeNS (?namespaceURI:String, localName:String):Attr {
		return null;
	}

	public function getBoundingClientRect ():ClientRect {
		return null;
	}

	public function getClientRects ():ClientRectList {
		return null;
	}

	public function getElementsByClassName (name:String):NodeList {
		return null;
	}

	public function getElementsByTagName (name:String):NodeList {
		return null;
	}

	public function getElementsByTagNameNS (?namespaceURI:String, localName:String):NodeList {
		return null;
	}

	public function hasAttribute (name:String):Bool {
		return null;
	}

	public function hasAttributeNS (?namespaceURI:String, localName:String):Bool {
		return null;
	}

	public function insertAdjacentElement (where:String, element:Element):Element {
		return null;
	}

	public function insertAdjacentHTML (where:String, html:String):Void {
		
	}

	public function insertAdjacentText (where:String, text:String):Void {
		
	}

	public function matchesSelector (selectors:String):Bool {
		return null;
	}

	public function querySelector (selectors:String):Element {
		return null;
	}

	public function querySelectorAll (selectors:String):NodeList {
		return null;
	}

	public function remove ():Void {
		parentNode.removeChild(this);
	}

	public function removeAttribute (name:String):Void {
		
	}

	public function removeAttributeNS (namespaceURI:String, localName:String):Void {
		
	}

	public function removeAttributeNode (oldAttr:Attr):Attr {
		return null;
	}

	public function requestFullScreen (flags:Int):Void {
		
	}

	public function requestFullscreen ():Void {
		
	}

	public function requestPointerLock ():Void {
		
	}

	public function scrollByLines (lines:Int):Void {
		
	}

	public function scrollByPages (pages:Int):Void {
		
	}

	public function scrollIntoView (?alignWithTop:Bool):Void {
		
	}

	public function scrollIntoViewIfNeeded (?centerIfNeeded:Bool):Void {
		
	}

	public function setAttribute (name:String, value:String):Void {
		
	}

	public function setAttributeNS (?namespaceURI:String, qualifiedName:String, value:String):Void {
		
	}

	public function setAttributeNode (newAttr:Attr):Attr {
		return null;
	}

	public function setAttributeNodeNS (newAttr:Attr):Attr {
		return null;
	}
	
}
#end