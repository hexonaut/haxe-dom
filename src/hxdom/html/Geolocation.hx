package hxdom;

#if js
typedef Geolocation = js.html.Geolocation;
#else
class Geolocation {
	
	public function clearWatch( watchId : Int ) : Void {
		
	}

	public function getCurrentPosition( successCallback : PositionCallback, ?errorCallback : PositionErrorCallback, ?options : Dynamic ) : Void {
		
	}

	public function watchPosition( successCallback : PositionCallback, ?errorCallback : PositionErrorCallback, ?options : Dynamic ) : Int {
		return null;
	}

}
#end