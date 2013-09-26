package hxdom.html.fs;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef DirectoryReader = js.html.fs.DirectoryReader;
#else
class DirectoryReader extends Entry {
	
	public function readEntries( successCallback : EntriesCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}
	
}
#end