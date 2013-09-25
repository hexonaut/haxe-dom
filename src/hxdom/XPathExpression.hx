package hxdom;

#if js
typedef XPathExpression = js.html.XPathExpression;
#else
class XPathExpression {
	
	public function evaluate (contextNode:Node, type:Int, inResult:XPathResult):XPathResult {
		
	}
	
}
#end