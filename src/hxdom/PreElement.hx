package hxdom;

#if js
typedef PreElement = js.html.PreElement;
#else
class PreElement extends Element {
	
	public var width:Int;

	public var wrap:Bool;
	
}
#end