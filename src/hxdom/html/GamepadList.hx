package hxdom;

#if js
typedef GamepadList = js.html.GamepadList;
#else
class GamepadList implements ArrayAccess<Gamepad> {
	
	public var length(default,null) : Int;

	public function item( index : Int ) : Gamepad {
		return null;
	}
	
}
#end