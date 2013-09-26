package hxdom.html;

#if js
typedef XPathNSResolver = js.html.XPathNSResolver;
#else
class XPathNSResolver {
	
	public function lookupNamespaceURI (prefix:String):String {
		return null;
	}
	
}
#end