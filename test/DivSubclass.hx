package ;

import hxdom.html.DivElement;
import hxdom.macro.DOM;

class DivSubclass extends DivElement implements DOM {
	
	public var someRandomInt(default, null):Int;

	public function new (a1:Int, a2:Int) {
		someRandomInt = 5;
	}
	
	public function listenToSomeEvent ():Void {
		this.addEventListener("click", onClick);
	}
	
	public function onClick (_):Void {
		trace("CLICK");
	}
	
	//public static function create (a1:Int, a2:Int):DivSubclass {
	//	untyped DivSubclass.call(null);
	//	return null;
	//}
	
}