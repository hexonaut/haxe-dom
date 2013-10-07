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
	
	public static var USE_ENUM_INDEX:Bool = false;
	
	var attr:Bool;
	
	static var fieldsToIgnore = {
			nodeType:null,
			tagName:null,
			childNodes:null,
			parentNode:null,
			nextSibling:null,
			previousSibling:null,
			firstChild:null,
			lastChild:null,
			__id:null
		};
	
	public function new () {
		super();
		
		useCache = true;
		useEnumIndex = USE_ENUM_INDEX;
		attr = false;
	}
	
	inline function closeTagRequired (e:Element):Bool {
		return e.childNodes.length > 0 || e.tagName == "SCRIPT" || e.tagName == "BUTTON";
	}
	
	function text (cd:CharacterData):Void {
		buf.add(cd.data);
	}
	
	function element (e:Element):Void {
		openTag(e);
		if (closeTagRequired(e)) {
			children(e);
			closeTag(e);
		}
	}
	
	function openTag (e:Element):Void {
		buf.add("<" + e.tagName.toLowerCase());
		attrs(e);
		buf.add(closeTagRequired(e) ? ">" : "/>");
	}
	
	function closeTag (e:Element):Void {
		buf.add("</" + e.tagName.toLowerCase() + ">");
	}
	
	/**
	 * @return The HTML attribute this field coresponds to or null if it is not a standard attribute.
	 */
	inline function attrMapping (attr:String):Null<String> {
		if (Reflect.hasField(Attr, attr)) {
			//Take care of exceptions
			attr = switch (attr) {
				case "acceptCharset": "accept-charset";
				case "className": "class";
				case "httpEquiv": "http-equiv";
				default: attr;
			}
			
			return attr;
		} else {
			return null;
		}
	}
	
	function attrs (e:Element):Void {
		//Add in class data and id data
		attr = true;
		buf.add(" data-class='" + Type.getClassName(Type.getClass(e)) + "'");
		buf.add(" data-id='" + untyped e.__id + "'");
		var count = 0;
		
		for (i in Reflect.fields(e)) {
			//Skip over some redundant fields
			if (Reflect.hasField(fieldsToIgnore, i)) continue;
			
			var attrName = attrMapping(i);
			if (attrName != null) {
				//This is a core html attribute
				var val = Reflect.field(e, i);
				switch (Type.typeof(val)) {
					case TBool:
						if (val) buf.add(" " + attrName);
					default:
						buf.add(" " + attrName + "='" + val + "'");
				}
			} else {
				//This is extra data
				buf.add(" data-k" + count + "='" + i + "'");
				buf.add(" data-v" + count + "='");
				serialize(Reflect.field(e, i));
				buf.add("'");
				
				count++;
			}
		}
		attr = false;
	}
	
	function children (e:Element):Void {
		for (i in e.childNodes) {
			serialize(i);
		}
	}
	
	public override function serialize (v:Dynamic):Void {
		if (Std.is(v, Node)) {
			var node:Node = cast v;
			switch (node.nodeType) {
				case Node.ELEMENT_NODE:
					if (attr) {
						//For attribute serialization we always use the element's id
						//Use 'D' to mark DOM id -- it's unused by serializer
						buf.add("D" + Std.string(untyped v.__id));
					} else {
						element(cast v);
					}
				case Node.TEXT_NODE: 
					if (attr) {
						//If text is in the attribute use normal serialization
						super.serialize(v);
					} else {
						text(cast v);
					}
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