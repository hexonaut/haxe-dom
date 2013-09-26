package hxdom.html.svg;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef ViewSpec = js.html.svg.ViewSpec;
#else
class ViewSpec {
	
	public var preserveAspectRatio(default, null):AnimatedPreserveAspectRatio;

	public var preserveAspectRatioString(default, null):String;

	public var transform(default, null):TransformList;

	public var transformString(default, null):String;

	public var viewBox(default, null):AnimatedRect;

	public var viewBoxString(default, null):String;

	public var viewTarget(default, null):Element;

	public var viewTargetString(default, null):String;

	/** Setter throws DOMException. */
	public var zoomAndPan:Int;
	
}
#end