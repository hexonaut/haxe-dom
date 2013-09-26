package hxdom.html.webgl;

#if js
typedef ShaderPrecisionFormat = js.html.webgl.ShaderPrecisionFormat;
#else
class ShaderPrecisionFormat {
	
	public var precision(default, null):Int;

	public var rangeMax(default, null):Int;

	public var rangeMin(default, null):Int;
	
}
#end