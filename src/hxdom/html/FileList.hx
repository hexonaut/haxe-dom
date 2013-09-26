package hxdom.html;

#if js
typedef FileList = js.html.FileList;
#else
class FileList implements ArrayAccess<File> {
	
	/** A read-only value indicating the number of files in the list. */
	public var length(default,null) : Int;

	public function item( index : Int ) : File {
		return null;
	}
	
}
#end