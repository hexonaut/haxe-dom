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