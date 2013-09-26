package hxdom.sql;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef ResultSet = js.html.sql.ResultSet;
#else
class ResultSet {
	
	/** Getter throws DOMException. */
	public var insertId(default,null) : Int;

	public var rows(default,null) : ResultSetRowList;

	public var rowsAffected(default,null) : Int;

}
#end