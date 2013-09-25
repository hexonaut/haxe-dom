package hxdom;

#if js
typedef StyleSheetList = js.html.StyleSheetList;
#else
class StyleSheetList implements ArrayAccess<StyleSheet> {
	
	public var length(default, null):Int;

	public function item (index:Int):StyleSheet {
		
	}
	
}
#end