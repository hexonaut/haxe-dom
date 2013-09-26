package hxdom.html;

#if js
typedef TextTrackCue = js.html.TextTrackCue;
#else
class TextTrackCue extends EventTarget {
	
	/** Setter throws DOMException. */
	public var align:String;

	public var endTime:Float;

	public var id:String;

	/** Setter throws DOMException. */
	public var line:Int;

	public var onenter:EventListener;

	public var onexit:EventListener;

	public var pauseOnExit:Bool;

	/** Setter throws DOMException. */
	public var position:Int;

	/** Setter throws DOMException. */
	public var size:Int;

	public var snapToLines:Bool;

	public var startTime:Float;

	public var text:String;

	public var track(default, null):TextTrack;

	/** Setter throws DOMException. */
	public var vertical:String;

	public function new (startTime:Float, endTime:Float, text:String) {
		
	}

	public function getCueAsHTML ():DocumentFragment {
		return null;
	}
	
}
#end