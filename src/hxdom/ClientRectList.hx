package hxdom;

#if js
typedef ClientRectList = js.html.ClientRectList;
#else
class ClientRectList implements ArrayAccess<ClientRect> {
	
	public var length(default, null):Int;

	public function item (index:Int):ClientRect {
		
	}
	
}
#end