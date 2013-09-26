package hxdom;

#if js
typedef TextTrack = js.html.TextTrack;
#else
class TextTrack extends EventTarget {
	
	public var activeCues(default, null):TextTrackCueList;

	public var cues(default, null):TextTrackCueList;

	public var kind(default, null):String;

	public var label(default, null):String;

	public var language(default, null):String;

	public var mode:String;

	public var oncuechange:EventListener;

	public function addCue (cue:TextTrackCue):Void {
		
	}

	public function removeCue (cue:TextTrackCue):Void {
		
	}
	
}
#end