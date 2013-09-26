package hxdom.rtc;

import hxdom.Element;
import hxdom.EventTarget;
import hxdom.NodeList;

#if js
typedef NavigatorUserMediaError = js.html.rtc.NavigatorUserMediaError;
#else
class NavigatorUserMediaError {
	
	public static inline var PERMISSION_DENIED : Int = 1;

	public var code(default,null) : Int;
	
}
#end