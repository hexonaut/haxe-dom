package hxdom;

#if js
typedef ValidityState = js.html.ValidityState;
#else
class ValidityState {
	
	/** The element's custom validity message has been set to a non-empty string by calling the element's setCustomValidity() method. */
	public var customError(default, null):Bool;

	/** The value does not match the specified 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/input#attr-pattern">pattern</a></code>
. */
	public var patternMismatch(default, null):Bool;

	/** The value is greater than the specified 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/input#attr-max">max</a></code>
. */
	public var rangeOverflow(default, null):Bool;

	/** The value is less than the specified 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/input#attr-min">min</a></code>
. */
	public var rangeUnderflow(default, null):Bool;

	/** The value does not fit the rules determined by 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/input#attr-step">step</a></code>
. */
	public var stepMismatch(default, null):Bool;

	/** <p>The value exceeds the specified <strong>maxlength</strong> for <a title="en/DOM/HTMLInputElement" rel="internal" href="https://developer.mozilla.org/en/DOM/HTMLInputElement">HTMLInputElement</a> or <a title="en/DOM/textarea" rel="internal" href="https://developer.mozilla.org/en/DOM/HTMLTextAreaElement">HTMLTextAreaElement</a> objects.</p> <div class="note"><strong>Note:</strong> This will never be <code>true</code> in Gecko, because elements' values are prevented from being longer than <strong>maxlength</strong>.</div> */
	public var tooLong(default, null):Bool;

	/** The value is not in the required syntax (when 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/input#attr-type">type</a></code>
 is <code>email</code> or <code>url</code>). */
	public var typeMismatch(default, null):Bool;

	/** No other constraint validation conditions are true. */
	public var valid(default, null):Bool;

	/** The element has a 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/input#attr-required">required</a></code>
 attribute, but no value. */
	public var valueMissing(default, null):Bool;
	
}
#end