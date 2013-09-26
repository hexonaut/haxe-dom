package hxdom;

#if js
typedef TextTrackCueList = js.html.TextTrackCueList;
#else
class TextTrackCueList implements ArrayAccess<TextTrackCue> {
	
	public var length(default,null):Int;

	public function getCueById (id:String):TextTrackCue {
		return null;
	}

	public function item (index:Int):TextTrackCue {
		return null;
	}
	
}
#end