package hxdom;

#if js
typedef DOMImplementation = js.html.DOMImplementation;
#else
class DOMImplementation {
	
	public function createCSSStyleSheet (title:String, media:String):CSSStyleSheet {
		return null;
	}

	public function createDocument (?namespaceURI:String, ?qualifiedName:String, ?doctype:DocumentType):Document {
		return null;
	}

	public function createDocumentType (?qualifiedName:String, ?publicId:String, ?systemId:String):DocumentType {
		return null;
	}

	public function createHTMLDocument (title:String):Document {
		return null;
	}

	public function hasFeature (feature:String, ?version:String):Bool {
		return null;
	}
	
}
#end