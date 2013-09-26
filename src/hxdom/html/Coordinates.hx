package hxdom.html;

#if js
typedef Coordinates = js.html.Coordinates;
#else
class Coordinates {
	
	public var accuracy(default,null) : Float;

	public var altitude(default,null) : Float;

	public var altitudeAccuracy(default,null) : Float;

	public var heading(default,null) : Float;

	public var latitude(default,null) : Float;

	public var longitude(default,null) : Float;

	public var speed(default, null) : Float;
	
}
#end