package hxdom;

#if js
typedef TextTrackList = js.html.TextTrackList;
#else
class TextTrackList extends EventTarget implements ArrayAccess<TextTrack> {
	
	public var length(default ,null):Int;

	public var onaddtrack:EventListener;

	public function item (index:Int):TextTrack {
		
	}
	
}
#end