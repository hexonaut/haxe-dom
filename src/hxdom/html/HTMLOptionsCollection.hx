package hxdom;

#if js
typedef HTMLOptionsCollection = js.html.HTMLOptionsCollection;
#else
class HTMLOptionsCollection extends HTMLCollection {
	
	public var selectedIndex : Int;

	public function add( option : OptionElement, ?index : Int ) : Void {
		
	}

	public function remove( index : Int ) : Void {
		
	}
	
}
#end