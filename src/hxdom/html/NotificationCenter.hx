package hxdom.html;

#if js
typedef NotificationCenter = js.html.NotificationCenter;
#else
class NotificationCenter {
	
	public function checkPermission() : Int {
		return null;
	}

	public function createHTMLNotification( url : String ) : Notification {
		return null;
	}

	public function createNotification( iconUrl : String, title : String, body : String ) : Notification {
		return null;
	}

	public function requestPermission( callback_ : VoidCallback ) : Void {
		
	}
	
}
#end