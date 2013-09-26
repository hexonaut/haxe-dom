package hxdom.html.rtc;

import hxdom.html.Element;
import hxdom.html.EventTarget;
import hxdom.html.NodeList;

#if js
typedef NavigatorUserMediaError = js.html.rtc.NavigatorUserMediaError;
#else
class NavigatorUserMediaError {
	
	public static inline var PERMISSION_DENIED : Int = 1;

	public var code(default,null) : Int;
	
}
#end