package hxdom.html;

#if js
typedef PagePopupController = js.html.PagePopupController;
#else
class PagePopupController {
	
	public function formatMonth( year : Int, zeroBaseMonth : Int ) : String {
		return null;
	}

	public function localizeNumberString( numberString : String ) : String {
		return null;
	}

	public function setValueAndClosePopup( numberValue : Int, stringValue : String ) : Void {
		
	}
	
}
#end