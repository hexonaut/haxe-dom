package hxdom.fs;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef EntryArray = js.html.fs.EntryArray;
#else
class EntryArray implements ArrayAccess<Entry> {
	
	public var length(default,null) : Int;

	public function item( index : Int ) : Entry {
		return null;
	}
	
}
#end