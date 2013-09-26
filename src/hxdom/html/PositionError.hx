package hxdom.html;

#if js
typedef PositionError = js.html.PositionError;
#else
class PositionError {
	
	public static inline var PERMISSION_DENIED : Int = 1;

	public static inline var POSITION_UNAVAILABLE : Int = 2;

	public static inline var TIMEOUT : Int = 3;

	public var code(default,null) : Int;

	public var message(default,null) : String;

	
}
#end