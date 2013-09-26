package hxdom;

#if js
typedef Blob = js.html.Blob;
#else
class Blob  {
	
	/** The size, in bytes, of the data contained in the <code>Blob</code> object. <strong>Read only.</strong> */
	public var size(default,null) : Int;

	/** An ASCII-encoded string, in all lower case, indicating the MIME&nbsp;type of the data contained in the <code>Blob</code>. If the type is unknown, this string is empty. <strong>Read only.</strong> */
	public var type(default,null) : String;

	public function new( ?arg0 : Dynamic, ?arg1 : Dynamic ) : Void {
		
	}

	public function slice( ?start : Int, ?end : Int, ?contentType : String ) : Blob {
		return null;
	}
	
}
#end