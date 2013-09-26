package hxdom.rtc;

import hxdom.Element;
import hxdom.EventTarget;
import hxdom.NodeList;

#if js
typedef MediaStreamTrack = js.html.rtc.MediaStreamTrack;
#else
class MediaStreamTrack extends EventTarget {
	
	public static inline var ENDED : Int = 2;

	public static inline var LIVE : Int = 0;

	public static inline var MUTED : Int = 1;

	public var enabled : Bool;

	public var kind(default,null) : String;

	public var label(default,null) : String;

	public var onended : hxdom.EventListener;

	public var onmute : hxdom.EventListener;

	public var onunmute : hxdom.EventListener;

	public var readyState(default,null) : Int;
	
}
#end