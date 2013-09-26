package hxdom;

#if js
typedef CharacterData = js.html.CharacterData;
#else
class CharacterData extends Node {
	
	/** Setter throws DOMException. */
	public var data : String;

	public var length(default, null) : Int;

	public function appendData( data : String ) : Void {
		
	}

	public function deleteData( offset : Int, length : Int ) : Void {
		
	}

	public function insertData( offset : Int, data : String ) : Void {
		
	}

	public function remove() : Void {
		
	}

	public function replaceData( offset : Int, length : Int, data : String ) : Void {
		
	}

	public function substringData( offset : Int, length : Int ) : String {
		return null;
	}
	
}
#end