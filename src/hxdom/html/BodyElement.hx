package hxdom.html;

#if js
typedef BodyElement = js.html.BodyElement;
#else
class BodyElement extends Element {
	
	/** Color of active hyperlinks. */
	public var aLink:String;

	/** <p>URI for a background image resource.</p> <div class="note"><strong>Note:</strong> Starting in Gecko 7.0 (Firefox 7.0 / Thunderbird 7.0 / SeaMonkey 2.4)
, this value is no longer resolved as a URI; instead, it's treated as a simple string.</div> */
	public var background:String;

	/** Background color for the document. */
	public var bgColor:String;

	/** Color of unvisited links. */
	public var link:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/body#attr-onbeforeunload">onbeforeunload</a></code>
 HTML&nbsp;attribute value for a function to call when the document is about to be unloaded. */
	public var onbeforeunload:EventListener;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/body#attr-onhashchange">onhashchange</a></code>
 HTML&nbsp;attribute value for a function to call when the fragment identifier in the address of the document changes. */
	public var onhashchange:EventListener;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/body#attr-onmessage">onmessage</a></code>
 HTML&nbsp;attribute value for a function to call when the document receives a message. */
	public var onmessage:EventListener;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/body#attr-onoffline">onoffline</a></code>
 HTML&nbsp;attribute value for a function to call when network communication fails. */
	public var onoffline:EventListener;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/body#attr-ononline">ononline</a></code>
 HTML&nbsp;attribute value for a function to call when network communication is restored. */
	public var ononline:EventListener;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/body#attr-onpopstate">onpopstate</a></code>
 HTML&nbsp;attribute value for a function to call when the user has navigated session history. */
	public var onpopstate:EventListener;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/body#attr-onresize">onresize</a></code>
 HTML&nbsp;attribute value for a function to call when the document has been resized. */
	public var onresize:EventListener;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/body#attr-onpopstate">onpopstate</a></code>
 HTML&nbsp;attribute value for a function to call when the storage area has changed. */
	public var onstorage:EventListener;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/body#attr-onunload">onunload</a></code>
 HTML&nbsp;attribute value for a function to call when when the document is going away. */
	public var onunload:EventListener;

	/** Foreground color of text. */
	public var text:String;

	/** Color of visited links. */
	public var vLink:String;
	
}
#end