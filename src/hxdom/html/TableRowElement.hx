package hxdom;

#if js
typedef TableRowElement = js.html.TableRowElement;
#else
class TableRowElement extends Element {
	
	/** <a title="en/DOM/tableRow.bgColor" rel="internal" href="https://developer.mozilla.org/en/DOM/tableRow.bgColor" class="new ">row.bgColor</a> 

<span class="deprecatedInlineTemplate" title="">Deprecated</span> */
	public var align:String;

	/** row.cells */
	public var bgColor:String;

	/** row.ch */
	public var cells(default, null):HTMLCollection;

	/** row.chOff */
	public var ch:String;

	/** row.rowIndex */
	public var chOff:String;

	/** row.sectionRowIndex */
	public var rowIndex(default, null):Int;

	/** row.vAlign */
	public var sectionRowIndex(default, null):Int;

	public var vAlign:String;

	public function deleteCell (index:Int):Void {
		
	}

	public function insertCell (index:Int):Element {
		return null;
	}
	
}
#end