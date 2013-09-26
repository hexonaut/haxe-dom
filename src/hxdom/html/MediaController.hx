package hxdom.html;

#if js
typedef MediaController = js.html.MediaController;
#else
class MediaController extends EventTarget {
	
	public var buffered(default, null):TimeRanges;

	/** Setter throws DOMException. */
	public var currentTime:Float;

	public var defaultPlaybackRate:Float;

	public var duration(default, null):Float;

	public var muted:Bool;

	public var paused(default, null):Bool;

	public var playbackRate:Float;

	public var played(default, null):TimeRanges;

	public var seekable(default, null):TimeRanges;

	/** Setter throws DOMException. */
	public var volume:Float;

	public function new () {
		
	}

	public function pause ():Void {
		
	}

	public function play ():Void {
		
	}
	
}
#end