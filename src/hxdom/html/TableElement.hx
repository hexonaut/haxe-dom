package hxdom;

#if js
typedef TableElement = js.html.TableElement;
#else
class TableElement extends Element {
	
	/** <b>align</b> gets/sets the alignment of the table. */
	public var align:String;

	/** <b>bgColor</b> gets/sets the background color of the table. */
	public var bgColor:String;

	/** <b>border</b> gets/sets the table border. */
	public var border:String;

	/** <b>caption</b> returns the table caption.
 Setter throws DOMException. */
	public var caption:TableCaptionElement;

	/** <b>cellPadding</b> gets/sets the cell padding. */
	public var cellPadding:String;

	/** <b>cellSpacing</b> gets/sets the spacing around the table. */
	public var cellSpacing:String;

	/** <b>frame</b> specifies which sides of the table have borders. */
	public var frame:String;

	/** <b>rows</b> returns the rows in the table. */
	public var rows(default, null):HTMLCollection;

	/** <b>rules</b> specifies which interior borders are visible. */
	public var rules:String;

	/** <b>summary</b> gets/sets the table summary. */
	public var summary:String;

	/** <b>tBodies</b> returns the table bodies. */
	public var tBodies(default, null):HTMLCollection;

	/** <b>tFoot</b> returns the table footer.
 Setter throws DOMException. */
	public var tFoot:TableSectionElement;

	/** <b>tHead</b> returns the table head.
 Setter throws DOMException. */
	public var tHead:TableSectionElement;

	/** <b>width</b> gets/sets the width of the table. */
	public var width:String;

	public function createCaption ():Element {
		return null;
	}

	public function createTBody ():Element {
		return null;
	}

	public function createTFoot ():Element {
		return null;
	}

	public function createTHead ():Element {
		return null;
	}

	public function deleteCaption ():Void {
		
	}

	public function deleteRow (index:Int):Void {
		
	}

	public function deleteTFoot ():Void {
		
	}

	public function deleteTHead ():Void {
		
	}

	public function insertRow (index:Int):Element {
		return null;
	}
	
}
#end