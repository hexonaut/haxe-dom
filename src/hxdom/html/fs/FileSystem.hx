package hxdom.fs;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef FileSystem = js.html.fs.FileSystem;
#else
class FileSystem {
	
	public var name(default,null) : String;

	public var root(default,null) : DirectoryEntry;
	
}
#end