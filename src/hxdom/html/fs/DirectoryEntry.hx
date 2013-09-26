package hxdom.html.fs;

import hxdom.html.Element;
import hxdom.html.NodeList;

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

	public function removeRecursively( successCallback : hxdom.html.VoidCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}
	
}
#end