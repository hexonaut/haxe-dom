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

#if js
typedef TableCellElement = js.html.TableCellElement;
#else
class TableCellElement extends Element {
	
	/** This attribute contains a short abbreviated description of the content of the cell. Some user-agents, such as speech readers, may present this description before the content itself. <div class="note"><strong>Note: </strong>Do not use this attribute as it is obsolete in the latest standard: instead either consider starting the cell content by an independent abbreviated content itself or use the abbreviated content as the cell content and use the long content as the description of the cell by putting it in the <strong>title</strong> attribute.</div> */
	public var abbr:String;

	/** This enumerated attribute specifies how horizontal alignment of each cell content will be handled. Possible values are: <ul> <li><span>left</span>, aligning the content to the left of the cell</li> <li><span>center</span>, centering the content in the cell</li> <li><span>right</span>, aligning the content to the right of the cell</li> <li><span>justify</span>, inserting spaces into the textual content so that the content is justified in the cell</li> <li><span>char</span>, aligning the textual content on a special character with a minimal offset, defined by the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/td#attr-char">char</a></code>
 and 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/td#attr-charoff">charoff</a></code>
 attributes 
<span class="unimplementedInlineTemplate">Unimplemented (see<a rel="external" href="https://bugzilla.mozilla.org/show_bug.cgi?id=2212" class="external" title="">
bug 2212</a>
)</span>
.</li> </ul> <p>If this attribute is not set,&nbsp; the <span>left</span> value is assumed.</p> <div class="note"><strong>Note: </strong>Do not use this attribute as it is obsolete (not supported) in the latest standard. <ul> <li>To achieve the same effect as the <span>left</span>, <span>center</span>, <span>right</span> or <span>justify</span> values, use the CSS <code><a rel="custom" href="https://developer.mozilla.org/en/CSS/text-align">text-align</a></code>
 property on it.</li> <li>To achieve the same effect as the <span>char</span> value, in CSS3, you can use the value of the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/td#attr-char">char</a></code>
 as the value of the <code><a rel="custom" href="https://developer.mozilla.org/en/CSS/text-align">text-align</a></code>
 property 
<span class="unimplementedInlineTemplate">Unimplemented</span>
.</li> </ul> </div> */
	public var align:String;

	/** This attribute contains a list of space-separated strings. Each string is the ID of a group of cells that this header applies to. <div class="note"><strong>Note: </strong>Do not use this attribute as it is obsolete in the latest standard: instead use the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/td#attr-scope">scope</a></code>
 attribute.</div> */
	public var axis:String;

	public var bgColor:String;

	public var cellIndex(default, null):Int;

	public var ch:String;

	public var chOff:String;

	public var colSpan:Int;

	/** This attributes a list of space-separated strings, each corresponding to the <strong>id</strong> attribute of the <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/th">&lt;th&gt;</a></code>
 elements that applies to this element. */
	public var headers:String;

	public var height:String;

	public var noWrap:Bool;

	public var rowSpan:Int;

	public var scope:String;

	public var vAlign:String;

	public var width:String;
	
}
#end