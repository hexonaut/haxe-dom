package hxdom.sql;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef Error = js.html.sql.Error;
#else
class Error {
	
	public static inline var CONSTRAINT_ERR : Int = 6;

	public static inline var DATABASE_ERR : Int = 1;

	public static inline var QUOTA_ERR : Int = 4;

	public static inline var SYNTAX_ERR : Int = 5;

	public static inline var TIMEOUT_ERR : Int = 7;

	public static inline var TOO_LARGE_ERR : Int = 3;

	public static inline var UNKNOWN_ERR : Int = 0;

	public static inline var VERSION_ERR : Int = 2;

	public var code(default,null) : Int;

	public var message(default,null) : String;

}
#end