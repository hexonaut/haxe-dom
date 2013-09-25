package hxdom;

#if js
typedef MediaList = js.html.MediaList;
#else
class MediaList implements ArrayAccess<String> {
	
	var length(default, null):Int;

	/** Setter throws DOMException. */
	var mediaText:String;

	function appendMedium (newMedium:String):Void {
		
	}

	function deleteMedium (oldMedium:String):Void {
		
	}

	function item (index:Int):String {
		
	}
	
}
#end