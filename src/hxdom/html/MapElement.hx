package hxdom.html;

#if js
typedef MapElement = js.html.MapElement;
#else
class MapElement extends Element {
	
	public var areas(default, null):HTMLCollection;

	public var name:String;
	
}
#end