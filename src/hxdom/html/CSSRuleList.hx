package hxdom.html;

#if js
typedef CSSRuleList = js.html.CSSRuleList;
#else
class CSSRuleList implements ArrayAccess<CSSRule> {
	
	public var length(default, null):Int;

	public function item (index:Int):CSSRule {
		return null;
	}
	
}
#end