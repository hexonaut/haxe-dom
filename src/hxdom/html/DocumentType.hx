package hxdom.html;

#if js
typedef DocumentType = js.html.DocumentType;
#else
class DocumentType extends Node {
	
	public var entities(default ,null):NamedNodeMap;

	public var internalSubset(default, null):String;

	public var name(default, null):String;

	public var notations(default, null):NamedNodeMap;

	public var publicId(default, null):String;

	public var systemId(default, null):String;

	public function remove ():Void {
		
	}
	
}
#end