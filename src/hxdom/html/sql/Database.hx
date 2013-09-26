package hxdom.sql;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef Database = js.html.sql.Database;
#else
class Database {
	
	public var version(default,null) : String;

	public function changeVersion( oldVersion : String, newVersion : String, ?callback_ : TransactionCallback, ?errorCallback : TransactionErrorCallback, ?successCallback : hxdom.VoidCallback ) : Void {
		
	}

	public function readTransaction( callback_ : TransactionCallback, ?errorCallback : TransactionErrorCallback, ?successCallback : hxdom.VoidCallback ) : Void {
		
	}

	public function transaction( callback_ : TransactionCallback, ?errorCallback : TransactionErrorCallback, ?successCallback : hxdom.VoidCallback ) : Void {
		
	}

}
#end