package hxdom.html;

#if js
typedef AnchorElement = js.html.AnchorElement;
#else
class AnchorElement extends Element {
	
	/** The character encoding of the linked resource. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> */
	public var charset:String;

	/** Comma-separated list of coordinates. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> */
	public var coords:String;

	public var download:String;

	/** The fragment identifier (including the leading hash mark (#)), if any, in the referenced URL. */
	public var hash:String;

	/** The hostname and port (if it's not the default port) in the referenced URL. */
	public var host:String;

	/** The hostname in the referenced URL. */
	public var hostname:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/a#attr-href">href</a></code>
 HTML attribute, containing a valid URL of a linked resource. */
	public var href:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/a#attr-hreflang">hreflang</a></code>
 HTML&nbsp;attribute, indicating the language of the linked resource. */
	public var hreflang:String;

	/** Anchor name. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> */
	public var name:String;

	public var origin(default, null):String;

	/** The path name component, if any, of the referenced URL. */
	public var pathname:String;

	public var ping:String;

	/** The port component, if any, of the referenced URL. */
	public var port:String;

	/** The protocol component (including trailing colon (:)), of the referenced URL. */
	public var protocol:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/a#attr-rel">rel</a></code>
 HTML attribute, specifying the relationship of the target object to the link object. */
	public var rel:String;

	/** Reverse link type. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> */
	public var rev:String;

	/** The search element (including leading question mark (?)), if any, of the referenced URL */
	public var search:String;

	/** The shape of the active area. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> */
	public var shape:String;

	/** Reflectst the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/a#attr-target">target</a></code>
 HTML attribute, indicating where to display the linked resource. */
	public var target:String;

	/** Same as the <strong><a title="https://developer.mozilla.org/En/DOM/Node.textContent" rel="internal" href="https://developer.mozilla.org/En/DOM/Node.textContent">textContent</a></strong> property. */
	public var text(default, null):String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/a#attr-type">type</a></code>
 HTML attribute, indicating the MIME type of the linked resource. */
	public var type:String;

	public function toString ():String {
		return null;
	}
	
}
#end