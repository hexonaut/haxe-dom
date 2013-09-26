package hxdom.svg;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef AnimatedPreserveAspectRatio = js.html.svg.AnimatedPreserveAspectRatio;
#else
class AnimatedPreserveAspectRatio {
	
	/** A read only <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/SVGPreserveAspectRatio">SVGPreserveAspectRatio</a></code>
 representing the current animated value of the given attribute. If the given attribute is not currently being animated, then the <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/SVGPreserveAspectRatio">SVGPreserveAspectRatio</a></code>
 will have the same contents as <code>baseVal</code>. The object referenced by <code>animVal</code> is always distinct from the one referenced by <code>baseVal</code>, even when the attribute is not animated. */
	public var animVal(default, null):PreserveAspectRatio;

	/** The base value of the given attribute before applying any animations. */
	public var baseVal(default, null):PreserveAspectRatio;
	
}
#end