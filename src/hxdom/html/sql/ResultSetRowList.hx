package hxdom.html.sql;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef ResultSetRowList = js.html.sql.ResultSetRowList;
#else
class ResultSetRowList {
	
	public var length(default,null) : Int;

	public function item( index : Int ) : Dynamic {
		return null;
	}

}
#end