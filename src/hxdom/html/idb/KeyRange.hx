package hxdom.html.idb;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef KeyRange = js.html.idb.KeyRange;
#else
class KeyRange {
	
	public var lower(default,null) : Key;

	public var lowerOpen(default,null) : Bool;

	public var upper(default,null) : Key;

	/** Returns false if the upper-bound value is included in the key range. */
	public var upperOpen(default,null) : Bool;

	public static function bound( lower : Key, upper : Key, ?lowerOpen : Bool, ?upperOpen : Bool ) : KeyRange {
		return null;
	}

	public static function lowerBound( bound : Key, ?open : Bool ) : KeyRange {
		return null;
	}

	public static function only( value : Key ) : KeyRange {
		return null;
	}

	public static function upperBound( bound : Key, ?open : Bool ) : KeyRange {
		return null;
	}
	
}
#end