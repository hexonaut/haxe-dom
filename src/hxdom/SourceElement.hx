package hxdom;

#if js
typedef SourceElement = js.html.SourceElement;
#else
class SourceElement extends Element {
	
	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/source#attr-media">media</a></code>
 HTML&nbsp;attribute, containing the intended type of the media resource. */
	public var media:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/source#attr-src">src</a></code>
 HTML&nbsp;attribute, containing the URL&nbsp;for the media resource. */
	public var src:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/source#attr-type">type</a></code>
 HTML&nbsp;attribute, containing the type of the media resource. */
	public var type:String;
	
}
#end