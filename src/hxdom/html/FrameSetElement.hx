package hxdom;

#if js
typedef FrameSetElement = js.html.FrameSetElement;
#else
class FrameSetElement extends Element {
	
	public var cols:String;

	public var onbeforeunload:EventListener;

	public var onhashchange:EventListener;

	public var onmessage:EventListener;

	public var onoffline:EventListener;

	public var ononline:EventListener;

	public var onpopstate:EventListener;

	public var onresize:EventListener;

	public var onstorage:EventListener;

	public var onunload:EventListener;

	public var rows:String;
	
}
#end