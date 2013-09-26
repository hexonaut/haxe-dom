package hxdom.html;

#if js
typedef DOMStringList = js.html.DOMStringList;
#else
class DOMStringList implements ArrayAccess<String> {
	
	public var length(default,null) : Int;

	public function contains( string : String ) : Bool {
		return null;
	}

	public function item( index : Int ) : String {
		return null;
	}
	
}
#end