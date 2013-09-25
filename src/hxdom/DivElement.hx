package hxdom;

#if js
typedef DivElement = js.html.DivElement;
#else
class DivElement extends Element {
	
	public var align:String;
	
	public function new () {
		super();
	}
	
}
#end