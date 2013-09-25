package hxdom;

#if js
typedef StyleSheet = js.html.StyleSheet;
#else
class StyleSheet {
	
	/** This property indicates whether the current stylesheet has been applied or not. */
	public var disabled:Bool;

	/** Returns the location of the stylesheet. */
	public var href(default, null):String;

	/** Specifies the intended destination medium for style information. */
	public var media(default, null):MediaList;

	/** Returns the node that associates this style sheet with the document. */
	public var ownerNode(default, null):Node;

	/** Returns the stylesheet that is including this one, if any. */
	public var parentStyleSheet(default, null):StyleSheet;

	/** Returns the advisory title of the current style sheet. */
	public var title(default, null):String;

	/** Specifies the style sheet language for this style sheet. */
	public var type(default, null):String;
	
}
#end