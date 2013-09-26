package hxdom;

#if js
typedef DOMMimeTypeArray = js.html.DOMMimeTypeArray;
#else
class DOMMimeTypeArray implements ArrayAccess<DOMMimeType> {
	
	public var length(default,null) : Int;

	public function item( index : Int ) : DOMMimeType {
		return null;
	}

	public function namedItem( name : String ) : DOMMimeType {
		return null;
	}
	
}
#end