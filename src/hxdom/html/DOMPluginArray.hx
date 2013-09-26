package hxdom;

#if js
typedef DOMPluginArray = js.html.DOMPluginArray;
#else
class DOMPluginArray implements ArrayAccess<DOMPlugin> {
	
	public var length(default,null) : Int;

	public function item( index : Int ) : DOMPlugin {
		return null;
	}

	public function namedItem( name : String ) : DOMPlugin {
		return null;
	}

	public function refresh( reload : Bool ) : Void {
		
	}
	
}
#end