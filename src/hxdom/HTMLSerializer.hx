package hxdom;

import haxe.rtti.Meta;
import haxe.Serializer;
import hxdom.html.CharacterData;
import hxdom.html.DivElement;
import hxdom.html.Element;
import hxdom.html.HtmlElement;
import hxdom.html.Node;
import hxdom.html.Text;

using StringTools;

/**
 * Takes hxdom elements and converts them into idiomatic HTML code.
 * 
 * @author Sam MacPherson
 */
class HTMLSerializer extends Serializer {
	
	public static var USE_CACHE:Bool = false;
	public static var USE_ENUM_INDEX:Bool = false;
	
	static var fieldsToIgnore = {
			nodeType:null,
			tagName:null,
			childNodes:null,
			parentNode:null,
			nextSibling:null,
			previousSibling:null
		};
	
	public function new () {
		super();
		
		useCache = USE_CACHE;
		useEnumIndex = USE_ENUM_INDEX;
	}
	
	function text (cd:CharacterData):Void {
		buf.add(cd.data);
	}
	
	function element (e:Element):Void {
		openTag(e);
		children(e);
		closeTag(e);
	}
	
	function openTag (e:Element):Void {
		buf.add("<");
		buf.add(e.tagName.toLowerCase());
		attrs(e);
		buf.add(">");
	}
	
	function closeTag (e:Element):Void {
		buf.add("</" + e.tagName.toLowerCase() + ">");
	}
	
	/**
	 * @return The HTML attribute this field coresponds to or null if it is not a standard attribute.
	 */
	inline function attrMapping (attr:String):Null<String> {
		return switch (attr) {
			case "id": "id";
			case "className": "class";
			case "src": "src";
			default: null;
		}
	}
	
	function attrs (e:Element):Void {
		//Add in class data
		buf.add(" data-class='" + Type.getClassName(Type.getClass(e)) + "'");
		var count = 0;
		
		for (i in Reflect.fields(e)) {
			//Skip over some redundant fields
			if (Reflect.hasField(fieldsToIgnore, i)) continue;
			
			var attrName = attrMapping(i);
			if (attrName != null) {
				//This is a core html attribute
				buf.add(" " + attrName + "='" + Reflect.field(e, i) + "'");
			} else {
				//This is extra data
				buf.add(" data-k" + count + "='" + i + "'");
				buf.add(" data-v" + count + "='");
				serialize(Reflect.field(e, i));
				buf.add("'");
				
				count++;
			}
		}
	}
	
	function children (e:Element):Void {
		for (i in e.childNodes) {
			serialize(i);
		}
	}
	
	public override function serialize (v:Dynamic):Void {
		if (Std.is(v, Node)) {
			if (useCache && serializeRef(v)) return;
			
			var node:Node = cast v;
			switch (node.nodeType) {
				case Node.ELEMENT_NODE: element(cast v);
				case Node.TEXT_NODE: text(cast v);
			}
		} else {
			super.serialize(v);
		}
	}

	public static function run (html:HtmlElement):String {
		var s = new HTMLSerializer();
		s.buf.add("<!DOCTYPE html>");
		s.serialize(html);
		return s.toString();
	}
	
}