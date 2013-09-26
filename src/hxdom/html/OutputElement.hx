package hxdom.html;

#if js
typedef OutputElement = js.html.OutputElement;
#else
class OutputElement extends Element {
	
	/** The default value of the element, initially the empty string. */
	public var defaultValue:String;

	/** Indicates the control's form owner, reflecting the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/output#attr-form">form</a></code>
&nbsp;HTML&nbsp;attribute if it is defined. */
	public var form(default, null):FormElement;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/output#attr-for">for</a></code>
 HTML attribute, containing a list of IDs of other elements in the same document that contribute to (or otherwise affect) the calculated <strong>value</strong>. */
	public var htmlFor:DOMSettableTokenList;

	/** A list of label elements associated with this output element. */
	public var labels(default, null):NodeList;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/output#attr-name">name</a></code>
 HTML attribute, containing the name for the control that is submitted with form data. */
	public var name:String;

	/** Must be the string <code>output</code>. */
	public var type(default, null):String;

	/** A localized message that describes the validation constraints that the control does not satisfy (if any). This is the empty string if the control is not a candidate for constraint validation (<strong>willValidate</strong> is false), or it satisfies its constraints. */
	public var validationMessage(default, null):String;

	/** The validity states that this element is in. */
	public var validity(default, null):ValidityState;

	/** The value of the contents of the elements. Behaves like the <strong><a title="En/DOM/Node.textContent" rel="internal" href="https://developer.mozilla.org/En/DOM/Node.textContent">textContent</a></strong> property. */
	public var value:String;

	/** <p>      in Gecko 2.0. Indicates whether the element is a candidate for constraint validation. It is false if any conditions bar it from constraint validation. (See <a rel="external" href="https://bugzilla.mozilla.org/show_bug.cgi?id=604673" class="external" title="">
bug 604673</a>
.)</p> <p>The standard behavior is to always return false because <code>output</code> objects are never candidates for constraint validation.</p> */
	public var willValidate(default,null):Bool;

	public function checkValidity ():Bool {
		return null;
	}

	public function setCustomValidity (error:String):Void {
		
	}
	
}
#end