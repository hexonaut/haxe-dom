/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.html;

#if js
typedef ButtonElement = js.html.ButtonElement;
#else
class ButtonElement extends Element {
	
	/** The control should have input focus when the page loads, unless the user overrides it, for example by typing in a different control. Only one form-associated element in a document can have this attribute specified. */
	public var autofocus:Bool;

	/** The control is disabled, meaning that it does not accept any clicks. */
	public var disabled:Bool;

	/** <p>The form that this button is associated with. If the button is a descendant of a form element, then this attribute is the ID of that form element.</p> <p>If the button is not a descendant of a form element, then:</p> <ul> <li>
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> The attribute can be the ID of any form element in the same document.</li> <li>
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML">HTML 4</a></span> The attribute is null.</li> </ul> */
	public var form(default, null):FormElement;

	/** The URI&nbsp;of a program that processes information submitted by the button. If specified, this attribute overrides the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form#attr-action">action</a></code>
 attribute of the <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form">&lt;form&gt;</a></code>
 element that owns this element. */
	public var formAction:String;

	public var formEnctype:String;

	/** The HTTP&nbsp;method that the browser uses to submit the form. If specified, this attribute overrides the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form#attr-method">method</a></code>
 attribute of the <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form">&lt;form&gt;</a></code>
 element that owns this element. */
	public var formMethod:String;

	/** Indicates that the form is not to be validated when it is submitted. If specified, this attribute overrides the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form#attr-enctype">enctype</a></code>
 attribute of the <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form">&lt;form&gt;</a></code>
 element that owns this element. */
	public var formNoValidate:Bool;

	/** A name or keyword indicating where to display the response that is received after submitting the form. If specified, this attribute overrides the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form#attr-target">target</a></code>
 attribute of the <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/form">&lt;form&gt;</a></code>
 element that owns this element. */
	public var formTarget:String;

	/** A list of <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/label">&lt;label&gt;</a></code>
 elements that are labels for this button. */
	public var labels(default, null):NodeList;

	/** The name of the object when submitted with a form. 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> If specified, it must not be the empty string. */
	public var name:String;

	/** <p>Indicates the behavior of the button. This is an enumerated attribute with the following possible values:</p> <ul> <li><code>submit</code>:&nbsp;The button submits the form. This is the default value if the attribute is not specified, 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span> or if it is dynamically changed to an empty or invalid value.</li> <li><code>reset</code>:&nbsp;The button resets the form.</li> <li><code>button</code>:&nbsp;The button does nothing.</li> </ul> */
	public var type:String;

	/** A localized message that describes the validation constraints that the control does not satisfy (if any). This attribute is the empty string if the control is not a candidate for constraint validation (<strong>willValidate</strong> is false), or it satisfies its constraints. */
	public var validationMessage(default, null):String;

	/** The validity states that this button is in. */
	public var validity(default, null):ValidityState;

	/** The current form control value of the button.&nbsp; */
	public var value:String;

	/** Indicates whether the button is a candidate for constraint validation. It is false if any conditions bar it from constraint validation. */
	public var willValidate(default, null):Bool;

	public function checkValidity ():Bool {
		return null;
	}

	public function setCustomValidity (error:String):Void {
		
	}
	
}
#end