package hxdom.idb;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef Factory = js.html.idb.Factory;
#else
class Factory {
	
	public function cmp( first : Key, second : Key ) : Int {
		return null;
	}

	public function deleteDatabase( name : String ) : VersionChangeRequest {
		return null;
	}

	public function getDatabaseNames() : Request {
		return null;
	}

	public function open( name : String, ?version : Int ) : OpenDBRequest {
		return null;
	}

	
}
#end