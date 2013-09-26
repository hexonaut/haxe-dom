package hxdom.html.svg;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef AnimatedLength = js.html.svg.AnimatedLength;
#else
class AnimatedLength {
	
	/** If the given attribute or property is being animated, contains the current animated value of the attribute or property. If the given attribute or property is not currently being animated, contains the same value as <code>baseVal</code>. */
	public var animVal(default, null):Length;

	/** The base value of the given attribute before applying any animations. */
	public var baseVal(default, null):Length;
	
}
#end