package hxdom;

#if js
typedef OptionElement = js.html.OptionElement;
#else
class OptionElement extends Element {
	
	/** Reflects the value of the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/option#attr-selected">selected</a></code>
 HTML attribute. which indicates whether the option is selected by default. */
	public var defaultSelected:Bool;

	/** Reflects the value of the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/option#attr-disabled">disabled</a></code>
 HTML&nbsp;attribute, which indicates that the option is unavailable to be selected. An option can also be disabled if it is a child of an <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/optgroup">&lt;optgroup&gt;</a></code>
 element that is disabled. */
	public var disabled:Bool;

	/** If the option is a descendent of a <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/select">&lt;select&gt;</a></code>
 element, then this property has the same value as the <code>form</code> property of the corresponding {{DomXref("HTMLSelectElement") object; otherwise, it is null. */
	public var form(default, null):FormElement;

	/** The position of the option within the list of options it belongs to, in tree-order. If the option is not part of a list of options, the value is 0. */
	public var index(default, null):Int;

	/** Reflects the value of the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/option#attr-label">label</a></code>
 HTML attribute, which provides a label for the option. If this attribute isn't specifically set, reading it returns the element's text content. */
	public var label:String;

	/** Indicates whether the option is selected. */
	public var selected:Bool;

	/** Contains the text content of the element. Setter throws DOMException. */
	public var text:String;

	/** Reflects the value of the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/option#attr-value">value</a></code>
 HTML attribute, if it exists; otherwise reflects value of the <code><a rel="internal" href="https://developer.mozilla.org/Article_not_found?uri=en/DOM/textContent" class="new">textContent</a></code>
&nbsp;IDL&nbsp;attribute. */
	public var value:String;

	public function new ():Void {
		
	}
	
}
#end