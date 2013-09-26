package hxdom.html;

#if js
typedef MemoryInfo = js.html.MemoryInfo;
#else
class MemoryInfo {
	
	public var jsHeapSizeLimit(default,null) : Int;

	public var totalJSHeapSize(default,null) : Int;

	public var usedJSHeapSize(default,null) : Int;
	
}
#end