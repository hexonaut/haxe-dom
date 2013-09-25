package hxdom;

#if js
typedef DOMImplementation = js.html.DOMImplementation;
#else
class DOMImplementation {
	
	public function createCSSStyleSheet (title:String, media:String):CSSStyleSheet {
		
	}

	public function createDocument (?namespaceURI:String, ?qualifiedName:String, ?doctype:DocumentType):Document {
		
	}

	public function createDocumentType (?qualifiedName:String, ?publicId:String, ?systemId:String):DocumentType {
		
	}

	public function createHTMLDocument (title:String):Document {
		
	}

	public function hasFeature (feature:String, ?version:String):Bool {
		
	}
	
}
#end