package hxdom.html;

#if js
typedef PerformanceNavigation = js.html.PerformanceNavigation;
#else
class PerformanceNavigation {
	
	public static inline var TYPE_BACK_FORWARD : Int = 2;

	public static inline var TYPE_NAVIGATE : Int = 0;

	public static inline var TYPE_RELOAD : Int = 1;

	public static inline var TYPE_RESERVED : Int = 255;

	public var redirectCount(default,null) : Int;

	public var type(default,null) : Int;
	
}
#end