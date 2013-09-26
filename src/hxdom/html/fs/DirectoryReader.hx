package hxdom.fs;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef DirectoryReader = js.html.fs.DirectoryReader;
#else
class DirectoryReader extends Entry {
	
	public function readEntries( successCallback : EntriesCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}
	
}
#end