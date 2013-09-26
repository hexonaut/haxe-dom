package hxdom;

#if js
typedef StyleElement = js.html.StyleElement;
#else
class StyleElement extends Element {
	
	/** Returns true if the stylesheet is disabled, and false if not */
	public var disabled:Bool;

	/** Specifies the intended destination medium for style information. */
	public var media:String;

	public var scoped:Bool;

	public var sheet(default, null):StyleSheet;

	/** Returns the type of style being applied by this statement. */
	public var type:String;
	
}
#end