package hxdom;

#if js
typedef TextTrackCueList = js.html.TextTrackCueList;
#else
class TextTrackCueList implements ArrayAccess<TextTrackCue> {
	
	public var length(default,null):Int;

	public function getCueById (id:String):TextTrackCue {
		
	}

	public function item (index:Int):TextTrackCue {
		
	}
	
}
#end