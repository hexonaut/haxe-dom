package hxdom;

#if js
typedef EmbedElement = js.html.EmbedElement;
#else
class EmbedElement extends Element {
	
	public var align:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/embed#attr-height">height</a></code>
 HTML&nbsp;attribute, containing the displayed height of the resource. */
	public var height:String;

	public var name:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/embed#attr-src">src</a></code>
 HTML&nbsp;attribute, containing the address of the resource. */
	public var src:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/embed#attr-type">type</a></code>
 HTML&nbsp;attribute, containing the type of the resource. */
	public var type:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/embed#attr-width">width</a></code>
 HTML&nbsp;attribute, containing the displayed width of the resource. */
	public var width:String;

	public function getSVGDocument ():hxdom.svg.Document {
		
	}
	
}
#end