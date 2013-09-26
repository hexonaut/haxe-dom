package hxdom.html.svg;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef Number = js.html.svg.Number;
#else
class Number {
	
	/** <p>The value of the given attribute.</p> <p><strong>Exceptions on setting:</strong> a <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/DOMException">DOMException</a></code>
 with code <code>NO_MODIFICATION_ALLOWED_ERR</code> is Raised on an attempt to change the value of a read only attribute.</p> */
	public var value:Float;
	
}
#end