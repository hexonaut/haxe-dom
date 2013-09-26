package hxdom;

#if js
typedef DocumentFragment = js.html.DocumentFragment;
#else
class DocumentFragment extends Node {
	
	public function querySelector (selectors:String):Element {
		return null;
	}

	public function querySelectorAll (selectors:String):NodeList {
		return null;
	}
	
}
#end