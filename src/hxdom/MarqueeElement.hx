package hxdom;

#if js
typedef MarqueeElement = js.html.MarqueeElement;
#else
class MarqueeElement extends Element {
	
	/** Sets how the text is scrolled within the marquee. Possible values are <code>scroll</code>, <code>slide</code> and <code>alternate</code>. If no value is specified, the default value is <code>scroll</code>. */
	public var behavior:String;

	public var bgColor:String;

	/** Sets the direction of the scrolling within the marquee. Possible values are <code>left</code>, <code>right</code>, <code>up</code> and <code>down</code>. If no value is specified, the default value is <code>left</code>. */
	public var direction:String;

	/** Sets the height in pixels or percentage value. */
	public var height:String;

	/** Sets the horizontal margin */
	public var hspace:Int;

	/** Sets the number of times the marquee will scroll. If no value is specified, the default value is −1, which means the marquee will scroll continuously. Setter throws DOMException. */
	public var loop:Int;

	/** Setter throws DOMException. */
	public var scrollAmount:Int;

	/** Setter throws DOMException. */
	public var scrollDelay:Int;

	public var trueSpeed:Bool;

	/** Sets the vertical margin in pixels or percentage value. */
	public var vspace:Int;

	/** Sets the width in pixels or percentage value. */
	public var width:String;

	public function start ():Void {
		
	}

	public function stop ():Void {
		
	}
	
}
#end