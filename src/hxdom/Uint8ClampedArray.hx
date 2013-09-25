package hxdom;

#if js
typedef Uint8ClampedArray = js.html.Uint8ClampedArray;
#else
class Uint8ClampedArray extends Uint8Array implements ArrayAccess<Int> {
	
	public static inline var BYTES_PER_ELEMENT:Int = 1;

	@:overload( function( length:Int ):Void {} )
	@:overload( function( array:Array<Int> ):Void {} )
	@:overload( function( array:Uint8ClampedArray ):Void {} )
	public function new( buffer:ArrayBuffer, ?byteOffset:Int, ?length:Int ) {
		
	}
	
}
#end