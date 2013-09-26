package hxdom.html.sql;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef Transaction = js.html.sql.Transaction;
#else
class Transaction {
	
	public function executeSql( sqlStatement : String, arguments : Array<Dynamic>, ?callback_ : StatementCallback, ?errorCallback : StatementErrorCallback ) : Void {
		
	}

}
#end