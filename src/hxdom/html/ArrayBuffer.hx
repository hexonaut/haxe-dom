package hxdom.html;

#if js
typedef ArrayBuffer = js.html.ArrayBuffer;
#else
class ArrayBuffer {
	
	/** The size, in bytes, of the array. This is established when the array is constructed and cannot be changed. <strong>Read only.</strong> */
	public var byteLength(default,null):Int;

	public function new (?arg0:Dynamic) {
		
	}
	
	public function slice (begin:Int, ?end:Int):ArrayBuffer {
		return null;
	}
	
}
#end