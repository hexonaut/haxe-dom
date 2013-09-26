package hxdom.html.svg;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef Rect = js.html.svg.Rect;
#else
class Rect {
	
	/** The <em>height</em> coordinate of the rectangle, in user units. */
	public var height:Float;

	/** The <em>width</em> coordinate of the rectangle, in user units. */
	public var width:Float;

	public var x:Float;

	public var y:Float;
	
}
#end