package hxdom;

#if js
typedef ProcessingInstruction = js.html.ProcessingInstruction;
#else
class ProcessingInstruction {
	
	/** Setter throws DOMException. */
	public var data:String;

	public var sheet(default, null):StyleSheet;

	public var target(default, null):String;
	
}
#end