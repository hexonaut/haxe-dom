package hxdom;

#if js
typedef DivElement = js.html.DivElement;
#else
class DivElement extends Element {
	
	public var dropEffect:String;

	public var effectAllowed:String;

	public var files(default, null):FileList;

	public var items(default, null):DataTransferItemList;

	public var types(default, null):Array<Dynamic>;
	
	public function new () {
		
	}
	
	public function clearData (?type:String):Void {
		
	}

	public function getData (type:String):String {
		
	}

	public function setData (type:String, data:String):Bool {
		
	}

	public function setDragImage (image:ImageElement, x:Int, y:Int):Void {
		
	}
	
}
#end