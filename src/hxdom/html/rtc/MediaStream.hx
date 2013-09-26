package hxdom.rtc;

import hxdom.Element;
import hxdom.EventTarget;
import hxdom.NodeList;

#if js
typedef MediaStream = js.html.rtc.MediaStream;
#else
class MediaStream extends EventTarget {
	
	public static inline var ENDED : Int = 2;

	public static inline var LIVE : Int = 1;

	public var audioTracks(default,null) : MediaStreamTrackList;

	public var label(default,null) : String;

	public var onended : hxdom.EventListener;

	public var readyState(default,null) : Int;

	public var videoTracks(default,null) : MediaStreamTrackList;

	function new( audioTracks : MediaStreamTrackList, videoTracks : MediaStreamTrackList ) {
		
	}
	
}
#end