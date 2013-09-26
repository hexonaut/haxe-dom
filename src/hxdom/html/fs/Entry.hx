package hxdom.fs;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef Entry = js.html.fs.Entry;
#else
class Entry {
	
	/** The file system on which the entry resides. */
	public var filesystem(default,null) : FileSystem;

	public var fullPath(default,null) : String;

	/** The entry is a directory. */
	public var isDirectory(default,null) : Bool;

	/** The entry is a file. */
	public var isFile(default,null) : Bool;

	/** The name of the entry, excluding the path leading to it. */
	public var name(default,null) : String;

	public function copyTo( parent : DirectoryEntry, ?name : String, ?successCallback : EntryCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}

	public function getMetadata( successCallback : MetadataCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}

	public function getParent( ?successCallback : EntryCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}

	public function moveTo( parent : DirectoryEntry, ?name : String, ?successCallback : EntryCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}

	public function remove( successCallback : hxdom.VoidCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}

	public function toURL() : String {
		return null;
	}
	
}
#end