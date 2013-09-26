package hxdom.html.rtc;

import hxdom.html.Element;
import hxdom.html.EventTarget;
import hxdom.html.NodeList;

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

	public var onended : hxdom.html.EventListener;

	public var onmute : hxdom.html.EventListener;

	public var onunmute : hxdom.html.EventListener;

	public var readyState(default,null) : Int;
	
}
#end