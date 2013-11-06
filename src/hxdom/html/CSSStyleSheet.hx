/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.html;

#if (js && !use_vdom)
typedef CSSStyleSheet = js.html.CSSStyleSheet;
#else
class CSSStyleSheet extends StyleSheet {
	
	/** Returns a <code><a title="en/DOM/CSSRuleList" rel="internal" href="https://developer.mozilla.org/en/DOM/CSSRuleList">CSSRuleList</a></code> of the CSS rules in the style sheet. */
	public var cssRules(default, null):CSSRuleList;

	/** If this style sheet is imported into the document using an <code><a title="en/CSS/@import" rel="internal" href="https://developer.mozilla.org/en/CSS/@import">@import</a></code> rule, the <code>ownerRule</code> property will return that <code><a title="en/DOM/CSSImportRule" rel="internal" href="https://developer.mozilla.org/en/DOM/CSSImportRule" class="new ">CSSImportRule</a></code>, otherwise it returns <code>null</code>. */
	public var ownerRule(default, null):CSSRule;

	public var rules(default, null):CSSRuleList;

	public function addRule (selector:String, style:String, ?index:Int):Int {
		return null;
	}

	public function deleteRule (index:Int):Void {
		
	}

	public function insertRule (rule:String, index:Int):Int {
		return null;
	}

	public function removeRule (index:Int):Void {
		
	}
	
}
#end