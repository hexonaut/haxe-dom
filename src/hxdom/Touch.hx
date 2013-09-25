package hxdom;

#if js
typedef Touch = js.html.Touch;
#else
class Touch {
	
	/** The X coordinate of the touch point relative to the viewport, not including any scroll offset. <strong>Read only.</strong> */
	public var clientX(default, null):Int;

	/** The Y coordinate of the touch point relative to the viewport, not including any scroll offset. <strong>Read only.</strong> */
	public var clientY(default, null):Int;

	/** The amount of pressure being applied to the surface by the user, as a float between 0.0 (no pressure) and 1.0 (maximum pressure). <strong>Read only.</strong> */
	public var force(default, null):Float;

	/** A unique identifier for this <code>Touch</code> object. A given touch (say, by a finger) will have the same identifier for the duration of its movement around the surface. This lets you ensure that you're tracking the same touch all the time. <strong>Read only.</strong> */
	public var identifier(default, null):Int;

	/** The X coordinate of the touch point relative to the viewport, including any scroll offset. <strong>Read only.</strong> */
	public var pageX(default, null):Int;

	/** The Y coordinate of the touch point relative to the viewport, including any scroll offset. <strong>Read only.</strong> */
	public var pageY(default, null):Int;

	/** The X radius of the ellipse that most closely circumscribes the area of contact with the screen. The value is in pixels of the same scale as <code>screenX</code>. <strong>Read only.</strong> */
	public var radiusX(default, null):Int;

	/** The Y radius of the ellipse that most closely circumscribes the area of contact with the screen. The value is in pixels of the same scale as <code>screenY</code>. <strong>Read only.</strong> */
	public var radiusY(default, null):Int;

	/** The angle (in degrees)&nbsp;that the ellipse described by radiusX and radiusY must be rotated, clockwise, to most accurately cover the area of contact between the user and the surface. <strong>Read only.</strong> */
	public var rotationAngle(default, null):Float;

	/** The X coordinate of the touch point relative to the screen, not including any scroll offset. <strong>Read only.</strong> */
	public var screenX(default, null):Int;

	/** The Y coordinate of the touch point relative to the screen, not including any scroll offset. <strong>Read only.</strong> */
	public var screenY(default, null):Int;

	public var target(default, null):EventTarget;
	
}
#end