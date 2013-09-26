package hxdom.html;

#if js
typedef FormElement = js.html.FormElement;
#else
class FormElement extends Element {
	
	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form#attr-accept-charset">accept-charset</a></code>
&nbsp;HTML&nbsp;attribute, containing a list of character encodings that the server accepts. */
	public var acceptCharset:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form#attr-action">action</a></code>
&nbsp;HTML&nbsp;attribute, containing the URI&nbsp;of a program that processes the information submitted by the form. */
	public var action:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form#attr-autocomplete">autocomplete</a></code>
 HTML&nbsp;attribute, containing a string that indicates whether the controls in this form can have their values automatically populated by the browser. */
	public var autocomplete:String;

	/** All the form controls belonging to this form element. */
	public var elements(default, null):HTMLCollection;

	/** Synonym for <strong>enctype</strong>. */
	public var encoding:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form#attr-enctype">enctype</a></code>
&nbsp;HTML&nbsp;attribute, indicating the type of content that is used to transmit the form to the server. Only specified values can be set. */
	public var enctype:String;

	/** The number of controls in the form. */
	public var length(default, null):Int;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form#attr-method">method</a></code>
&nbsp;HTML&nbsp;attribute, indicating the HTTP&nbsp;method used to submit the form. Only specified values can be set. */
	public var method:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form#attr-name">name</a></code>
&nbsp;HTML&nbsp;attribute, containing the name of the form. */
	public var name:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form#attr-novalidate">novalidate</a></code>
 HTML attribute, indicating that the form should not be validated. */
	public var noValidate:Bool;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form#attr-target">target</a></code>
 HTML attribute, indicating where to display the results received from submitting the form. */
	public var target:String;

	public function checkValidity ():Bool {
		return null;
	}

	public function reset ():Void {
		
	}

	public function submit ():Void {
		
	}
	
}
#end