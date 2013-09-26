package hxdom.html;

#if js
typedef LabelElement = js.html.LabelElement;
#else
class LabelElement extends Element {
	
	/** The labeled control. */
	public var control(default, null):Element;

	/** The form owner of this label. */
	public var form(default, null):FormElement;

	/** The ID of the labeled control. Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/label#attr-for">for</a></code>
 attribute. */
	public var htmlFor:String;
	
}
#end