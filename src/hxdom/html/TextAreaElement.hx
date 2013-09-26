package hxdom;

#if js
typedef TextAreaElement = js.html.TextAreaElement;
#else
class TextAreaElement extends Element {
	
	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/textarea#attr-autofocus">autofocus</a></code>
 HTML&nbsp;attribute, indicating that the control should have input focus when the page loads */
	public var autofocus:Bool;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/textarea#attr-cols">cols</a></code>
 HTML attribute, indicating the visible width of the text area. */
	public var cols:Int;

	/** The control's default value, which behaves like the <strong><a title="en/DOM/element.textContent" rel="internal" href="https://developer.mozilla.org/En/DOM/Node.textContent">textContent</a></strong> property. */
	public var defaultValue:String;

	public var dirName:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/textarea#attr-disabled">disabled</a></code>
 HTML attribute, indicating that the control is not available for interaction. */
	public var disabled:Bool;

	/** <p>The containing form element, if this element is in a form. If this element is not contained in a form element:</p> <ul> <li>
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> this can be the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form#attr-id">id</a></code>
 attribute of any <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form">&lt;form&gt;</a></code>
 element in the same document.</li> <li>
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML">HTML 4</a></span> this must be <code>null</code>.</li> </ul> */
	public var form(default, null):FormElement;

	/** A list of <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/label">&lt;label&gt;</a></code>
 elements that are labels for this element. */
	public var labels(default, null):NodeList;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/textarea#attr-maxlength">maxlength</a></code>
 HTML&nbsp;attribute, indicating the maximum number of characters the user can enter. This constraint is evaluated only when the value changes. Setter throws DOMException. */
	public var maxLength:Int;

	/** Reflects 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/textarea#attr-name">name</a></code>
 HTML attribute, containing the name of the control. */
	public var name:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/textarea#attr-placeholder">placeholder</a></code>
 HTML attribute, containing a hint to the user about what to enter in the control. */
	public var placeholder:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/textarea#attr-readonly">readonly</a></code>
 HTML attribute, indicating that the user cannot modify the value of the control. */
	public var readOnly:Bool;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/textarea#attr-required">required</a></code>
 HTML attribute, indicating that the user must specify a value before submitting the form. */
	public var required:Bool;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/textarea#attr-rows">rows</a></code>
 HTML attribute, indicating the number of visible text lines for the control. */
	public var rows:Int;

	/** The direction in which selection occurred. This is "forward" if selection was performed in the start-to-end direction of the current locale, or "backward" for the opposite direction. This can also be "none"&nbsp;if the direction is unknown." */
	public var selectionDirection:String;

	/** The index of the end of selected text. 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> If no text is selected, contains the index of the character that follows the input cursor. On being set, the control behaves as if <strong>setSelectionRange</strong>() had been called with this as the second argument, and <strong>selectionStart</strong> as the first argument. */
	public var selectionEnd:Int;

	/** The index of the beginning of selected text. 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> If no text is selected, contains the index of the character that follows the input cursor. On being set, the control behaves as if <strong>setSelectionRange</strong>() had been called with this as the first argument, and <strong>selectionEnd</strong> as the second argument. */
	public var selectionStart:Int;

	/** The codepoint length of the control's value. */
	public var textLength(default, null):Int;

	/** The string <code>textarea</code>. */
	public var type(default, null):String;

	/** A localized message that describes the validation constraints that the control does not satisfy (if any). This is the empty string if the control is not a candidate for constraint validation (<strong>willValidate</strong> is false), or it satisfies its constraints. */
	public var validationMessage(default,null):String;

	/** The validity states that this element is in. */
	public var validity(default, null):ValidityState;

	/** The raw value contained in the control. */
	public var value:String;

	/** Indicates whether the element is a candidate for constraint validation. It is false if any conditions bar it from constraint validation. */
	public var willValidate(default, null):Bool;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/textarea#attr-wrap">wrap</a></code>
 HTML attribute, indicating how the control wraps text. */
	public var wrap:String;

	public function checkValidity ():Bool {
		return null;
	}

	public function select ():Void {
		
	}

	public function setCustomValidity (error:String):Void {
		
	}

	/** Throws DOMException. */
	@:overload(function (replacement:String):Void {})
	public function setRangeText (replacement:String, start:Int, end:Int, selectionMode:String):Void {
		
	}

	public function setSelectionRange (start:Int, end:Int, ?direction:String):Void {
		
	}
	
}
#end