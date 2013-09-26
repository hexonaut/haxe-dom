package hxdom.html;

#if js
typedef SelectElement = js.html.SelectElement;
#else
class SelectElement extends Element implements ArrayAccess<Node> {
	
	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/select#attr-autofocus">autofocus</a></code>
 HTML attribute, which indicates whether the control should have input focus when the page loads, unless the user overrides it, for example by typing in a different control. Only one form-associated element in a document can have this attribute specified. 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> 
<span title="(Firefox 4 / Thunderbird 3.3 / SeaMonkey 2.1)
">Requires Gecko 2.0</span> */
	public var autofocus:Bool;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/select#attr-disabled">disabled</a></code>
 HTML attribute, which indicates whether the control is disabled. If it is disabled, it does not accept clicks. */
	public var disabled:Bool;

	/** The form that this element is associated with. If this element is a descendant of a form element, then this attribute is the ID of that form element. If the element is not a descendant of a form element, then: <ul> <li>
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> The attribute can be the ID of any form element in the same document.</li> <li>
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML">HTML 4</a></span> The attribute is null.</li> </ul> <strong>Read only.</strong> */
	public var form(default, null):FormElement;

	/** A list of label elements associated with this select element. */
	public var labels(default, null):NodeList;

	/** The number of <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/option">&lt;option&gt;</a></code>
 elements in this <code>select</code> element. Setter throws DOMException. */
	public var length:Int;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/select#attr-multiple">multiple</a></code>
 HTML attribute, whichindicates whether multiple items can be selected. */
	public var multiple:Bool;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/select#attr-name">name</a></code>
 HTML attribute, containing the name of this control used by servers and DOM search functions. */
	public var name:String;

	/** The set of <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/option">&lt;option&gt;</a></code>
 elements contained by this element. <strong>Read only.</strong> */
	public var options(default, null):HTMLOptionsCollection;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/select#attr-required">required</a></code>
 HTML attribute, which indicates whether the user is required to select a value before submitting the form. 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> 
<span title="(Firefox 4 / Thunderbird 3.3 / SeaMonkey 2.1)
">Requires Gecko 2.0</span> */
	public var required:Bool;

	/** The index of the first selected <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/option">&lt;option&gt;</a></code>
 element. */
	public var selectedIndex:Int;

	/** The set of options that are selected. 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> */
	public var selectedOptions(default, null):HTMLCollection;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/select#attr-size">size</a></code>
 HTML attribute, which contains the number of visible items in the control. The default is 1, 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> unless <strong>multiple</strong> is true, in which case it is 4. */
	public var size:Int;

	/** The form control's type. When <strong>multiple</strong> is true, it returns <code>select-multiple</code>; otherwise, it returns <code>select-one</code>.<strong>Read only.</strong> */
	public var type(default, null):String;

	/** A localized message that describes the validation constraints that the control does not satisfy (if any). This attribute is the empty string if the control is not a candidate for constraint validation (<strong>willValidate</strong> is false), or it satisfies its constraints.<strong>Read only.</strong> 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> 
<span title="(Firefox 4 / Thunderbird 3.3 / SeaMonkey 2.1)
">Requires Gecko 2.0</span> */
	public var validationMessage(default, null):String;

	/** The validity states that this control is in. <strong>Read only.</strong> 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> 
<span title="(Firefox 4 / Thunderbird 3.3 / SeaMonkey 2.1)
">Requires Gecko 2.0</span> */
	public var validity(default, null):ValidityState;

	/** The value of this form control, that is, of the first selected option. */
	public var value:String;

	/** Indicates whether the button is a candidate for constraint validation. It is false if any conditions bar it from constraint validation. <strong>Read only.</strong> 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> 
<span title="(Firefox 4 / Thunderbird 3.3 / SeaMonkey 2.1)
">Requires Gecko 2.0</span> */
	public var willValidate(default, null):Bool;

	public function add (element:Element, before:Element):Void {
		
	}

	public function checkValidity ():Bool {
		return null;
	}

	public function item (index:Int):Node {
		return null;
	}

	public function namedItem (name:String):Node {
		return null;
	}

	public function setCustomValidity (error:String):Void {
		
	}
	
}
#end