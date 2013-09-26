package hxdom;

#if js
typedef TimeRanges = js.html.TimeRanges;
#else
class TimeRanges {
	
	/** The number of time ranges represented by the time range object. <strong>Read only.</strong> */
	public var length(default, null):Int;

	public function end (index:Int):Float {
		return null;
	}

	public function start (index:Int):Float {
		return null;
	}
	
}
#end