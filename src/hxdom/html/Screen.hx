package hxdom;

#if js
typedef Screen = js.html.Screen;
#else
class Screen {
	
	/** Specifies the height of the screen, in pixels, minus permanent or semipermanent user interface features displayed by the operating system, such as the Taskbar on Windows. */
	public var availHeight(default,null) : Int;

	/** Returns the first available pixel available from the left side of the screen. */
	public var availLeft(default,null) : Int;

	/** Specifies the y-coordinate of the first pixel that is not allocated to permanent or semipermanent user interface features. */
	public var availTop(default,null) : Int;

	/** Returns the amount of horizontal space in pixels available to the window. */
	public var availWidth(default,null) : Int;

	/** Returns the color depth of the screen. */
	public var colorDepth(default,null) : Int;

	/** Returns the height of the screen in pixels. */
	public var height(default,null) : Int;

	/** Gets the bit depth of the screen. */
	public var pixelDepth(default,null) : Int;

	/** Returns the width of the screen. */
	public var width(default,null) : Int;
	
}
#end