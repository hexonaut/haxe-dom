package hxdom;

#if js
typedef CanvasRenderingContext = js.html.CanvasRenderingContext;
#else
class CanvasRenderingContext {
	
	public var canvas(default, null):CanvasElement;
	
}
#end