package hxdom.html;

#if js
typedef MenuElement = js.html.MenuElement;
#else
class MenuElement extends Element {
	
	public var compact:Bool;
	
}
#end