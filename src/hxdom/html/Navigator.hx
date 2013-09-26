package hxdom;

#if js
typedef Navigator = js.html.Navigator;
#else
class Navigator {
	
	/** Returns the internal "code" name of the current browser. Do not rely on this property to return the correct value. */
	public var appCodeName(default,null) : String;

	/** Returns the official name of the browser. Do not rely on this property to return the correct value. */
	public var appName(default,null) : String;

	/** Returns the version of the browser as a string. Do not rely on this property to return the correct value. */
	public var appVersion(default,null) : String;

	public var battery(default,null) : BatteryManager;

	/** Returns a boolean indicating whether cookies are enabled in the browser or not. */
	public var cookieEnabled(default,null) : Bool;

	public var geolocation(default,null) : Geolocation;

	/** Returns a string representing the language version of the browser. */
	public var language(default,null) : String;

	/** Returns a list of the MIME types supported by the browser. */
	public var mimeTypes(default,null) : DOMMimeTypeArray;

	/** Returns a boolean indicating whether the browser is working online. */
	public var onLine(default,null) : Bool;

	/** Returns a string representing the platform of the browser. */
	public var platform(default,null) : String;

	/** Returns an array of the plugins installed in the browser. */
	public var plugins(default,null) : DOMPluginArray;

	/** Returns the product name of the current browser. (e.g. "Gecko") */
	public var product(default,null) : String;

	/** Returns the build number of the current browser (e.g. "20060909") */
	public var productSub(default,null) : String;

	/** Returns the user agent string for the current browser. */
	public var userAgent(default,null) : String;

	/** Returns the vendor name of the current browser (e.g. "Netscape6") */
	public var vendor(default,null) : String;

	/** Returns the vendor version number (e.g. "6.1") */
	public var vendorSub(default,null) : String;

	public function getGamepads() : GamepadList {
		return null;
	}

	public function getStorageUpdates() : Void {
		
	}

	public function getUserMedia( options : Dynamic, successCallback : hxdom.rtc.NavigatorUserMediaSuccessCallback, ?errorCallback : hxdom.rtc.NavigatorUserMediaErrorCallback ) : Void {
		
	}

	public function javaEnabled() : Bool {
		return null;
	}
	
}
#end