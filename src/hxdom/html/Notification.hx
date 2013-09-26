package hxdom.html;

#if js
typedef Notification = js.html.Notification;
#else
class Notification extends EventTarget {
	
	public var dir : String;

	/** &nbsp;A function to call when the notification is clicked. */
	public var onclick : EventListener;

	/** &nbsp;A function to call when the notification is dismissed. */
	public var onclose : EventListener;

	public var ondisplay : EventListener;

	public var onerror : EventListener;

	public var onshow : EventListener;

	public var permission(default,null) : String;

	public var replaceId : String;

	public var tag : String;

	public function new( title : String, options : Dynamic ) {
		
	}
	
	public function cancel() : Void {
		
	}

	public function close() : Void {
		
	}

	public static function requestPermission( callback_ : NotificationPermissionCallback ) : Void {
		
	}
	
	public function show() : Void {
		
	}
	
}
#end