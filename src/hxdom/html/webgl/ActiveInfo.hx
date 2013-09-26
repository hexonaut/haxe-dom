package hxdom.html.webgl;

#if js
typedef ActiveInfo = js.html.webgl.ActiveInfo;
#else
class ActiveInfo {
	
	public var name(default, null):String;

	public var size(default, null):Int;

	public var type(default, null):Int;
	
}
#end