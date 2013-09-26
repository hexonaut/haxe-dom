package hxdom.html.fs;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef Metadata = js.html.fs.Metadata;
#else
class Metadata {
	
	public var modificationTime(default,null) : Date;

	public var size(default,null) : Int;
	
}
#end