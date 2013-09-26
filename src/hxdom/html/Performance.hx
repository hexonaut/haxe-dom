package hxdom.html;

#if js
typedef Performance = js.html.Performance;
#else
class Performance extends EventTarget {
	
	public var memory(default,null) : MemoryInfo;

	public var navigation(default,null) : PerformanceNavigation;

	public var timing(default,null) : PerformanceTiming;

	public function now() : Float {
		return null;
	}
	
}
#end