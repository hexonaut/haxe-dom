package hxdom;

#if js
typedef DataTransferItemList = js.html.DataTransferItemList;
#else
class DataTransferItemList implements ArrayAccess<DataTransferItem> {
	
	public var length(default,null) : Int;

	@:overload( function( file : File ) :Void {} )
	public function add( data : String, type : String ) : Void {
		
	}

	public function clear() : Void {
		
	}

	public function item( index : Int ) : DataTransferItem {
		return null;
	}
	
}
#end