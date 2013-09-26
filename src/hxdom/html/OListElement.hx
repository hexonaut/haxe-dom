package hxdom.html;

#if js
typedef OListElement = js.html.OListElement;
#else
class OListElement extends Element {
	
	/** This Boolean attribute hints that the list should be rendered in a compact style. The interpretation of this attribute depends on the user agent and it doesn't work in all browsers. <div class="note"><strong>Usage note:&nbsp;</strong>Do not use this attribute, as it has been deprecated: the <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/ol">&lt;ol&gt;</a></code>
 element should be styled using <a title="en/CSS" rel="internal" href="https://developer.mozilla.org/en/CSS">CSS</a>. To give a similar effect than the <span>compact</span> attribute, the <a title="en/CSS" rel="internal" href="https://developer.mozilla.org/en/CSS">CSS</a> property <code><a rel="custom" href="https://developer.mozilla.org/en/CSS/line-height">line-height</a></code>
 can be used with a value of <span>80%</span>.</div> */
	public var compact:Bool;

	/** This Boolean attribute specifies that the items of the item are specified in the reverse order, i.e. that the least important one is listed first. Browsers, by default, numbered the items in the reverse order too. */
	public var reversed:Bool;

	/** This integer attribute specifies the start value for numbering the individual list items. Although the ordering type of list elements might be Roman numerals, such as XXXI, or letters, the value of start is always represented as a number. To start numbering elements from the letter "C", use <code>&lt;ol start="3"&gt;</code>. <div class="note"><strong>Note</strong>: that attribute was deprecated in HTML4, but reintroduced in HTML5.</div> */
	public var start:Int;

	/** Indicates the numbering type: <ul> <li><span><code>'a'</code></span> indicates lowercase letters,</li> <li><span id="1284454877507S">&nbsp;</span><span><code>'<span id="1284454878023E">&nbsp;</span>A'</code></span> indicates uppercase letters,</li> <li><span><code>'i'</code></span> indicates lowercase Roman numerals,</li> <li><span><code>'I'</code></span> indicates uppercase Roman numerals,</li> <li>and <span><code>'1'</code></span> indicates numbers.</li> </ul> <p>The type set is used for the entire list unless a different 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/li#attr-type">type</a></code>
 attribute is used within an enclosed <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/li">&lt;li&gt;</a></code>
 element.</p> <div class="note"><strong>Usage note:&nbsp;</strong>Do not use this attribute, as it has been deprecated: use the <a title="en/CSS" rel="internal" href="https://developer.mozilla.org/en/CSS">CSS</a> <code><a rel="custom" href="https://developer.mozilla.org/en/CSS/list-style-type">list-style-type</a></code>
 property instead.</div> */
	public var type:String;
	
}
#end