package hxdom.fs;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef DirectoryEntry = js.html.fs.DirectoryEntry;
#else
class DirectoryEntry extends Entry {
	
	public function createReader() : DirectoryReader {
		return null;
	}

	public function getDirectory( path : String, ?options : Dynamic, ?successCallback : EntryCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}

	public function getFile( path : String, ?options : Dynamic, ?successCallback : EntryCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}

	public function removeRecursively( successCallback : hxdom.VoidCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}
	
}
#end