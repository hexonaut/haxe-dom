package hxdom;

#if js
typedef DirectoryElement = js.html.DirectoryElement;
#else
class DirectoryElement extends Element {
	
	/** This Boolean attribute hints that the list should be rendered in a compact style. The interpretation of this attribute depends on the user agent and it doesn't work in all browsers. <div class="note"><strong>Usage note:&nbsp;</strong>Do not use this attribute, as it has been deprecated: the <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/dir">&lt;dir&gt;</a></code>
 element should be styled using <a title="en/CSS" rel="internal" href="https://developer.mozilla.org/en/CSS">CSS</a>. To give a similar effect than the <span>compact</span> attribute, the <a title="en/CSS" rel="internal" href="https://developer.mozilla.org/en/CSS">CSS</a> property <a title="en/CSS/line-height" rel="internal" href="https://developer.mozilla.org/en/CSS/line-height">line-height</a> can be used with a value of <span>80%</span>.</div> */
	public var compact:Bool;
	
}
#end