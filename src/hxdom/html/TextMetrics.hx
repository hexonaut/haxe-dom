package hxdom;

#if js
typedef TextMetrics = js.html.TextMetrics;
#else
class TextMetrics {
	
	public var width(default, null):Float;
	
}
#end