package hxdom;

#if js
typedef CSSStyleSheet = js.html.CSSStyleSheet;
#else
class CSSStyleSheet extends StyleSheet {
	
	/** Returns a <code><a title="en/DOM/CSSRuleList" rel="internal" href="https://developer.mozilla.org/en/DOM/CSSRuleList">CSSRuleList</a></code> of the CSS rules in the style sheet. */
	public var cssRules(default, null):CSSRuleList;

	/** If this style sheet is imported into the document using an <code><a title="en/CSS/@import" rel="internal" href="https://developer.mozilla.org/en/CSS/@import">@import</a></code> rule, the <code>ownerRule</code> property will return that <code><a title="en/DOM/CSSImportRule" rel="internal" href="https://developer.mozilla.org/en/DOM/CSSImportRule" class="new ">CSSImportRule</a></code>, otherwise it returns <code>null</code>. */
	public var ownerRule(default, null):CSSRule;

	public var rules(default, null):CSSRuleList;

	public function addRule (selector:String, style:String, ?index:Int):Int {
		
	}

	public function deleteRule (index:Int):Void {
		
	}

	public function insertRule (rule:String, index:Int):Int {
		
	}

	public function removeRule (index:Int):Void {
		
	}
	
}
#end