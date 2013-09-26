package hxdom.sql;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef Transaction = js.html.sql.Transaction;
#else
class Transaction {
	
	public function executeSql( sqlStatement : String, arguments : Array<Dynamic>, ?callback_ : StatementCallback, ?errorCallback : StatementErrorCallback ) : Void {
		
	}

}
#end