package hxdom.html;

#if js
typedef Clipboard = js.html.Clipboard;
#else
class Clipboard extends Element {
	
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
		return null;
	}

	public function setData (type:String, data:String):Bool {
		return null;
	}

	public function setDragImage (image:ImageElement, x:Int, y:Int):Void {
		
	}
	
}
#end