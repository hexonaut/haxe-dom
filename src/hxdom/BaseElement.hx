package hxdom;

#if js
typedef BaseElement = js.html.BaseElement;
#else
class BaseElement extends Element {
	
	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/base#attr-href">href</a></code>
 HTML attribute, containing a base URL for relative URLs in the document. */
	public var href:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/base#attr-target">target</a></code>
 HTML attribute, containing a default target browsing context or frame for elements that do not have a target reference specified. */
	public var target:String;
	
}
#end