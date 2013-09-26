package hxdom;

#if js
typedef Gamepad = js.html.Gamepad;
#else
class Gamepad {
	
	public var axes(default,null) : Array<Float>;

	public var buttons(default,null) : Array<Float>;

	public var id(default,null) : String;

	public var index(default,null) : Int;

	public var timestamp(default,null) : Int;
	
}
#end