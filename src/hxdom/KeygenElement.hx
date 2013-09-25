package hxdom;

#if js
typedef KeygenElement = js.html.KeygenElement;
#else
class KeygenElement extends Element {
	
	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/keygen#attr-autofocus">autofocus</a></code>
&nbsp;HTML attribute, indicating that the form control should have input focus when the page loads. */
	public var autofocus:Bool;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/keygen#attr-challenge">challenge</a></code>
 HTML&nbsp;attribute, containing a challenge string that is packaged with the submitted key. */
	public var challenge:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/keygen#attr-disabled">disabled</a></code>
&nbsp;HTML attribute, indicating that the control is not available for interaction. */
	public var disabled:Bool;

	/** Indicates the control's form owner, reflecting the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/keygen#attr-form">form</a></code>
&nbsp;HTML&nbsp;attribute if it is defined. */
	public var form(default, null):FormElement;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/keygen#attr-keytype">keytype</a></code>
 HTML&nbsp;attribute, containing the type of key used. */
	public var keytype:String;

	/** A list of label elements associated with this keygen element. */
	public var labels(default, null):NodeList;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/keygen#attr-name">name</a></code>
 HTML attribute, containing the name for the control that is submitted with form data. */
	public var name:String;

	/** Must be the value <code>keygen</code>. */
	public var type(default, null):String;

	/** A localized message that describes the validation constraints that the control does not satisfy (if any). This is the empty string if the control is not a candidate for constraint validation (<strong>willValidate</strong> is false), or it satisfies its constraints. */
	public var validationMessage(default, null):String;

	/** The validity states that this element is in. */
	public var validity(default, null):ValidityState;

	/** Always false because <code>keygen</code> objects are never candidates for constraint validation. */
	public var willValidate(default, null):Bool;

	public function checkValidity ():Bool {
		
	}

	public function setCustomValidity (error:String):Void {
		
	}
	
}
#end