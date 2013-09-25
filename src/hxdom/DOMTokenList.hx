package hxdom;

#if js
typedef DOMTokenList = js.html.DOMTokenList;
#else
class DOMTokenList implements ArrayAccess<String> {
	
	public var length(default, null):Int;

	public function add (tokens:String):Void {
		
	}

	public function contains (token:String):Bool {
		
	}

	public function item (index:Int):String {
		
	}

	public function remove (tokens:String):Void {
		
	}

	public function toString ():String {
		
	}

	public function toggle ( token:String, ?force:Bool ):Bool {
		
	}

	
}
#end