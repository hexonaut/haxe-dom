package hxdom;

#if js
typedef FieldSetElement = js.html.FieldSetElement;
#else
class FieldSetElement extends Element {
	
	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/fieldset#attr-disabled">disabled</a></code>
 HTML&nbsp;attribute, indicating whether the user can interact with the control. */
	public var disabled:Bool;

	/** The elements belonging to this field set. */
	public var elements(default, null):HTMLCollection;

	/** The containing form element, if this element is in a form. Otherwise, the element the <a title="en/HTML/Element/fieldset#attr-name" rel="internal" href="https://developer.mozilla.org/en/HTML/Element/fieldset#attr-name">name content attribute</a> points to 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span>. (<code>null</code> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML">HTML 4</a></span>.) */
	public var form(default, null):FormElement;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/fieldset#attr-name">name</a></code>
 HTML&nbsp;attribute, containing the name of the field set, used for submitting the form. */
	public var name:String;

	/** Must be the string <code>fieldset</code>. */
	public var type(default, null):String;

	/** A localized message that describes the validation constraints that the element does not satisfy (if any). This is the empty string if the element&nbsp; is not a candidate for constraint validation (<strong>willValidate</strong> is false), or it satisfies its constraints. */
	public var validationMessage(default, null):String;

	/** The validity states that this element is in. */
	public var validity(default, null):ValidityState;

	/** Always false because <code>fieldset</code> objects are never candidates for constraint validation. */
	public var willValidate(default, null):Bool;

	public function checkValidity ():Bool {
		return null;
	}

	public function setCustomValidity (error:String):Void {
		
	}
	
}
#end