package hxdom;

#if js
typedef DOMApplicationCache = js.html.DOMApplicationCache;
#else
class DOMApplicationCache extends EventTarget {
	
	public static inline var CHECKING : Int = 2;

	public static inline var DOWNLOADING : Int = 3;

	public static inline var IDLE : Int = 1;

	public static inline var OBSOLETE : Int = 5;

	public static inline var UNCACHED : Int = 0;

	public static inline var UPDATEREADY : Int = 4;

	public var oncached : EventListener;

	public var onchecking : EventListener;

	public var ondownloading : EventListener;

	public var onerror : EventListener;

	public var onnoupdate : EventListener;

	public var onobsolete : EventListener;

	public var onprogress : EventListener;

	public var onupdateready : EventListener;

	public var status(default,null) : Int;

	public function abort() : Void {
		
	}

	public function swapCache() : Void {
		
	}

	public function update() : Void {
		
	}
	
}
#end