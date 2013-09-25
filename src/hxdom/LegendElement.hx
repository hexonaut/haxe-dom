package hxdom;

#if js
typedef LegendElement = js.html.LegendElement;
#else
class LegendElement extends Element {
	
	/** Alignment relative to the form set. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span>, 

<span class="deprecatedInlineTemplate" title="">Deprecated</span>

 in 
<span>HTML 4.01</span> */
	public var align:String;

	/** The form that this legend belongs to. If the legend has a fieldset element as its parent, then this attribute returns the same value as the <strong>form</strong> attribute on the parent fieldset element. Otherwise, it returns null. */
	public var form(default, null):FormElement;
	
}
#end