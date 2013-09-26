package hxdom;

#if js
typedef DivElement = js.html.DivElement;
#else
class DivElement extends Element {
	
	public var align:String;
	
}
#end