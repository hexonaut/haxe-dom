package hxdom.html;

#if js
typedef ScriptProfileNode = js.html.ScriptProfileNode;
#else
class ScriptProfileNode {
	
	public var callUID(default,null) : Int;

	public var functionName(default,null) : String;

	public var lineNumber(default,null) : Int;

	public var numberOfCalls(default,null) : Int;

	public var selfTime(default,null) : Float;

	public var totalTime(default,null) : Float;

	public var url(default,null) : String;

	public var visible(default,null) : Bool;

	public function children() : Array<hxdom.html.ScriptProfileNode> {
		return null;
	}
	
}
#end