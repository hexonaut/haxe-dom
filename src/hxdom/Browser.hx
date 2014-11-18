package hxdom;

/**
 * Cross platform Browser.
 * 
 * @author Sam MacPherson
 */
#if (js && !use_vdom)
typedef Browser = js.Browser;
#else
class Browser {
	static var _document:dom4.Document;
	public static var document(get, never):dom4.Document;
	inline static function get_document() {
		if (_document == null) {
			var impl = new dom4.DOMImplementation();
			_document = impl.createDocument("http://www.w3.org/1999/xhtml", 'html', impl.createDocumentType('html', '', ''));
		}
		return _document;
	}
}
#end