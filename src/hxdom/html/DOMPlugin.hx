package hxdom;

#if js
typedef DOMPlugin = js.html.DOMPlugin;
#else
class DOMPlugin implements ArrayAccess<DOMMimeType> {
	
	/** A human readable description of the plugin. <strong>Read only.</strong> */
	public var description(default,null) : String;

	/** The filename of the plugin file. <strong>Read only.</strong> */
	public var filename(default,null) : String;

	public var length(default,null) : Int;

	/** The name of the plugin. <strong>Read only.</strong> */
	public var name(default,null) : String;

	public function item( index : Int ) : DOMMimeType {
		return null;
	}

	public function namedItem( name : String ) : DOMMimeType {
		return null;
	}
	
}
#end