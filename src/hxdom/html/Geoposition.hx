package hxdom.html;

#if js
typedef Geoposition = js.html.Geoposition;
#else
class Geoposition {
	
	public var coords(default,null) : Coordinates;

	public var timestamp(default,null) : Int;
	
}
#end