package hxdom.html;

#if js
typedef BaseFontElement = js.html.BaseFontElement;
#else
class BaseFontElement extends Element {
	
	/** This attribute sets the text color using either a named color or a color specified in the hexadecimal #RRGGBB format. */
	public var color:String;

	/** This attribute contains a list of one or more font names. The document text in the default style is rendered in the first font face that the client's browser supports. If no font listed is installed on the local system, the browser typically defaults to the proportional or fixed-width font for that system. */
	public var face:String;

	/** This attribute specifies the font size as either a numeric or relative value. Numeric values range from 1 to 7 with 1 being the smallest and 3 the default. */
	public var size:Int;
	
}
#end