package hxdom;

#if js
typedef Attr = js.html.Attr;
#else
class Attr extends Node {
	
	/** Indicates whether the attribute is an "ID attribute". An "ID attribute" being an attribute which value is expected to be unique across a DOM Document. In HTML DOM, "id" is the only ID attribute, but XML documents could define others. Whether or not an attribute is unique is often determined by a DTD or other schema description. */
	public var isId(default, null):Bool;

	/** The attribute's name. */
	public var name(default, null):String;

	/** This property has been deprecated and will be removed in the future. Since you can only get Attr objects from elements, you should already know th */
	public var ownerElement(default, null):Element;

	/** This property has been deprecated and will be removed in the future; it now always returns <code>true</code>. */
	public var specified(default, null):Bool;

	/** The attribute's value. Setter throws DOMException. */
	public var value:String;
	
}
#end