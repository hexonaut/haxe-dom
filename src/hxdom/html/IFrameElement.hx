package hxdom.html;

#if js
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