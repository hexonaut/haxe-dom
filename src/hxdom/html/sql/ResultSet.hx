package hxdom.html.sql;

import hxdom.html.Element;
import hxdom.html.NodeList;

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