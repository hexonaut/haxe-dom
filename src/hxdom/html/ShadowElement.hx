package hxdom.html;

#if js
typedef ShadowElement = js.html.ShadowElement;
#else
class ShadowElement extends Element {
	
	public var resetStyleInheritance:Bool;
	
}
#end