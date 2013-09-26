package hxdom.html;

#if js
typedef PerformanceTiming = js.html.PerformanceTiming;
#else
class PerformanceTiming {
	
	public var connectEnd(default,null) : Int;

	public var connectStart(default,null) : Int;

	public var domComplete(default,null) : Int;

	public var domContentLoadedEventEnd(default,null) : Int;

	public var domContentLoadedEventStart(default,null) : Int;

	public var domInteractive(default,null) : Int;

	public var domLoading(default,null) : Int;

	public var domainLookupEnd(default,null) : Int;

	public var domainLookupStart(default,null) : Int;

	public var fetchStart(default,null) : Int;

	public var loadEventEnd(default,null) : Int;

	public var loadEventStart(default,null) : Int;

	public var navigationStart(default,null) : Int;

	public var redirectEnd(default,null) : Int;

	public var redirectStart(default,null) : Int;

	public var requestStart(default,null) : Int;

	public var responseEnd(default,null) : Int;

	public var responseStart(default,null) : Int;

	public var secureConnectionStart(default,null) : Int;

	public var unloadEventEnd(default,null) : Int;

	public var unloadEventStart(default,null) : Int;
	
}
#end