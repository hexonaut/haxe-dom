package hxdom;

#if js
typedef CSSValue = js.html.CSSValue;
#else
class CSSValue {
	
	public static inline var CSS_CUSTOM:Int = 3;

	public static inline var CSS_INHERIT:Int = 0;

	public static inline var CSS_PRIMITIVE_VALUE:Int = 1;

	public static inline var CSS_VALUE_LIST:Int = 2;

	/** Setter throws DOMException. */
	public var cssText:String;

	public var cssValueType(default,null):Int;
	
}
#end