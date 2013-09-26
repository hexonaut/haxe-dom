package hxdom;

#if js
typedef ScriptProfile = js.html.ScriptProfile;
#else
class ScriptProfile {
	
	public var head(default,null) : ScriptProfileNode;

	public var title(default,null) : String;

	public var uid(default,null) : Int;
	
}
#end