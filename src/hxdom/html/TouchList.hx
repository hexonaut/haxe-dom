package hxdom.html;

#if js
typedef TouchList = js.html.TouchList;
#else
class TouchList implements ArrayAccess<Touch> {
	
	/** The number of <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Touch">Touch</a></code>
&nbsp;objects in the <code>TouchList</code>. <strong>Read only.</strong> */
	public var length(default, null):Int;

	public function item(index:Int):Touch {
		return null;
	}
	
}
#end