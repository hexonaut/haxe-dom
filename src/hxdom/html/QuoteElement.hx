package hxdom.html;

#if js
typedef QuoteElement = js.html.QuoteElement;
#else
class QuoteElement extends Element {
	
	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/blockquote#attr-cite">cite</a></code>
 HTML attribute, containing a URL for the source of the quotation. */
	public var cite:String;
	
}
#end