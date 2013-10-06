package ;

import hxdom.html.DivElement;
import hxdom.macro.DOM;
import hxdom.Elements;

class DivSubclass extends EDiv {
	
	public var someRandomInt(default, null):Int;
	public var divElem:EDiv;

	public function new (div:EDiv) {
		super();
		
		someRandomInt = 5;
		this.divElem = div;
		appendChild(div);
	}
	
	public function listenToSomeEvent ():Void {
		this.addEventListener("click", onClick);
	}
	
	public function onClick (_):Void {
		trace("CLICK");
	}
	
}