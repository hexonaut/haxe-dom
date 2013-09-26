package hxdom.html.fs;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef FileSystem = js.html.fs.FileSystem;
#else
class FileSystem {
	
	public var name(default,null) : String;

	public var root(default,null) : DirectoryEntry;
	
}
#end