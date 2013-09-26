package hxdom.html;

#if js
typedef EventTarget = js.html.EventTarget;
#else
class EventTarget {

	public function addEventListener (type:String, listener:EventListener, ?useCapture:Bool):Void {
		
	}

	public function dispatchEvent (event:Event):Bool {
		return null;
	}

	public function removeEventListener (type:String, listener:EventListener, ?useCapture:Bool):Void {
		
	}
	
}
#end