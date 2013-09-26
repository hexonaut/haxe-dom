package hxdom.html;

#if js
typedef Storage = js.html.Storage;
#else
class Storage {
	
	/** Getter throws DOMException. */
	public var length(default,null) : Int;

	public function clear() : Void {
		
	}

	public function getItem( key : String ) : String {
		return null;
	}

	public function key( index : Int ) : String {
		return null;
	}

	public function removeItem( key : String ) : Void {
		
	}

	public function setItem( key : String, data : String ) : Void {
		
	}

	
}
#end