package hxdom.html;

#if js
typedef Text = js.html.Text;
#else
class Text extends CharacterData {
	
	/** Returns all text of all Text nodes logically adjacent to this node, concatenated in document order. */
	public var wholeText (default,null):String;

	public function replaceWholeText (content:String):Text {
		return null;
	}

	public function splitText (offset:Int):Text {
		return null;
	}
	
}
#end