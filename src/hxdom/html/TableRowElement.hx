/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.html;

#if (js && !use_vdom)
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