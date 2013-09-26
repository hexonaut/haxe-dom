package hxdom.rtc;

import hxdom.Element;
import hxdom.EventTarget;
import hxdom.NodeList;

#if js
typedef MediaStreamTrackList = js.html.rtc.MediaStreamTrackList;
#else
class MediaStreamTrackList extends hxdom.EventTarget implements ArrayAccess<MediaStreamTrack> {
	
	public var length(default,null) : Int;

	public var onaddtrack : hxdom.EventListener;

	public var onremovetrack : hxdom.EventListener;

	public function add( track : MediaStreamTrack ) : Void {
		
	}

	public function item( index : Int ) : MediaStreamTrack {
		return null;
	}

	public function remove( track : MediaStreamTrack ) : Void {
		
	}
	
}
#end