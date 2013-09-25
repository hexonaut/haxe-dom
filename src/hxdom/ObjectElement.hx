package hxdom;

#if js
typedef ObjectElement = js.html.ObjectElement;
#else
class ObjectElement extends Element {
	
	/** Alignment of the object relative to its context. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span>. */
	public var align:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/object#attr-archive">archive</a></code>
&nbsp;HTML attribute, containing a list of archives for resources for this object. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span>. */
	public var archive:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/object#attr-border">border</a></code>
&nbsp;HTML attribute, specifying the width of a border around the object. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span>. */
	public var border:String;

	/** The name of an applet class file, containing either the applet's subclass, or the path to get to the class, including the class file itself. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span>. */
	public var code:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/object#attr-codebase">codebase</a></code>
&nbsp;HTML attribute, specifying the base path to use to resolve relative URIs. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span>. */
	public var codeBase:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/object#attr-codetype">codetype</a></code>
&nbsp;HTML attribute, specifying the content type of the data. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span>. */
	public var codeType:String;

	/** The active document of the object element's nested browsing context, if any; otherwise null. */
	public var contentDocument(default, null):Document;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/object#attr-data">data</a></code>
 HTML&nbsp;attribute, specifying the address of a resource's data. */
	public var data:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/object#attr-declare">declare</a></code>
 HTML&nbsp;attribute, indicating that this is a declaration, not an instantiation, of the object. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span>. */
	public var declare:Bool;

	/** The object element's form owner, or null if there isn't one. */
	public var form(default, null):FormElement;

	/** Reflects the {{htmlattrxref("height", "object)}}&nbsp;HTML attribute, specifying the displayed height of the resource in CSS pixels. */
	public var height:String;

	/** Horizontal space in pixels around the control. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span>. */
	public var hspace:Int;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/object#attr-name">name</a></code>
&nbsp;HTML attribute, specifying the name of the object (
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML">HTML 4</a></span>, or of a browsing context (
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span>. */
	public var name:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/object#attr-standby">standby</a></code>
 HTML&nbsp;attribute, specifying a message to display while the object loads. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span>. */
	public var standby:String;

	/** Reflects the {{htmlattrxref("type", "object)}}&nbsp;HTML attribute, specifying the MIME type of the resource. */
	public var type:String;

	/** Reflects the {{htmlattrxref("usemap", "object)}}&nbsp;HTML attribute, specifying a {{HTMLElement("map")}} element to use. */
	public var useMap:String;

	/** A localized message that describes the validation constraints that the control does not satisfy (if any). This is the empty string if the control is not a candidate for constraint validation (<strong>willValidate</strong> is false), or it satisfies its constraints. */
	public var validationMessage(default,null):String;

	/** The validity states that this element is in. */
	public var validity(default, null):ValidityState;

	/** Horizontal space in pixels around the control. 

<span title="">Obsolete</span> in 
<span><a rel="custom" href="https://developer.mozilla.org/en/HTML/HTML5">HTML5</a></span>. */
	public var vspace:Int;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/object#attr-width">width</a></code>
&nbsp;HTML attribute, specifying the displayed width of the resource in CSS pixels. */
	public var width:String;

	/** Indicates whether the element is a candidate for constraint validation. Always false for <code>object</code> objects. */
	public var willValidate(default, null):Bool;

	public function checkValidity ():Bool {
		
	}

	public function getSVGDocument ():hxdom.svg.Document {
		
	}

	public function setCustomValidity (error:String):Void {
		
	}
	
}
#end