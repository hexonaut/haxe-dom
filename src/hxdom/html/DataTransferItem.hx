package hxdom;

#if js
typedef DataTransferItem = js.html.DataTransferItem;
#else
class DataTransferItem {
	
	public var kind(default,null) : String;

	public var type(default,null) : String;

	public function getAsEntry() : hxdom.fs.Entry {
		return null;
	}

	public function getAsFile() : Blob {
		return null;
	}

	public function getAsString( callback_ : StringCallback ) : Void {
		
	}
	
}
#end