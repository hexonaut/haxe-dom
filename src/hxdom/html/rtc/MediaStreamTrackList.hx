package hxdom.html.rtc;

import hxdom.html.Element;
import hxdom.html.EventTarget;
import hxdom.html.NodeList;

#if js
typedef MediaStreamTrackList = js.html.rtc.MediaStreamTrackList;
#else
class MediaStreamTrackList extends hxdom.html.EventTarget implements ArrayAccess<MediaStreamTrack> {
	
	public var length(default,null) : Int;

	public var onaddtrack : hxdom.html.EventListener;

	public var onremovetrack : hxdom.html.EventListener;

	public function add( track : MediaStreamTrack ) : Void {
		
	}

	public function item( index : Int ) : MediaStreamTrack {
		return null;
	}

	public function remove( track : MediaStreamTrack ) : Void {
		
	}
	
}
#end