package hxdom.html;

#if js
typedef ProgressElement = js.html.ProgressElement;
#else
class ProgressElement extends Element {
	
	public var labels(default, null):NodeList;

	/** This attribute describes how much work the task indicated by the <code>progress</code> element requires. Setter throws DOMException. */
	public var max:Float;

	public var position(default, null):Float;

	/** <dl><dd>This attribute specifies how much of the task that has been completed. If there is no <code>value</code> attribute, the progress bar is indeterminate; this indicates that an activity is ongoing with no indication of how long it is expected to take.</dd>
</dl>
<p>You can use the <code><a rel="custom" href="https://developer.mozilla.org/en/CSS/orient">orient</a></code>
 property to specify whether the progress bar should be rendered horizontally (the default) or vertically. The <code><a rel="custom" href="https://developer.mozilla.org/en/CSS/%3Aindeterminate">:indeterminate</a></code>
 pseudo-class can be used to match against indeterminate progress bars.</p> Setter throws DOMException. */
	public var value:Float;
	
}
#end