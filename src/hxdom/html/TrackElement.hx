package hxdom.html;

#if js
typedef TrackElement = js.html.TrackElement;
#else
class TrackElement extends Element {
	
	public static inline var ERROR:Int = 3;

	public static inline var LOADED:Int = 2;

	public static inline var LOADING:Int = 1;

	public static inline var NONE:Int = 0;

	/** This attribute indicates that the track should be enabled unless the user's preferences indicate that another track is more appropriate. This may only be used on one <code>track</code> element per media element. */
	public var default_(get,set):Bool;
	private inline function get_default_():Bool {
		return untyped this["default"];
	}
	private inline function set_default_(x:Bool):Bool {
		return untyped this["default"] = x;
	}

	/** Kind of text track. The following keywords are allowed: <ul> <li>subtitles: A transcription or translation of the dialogue.</li> <li>captions: A transcription or translation of the dialogue or other sound effects. Suitable for users who are deaf or when the sound is muted.</li> <li>descriptions: Textual descriptions of the video content. Suitable for users who are blind.</li> <li>chapters: Chapter titles, intended to be used when the user is navigating the media resource.</li> <li>metadata: Tracks used by script. Not visible to the user.</li> </ul> */
	public var kind:String;

	/** A user-readable title of the text track Used by the browser when listing available text tracks. */
	public var label:String;

	public var readyState(default, null):Int;

	/** Address of the track. Must be a valid URL. This attribute must be defined. */
	public var src:String;

	/** Language of the track text data. */
	public var srclang:String;

	public var track(default, null):TextTrack;
	
}
#end