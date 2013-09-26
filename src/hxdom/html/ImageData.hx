package hxdom.html;

#if js
typedef ImageData = js.html.ImageData;
#else
class ImageData {
	
	public var data(default, null):Uint8ClampedArray;

	public var height(default, null):Int;

	public var width(default, null):Int;
	
}
#end