package hxdom.html;

#if js
typedef History = js.html.History;
#else
class History {
	
	/** Read-only. Returns the number of elements in the session history, including the currently loaded page. For example, for a page loaded in a new tab this property returns <code>1</code>. */
	public var length(default,null) : Int;

	/** Returns the state at the top of the history stack. This is a way to look at the state without having to wait for a <code>popstate</code> event. <strong>Read only.</strong> */
	public var state(default,null) : Dynamic;

	public function back() : Void {
		
	}

	public function forward() : Void {
		
	}

	public function go( distance : Int ) : Void {
		
	}

	public function pushState( data : Dynamic, title : String, ?url : String ) : Void {
		
	}

	public function replaceState( data : Dynamic, title : String, ?url : String ) : Void {
		
	}
	
}
#end