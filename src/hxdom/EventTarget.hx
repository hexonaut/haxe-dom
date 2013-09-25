package hxdom;

#if js
typedef EventTarget = js.html.EventTarget;
#else
class EventTarget {
	
	public function new () {
	}

	public function addEventListener (type:String, listener:EventListener, ?useCapture:Bool):Void {
		
	}

	public function dispatchEvent (event:Event):Bool {
		
	}

	public function removeEventListener (type:String, listener:EventListener, ?useCapture:Bool):Void {
		
	}
	
}
#end