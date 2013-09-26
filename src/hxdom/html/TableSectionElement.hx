package hxdom.html;

#if js
typedef TableSectionElement = js.html.TableSectionElement;
#else
class TableSectionElement extends Element {
	
	/** This enumerated attribute specifies how horizontal alignment of each cell content will be handled. Possible values are: <ul> <li><span>left</span>, aligning the content to the left of the cell</li> <li><span>center</span>, centering the content in the cell</li> <li><span>right</span>, aligning the content to the right of the cell</li> <li><span>justify</span>, inserting spaces into the textual content so that the content is justified in the cell</li> <li><span>char</span>, aligning the textual content on a special character with a minimal offset, defined by the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/thead#attr-char">char</a></code>
 and 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/thead#attr-charoff">charoff</a></code>
 attributes 
<span class="unimplementedInlineTemplate">Unimplemented (see<a rel="external" href="https://bugzilla.mozilla.org/show_bug.cgi?id=2212" class="external" title="">
bug 2212</a>
)</span>
.</li> </ul> <p>If this attribute is not set,&nbsp; the <span>left</span> value is assumed.</p> <div class="note"><strong>Note: </strong>Do not use this attribute as it is obsolete (not supported) in the latest standard. <ul> <li>To achieve the same effect as the <span>left</span>, <span>center</span>, <span>right</span> or <span>justify</span> values, use the CSS <code><a rel="custom" href="https://developer.mozilla.org/en/CSS/text-align">text-align</a></code>
 property on it.</li> <li>To achieve the same effect as the <span>char</span> value, in CSS3, you can use the value of the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/thead#attr-char">char</a></code>
 as the value of the <code><a rel="custom" href="https://developer.mozilla.org/en/CSS/text-align">text-align</a></code>
 property 
<span class="unimplementedInlineTemplate">Unimplemented</span>
.</li> </ul> </div> */
	public var align:String;

	public var ch:String;

	public var chOff:String;

	public var rows(default,null):HTMLCollection;

	public var vAlign:String;

	public function deleteRow (index:Int):Void {
		
	}

	public function insertRow (index:Int):Element {
		return null;
	}
	
}
#end