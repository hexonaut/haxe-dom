package hxdom.html;

#if js
typedef MetaElement = js.html.MetaElement;
#else
class MetaElement extends Element {
	
	/** Gets or sets the value of meta-data property. */
	public var content:String;

	/** Gets or sets the name of an HTTP&nbsp;response header to define for a document. */
	public var httpEquiv:String;

	/** Gets or sets the name of a meta-data property to define for a document. */
	public var name:String;

	/** Gets or sets the name of a scheme used to interpret the value of a meta-data property. */
	public var scheme:String;
	
}
#end