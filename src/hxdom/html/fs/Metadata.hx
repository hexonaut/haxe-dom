package hxdom.fs;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef Metadata = js.html.fs.Metadata;
#else
class Metadata {
	
	public var modificationTime(default,null) : Date;

	public var size(default,null) : Int;
	
}
#end