package hxdom;

#if js
typedef ArrayBufferView = js.html.ArrayBufferView;
#else
class ArrayBufferView {
	
	/** The buffer this view references. <strong>Read only.</strong> */
	public var buffer(default, null):ArrayBuffer;

	/** The length, in bytes, of the view. <strong>Read only.</strong> */
	public var byteLength(default, null):Int;

	/** The offset, in bytes, to the first byte of the view within the <a title="en/JavaScript typed arrays/ArrayBuffer" rel="internal" href="https://developer.mozilla.org/en/JavaScript_typed_arrays/ArrayBuffer"><code>ArrayBuffer</code></a>. */
	public var byteOffset(default, null):Int;
	
}
#end