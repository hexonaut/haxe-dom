package hxdom;

#if js
typedef DOMTokenList = js.html.DOMTokenList;
#else
class DOMTokenList implements ArrayAccess<String> {
	
	public var length(default, null):Int;

	public function add (tokens:String):Void {
		
	}

	public function contains (token:String):Bool {
		return null;
	}

	public function item (index:Int):String {
		return null;
	}

	public function remove (tokens:String):Void {
		
	}

	public function toString ():String {
		return null;
	}

	public function toggle ( token:String, ?force:Bool ):Bool {
		return null;
	}

	
}
#end