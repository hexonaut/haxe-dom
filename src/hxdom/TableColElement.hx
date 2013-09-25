package hxdom;

#if js
typedef TableColElement = js.html.TableColElement;
#else
class TableColElement extends Element {
	
	/** Indicates the horizontal alignment of the cell data in the column. */
	public var align:String;

	/** Alignment character for cell data. */
	public var ch:String;

	/** Offset for the alignment character. */
	public var chOff:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/col#attr-span">span</a></code>
 HTML&nbsp;attribute, indicating the number of columns to apply this object's attributes to. Must be a positive integer. */
	public var span:Int;

	/** Indicates the vertical alignment of the cell data in the column. */
	public var vAlign:String;

	/** Default column width. */
	public var width:String;
	
}
#end