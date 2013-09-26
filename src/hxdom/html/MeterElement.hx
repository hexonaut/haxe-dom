package hxdom;

#if js
typedef MeterElement = js.html.MeterElement;
#else
class MeterElement extends Element {
	
	/** The lower numeric bound of the high end of the measured range. This must be less than the maximum value (<strong>max</strong> attribute), and it also must be greater than the low value and minimum value (<strong>low</strong> attribute and <strong>min</strong> attribute, respectively), if any are specified. If unspecified, or if greater than the maximum value, the <strong>high</strong> value is equal to the maximum value. Setter throws DOMException. */
	public var high:Float;

	public var labels(default, null):NodeList;

	/** The upper numeric bound of the low end of the measured range. This must be greater than the minimum value (<strong>min</strong> attribute), and it also must be less than the high value and maximum value (<strong>high</strong> attribute and <strong>max</strong> attribute, respectively), if any are specified. If unspecified, or if less than the minimum value, the <strong>low</strong> value is equal to the minimum value. Setter throws DOMException. */
	public var low:Float;

	/** The upper numeric bound of the measured range. This must be greater than the minimum value (<strong>min</strong> attribute), if specified. If unspecified, the maximum value is 1. Setter throws DOMException. */
	public var max:Float;

	/** The lower numeric bound of the measured range. This must be less than the maximum value (<strong>max</strong> attribute), if specified. If unspecified, the minimum value is 0. Setter throws DOMException. */
	public var min:Float;

	/** This attribute indicates the optimal numeric value. It must be within the range (as defined by the <strong>min</strong> attribute and <strong>max</strong> attribute). When used with the <strong>low</strong> attribute and <strong>high</strong> attribute, it gives an indication where along the range is considered preferable. For example, if it is between the <strong>min</strong> attribute and the <strong>low</strong> attribute, then the lower range is considered preferred. Setter throws DOMException. */
	public var optimum:Float;

	/** The current numeric value. This must be between the minimum and maximum values (<strong>min</strong> attribute and <strong>max</strong> attribute) if they are specified. If unspecified or malformed, the value is 0. If specified, but not within the range given by the <strong>min</strong> attribute and <strong>max</strong> attribute, the value is equal to the nearest end of the range. Setter throws DOMException. */
	public var value:Float;
	
}
#end