package hxdom.html;

#if js
typedef DOMMimeType = js.html.DOMMimeType;
#else
class DOMMimeType {
	
	public var description(default,null) : String;

	public var enabledPlugin(default,null) : DOMPlugin;

	public var suffixes(default,null) : String;

	public var type(default,null) : String;
	
}
#end