package hxdom.html;

#if js
typedef MediaError = js.html.MediaError;
#else
class MediaError {
	
	public static inline var MEDIA_ERR_ABORTED:Int = 1;

	public static inline var MEDIA_ERR_DECODE:Int = 3;

	public static inline var MEDIA_ERR_ENCRYPTED:Int = 5;

	public static inline var MEDIA_ERR_NETWORK:Int = 2;

	public static inline var MEDIA_ERR_SRC_NOT_SUPPORTED:Int = 4;

	public var code(default, null):Int;
	
}
#end