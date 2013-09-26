package hxdom.html;

#if js
typedef BarInfo = js.html.BarInfo;
#else
class BarInfo {
	
	public var visible(default,null) : Bool;
	
}
#end