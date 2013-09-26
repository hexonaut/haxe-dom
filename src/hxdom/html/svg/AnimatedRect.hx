package hxdom.html.svg;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef AnimatedRect = js.html.svg.AnimatedRect;
#else
class AnimatedRect {
	
	/** A read only <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/SVGRect">SVGRect</a></code>
 representing the current animated value of the given attribute. If the given attribute is not currently being animated, then the <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/SVGRect">SVGRect</a></code>
 will have the same contents as <code>baseVal</code>. The object referenced by <code>animVal</code> will always be distinct from the one referenced by <code>baseVal</code>, even when the attribute is not animated. */
	public var animVal(default, null):Rect;

	/** The base value of the given attribute before applying any animations. */
	public var baseVal(default, null):Rect;
	
}
#end