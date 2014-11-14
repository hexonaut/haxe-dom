package hxdom.util;

/**
 * Odds and ends.
 * 
 * @author Sam MacPherson
 */
class Util {
	
	/**
	 * Converts dash seperated to camel case.
	 * 
	 * Example:
	 * 		my-custom-attr => myCustomAttr
	 */
	public static inline function dashToCamelCase (str:String):String {
		var outStr = "";
		var caps = false;
		for (i in 0 ... str.length) {
			var chr = str.charCodeAt(i);
			if (chr == '-'.code) {
				caps = true;
			} else {
				if (caps) {
					if (chr >= 'a'.code && chr <= 'z'.code) {
						chr += 'A'.code - 'a'.code;
					}
					caps = false;
				}
				outStr += String.fromCharCode(chr);
			}
		}
		return outStr;
	}
	
	/**
	 * Converts camel case to dash seperated.
	 * 
	 * Example:
	 * 		myCustomAttr => my-custom-attr
	 */
	public static inline function camelCaseToDash (str:String):String {
		var outStr = "";
		for (i in 0 ... str.length) {
			var chr = str.charCodeAt(i);
			if (chr >= 'A'.code && chr <= 'Z'.code) {
				outStr += '-' + String.fromCharCode(chr - 'A'.code + 'a'.code);
			} else {
				outStr += String.fromCharCode(chr);
			}
		}
		return outStr;
	}
	
}