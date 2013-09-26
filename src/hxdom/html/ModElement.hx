package hxdom.html;

#if js
typedef ModElement = js.html.ModElement;
#else
class ModElement extends Element {
	
	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/del#attr-cite">cite</a></code>
 HTML attribute, containing a URI of a resource explaining the change. */
	public var cite:String;

	public var dateTime:String;
	
}
#end