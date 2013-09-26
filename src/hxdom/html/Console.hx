package hxdom.html;

#if js
typedef Console = js.html.Console;
#else
class Console {
	
	public var memory(default, null) : MemoryInfo;

	public var profiles(default, null) : Array<hxdom.html.ScriptProfile>;

	public function assert( condition : Bool , ?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void {
		
	}

	public function clear(?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void{}

	public function count(?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void{}

	public function debug(?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void{}

	public function dir(?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void{}

	public function dirxml(?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void{}

	public function error(?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void{}

	public function group(?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void{}

	public function groupCollapsed(?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void{}

	public function groupEnd() : Void{}

	public function info(?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void{}

	public function log(?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void{}

	public function markTimeline(?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void{}

	public function profile( title : String ) : Void{}

	public function profileEnd( title : String ) : Void{}

	public function time( title : String ) : Void{}

	public function timeEnd( title : String , ?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void{}

	public function timeStamp(?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void{}

	public function trace(?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void{}

	public function warn(?p1 : Dynamic, ?p2 : Dynamic, ?p3 : Dynamic, ?p4 : Dynamic, ?p5 : Dynamic) : Void{}
	
}
#end