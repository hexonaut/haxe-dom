package hxdom;
import hxdom.html.Document;

/**
 * Provides the ability to manipulate the DOM for any target.
 * 
 * @author Sam MacPherson
 */
class Browser {
	
	public static var window(get, null):hxdom.html.DOMWindow;
	inline static function get_window() {
		#if js
		return untyped __js__("window");
		#else
		return null;
		#end
	}

	public static var document(get, null):hxdom.html.Document;
	inline static function get_document() {
		#if js
		return untyped __js__("window.document");
		#else
		return document;
		#end
	}

	public static var location(get, null):hxdom.html.Location;
	inline static function get_location() {
		#if js
		return untyped __js__("window.location");
		#else
		return null;
		#end
	}

	public static var navigator(get, null):hxdom.html.Navigator;
	inline static function get_navigator() {
		#if js
		return untyped __js__("window.navigator");
		#else
		return null;
		#end
	}
	
	#if !js
	public static function __init__ ():Void {
		document = Type.createEmptyInstance(Document);
	}
	#end
	
}