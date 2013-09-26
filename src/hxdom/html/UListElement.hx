package hxdom.html;

#if js
typedef UListElement = js.html.UListElement;
#else
class UListElement extends Element {
	
	/** This Boolean attribute hints that the list should be rendered in a compact style. The interpretation of this attribute depends on the user agent and it doesn't work in all browsers. <div class="note"><strong>Usage note:&nbsp;</strong>Do not use this attribute, as it has been deprecated: the <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/ol">&lt;ol&gt;</a></code>
 element should be styled using <a title="en/CSS" rel="internal" href="https://developer.mozilla.org/en/CSS">CSS</a>. To give a similar effect than the <span>compact</span> attribute, the <a title="en/CSS" rel="internal" href="https://developer.mozilla.org/en/CSS">CSS</a> property <a title="en/CSS/line-height" rel="internal" href="https://developer.mozilla.org/en/CSS/line-height">line-height</a> can be used with a value of <span>80%</span>.</div> */
	public var compact:Bool;

	/** Used to set the bullet style for the list. The values defined under <a title="en/HTML3.2" rel="internal" href="https://developer.mozilla.org/en/HTML3.2" class="new ">HTML3.2</a> and the transitional version of <a title="en/HTML4.01" rel="internal" href="https://developer.mozilla.org/en/HTML4.01" class="new ">HTML 4.0/4.01</a> are<span>:</span> <ul> <li><code>circle</code>,</li> <li><code>disc</code>,</li> <li>and <code>square</code>.</li> </ul> <p>A fourth bullet type has been defined in the WebTV interface, but not all browsers support it: <code>triangle.</code></p> <p>If not present and if no <a title="en/CSS" rel="internal" href="https://developer.mozilla.org/en/CSS">CSS</a> <code><a rel="custom" href="https://developer.mozilla.org/en/CSS/list-style-type">list-style-type</a></code>
 property does apply to the element, the user agent decide to use a kind of bullets depending on the nesting level of the list.</p> <div class="note"><strong>Usage note:</strong> Do not use this attribute, as it has been deprecated: use the <a title="en/CSS" rel="internal" href="https://developer.mozilla.org/en/CSS">CSS</a> <code><a rel="custom" href="https://developer.mozilla.org/en/CSS/list-style-type">list-style-type</a></code>
 property instead.</div> */
	public var type:String;
	
}
#end