/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

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
			__id:null,
			__noClass:null,
			dataset:null,
			style:null
		};
	
	public function new () {
		super();
		
		useCache = true;
		useEnumIndex = USE_ENUM_INDEX;
		attr = false;
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
		buf.add("<" + e.tagName.toLowerCase());
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
	
	/**
	 * Space delimited list of ids with the element's first followed by one or more for text nodes that are direct decendants.
	 * The length is used to find node boundaries when unserializing on the client.
	 */
	inline function elemIds (e:Element):Void {
		buf.add(" data-id='" + untyped e.__id);
		for (i in e.childNodes) {
			if (i.nodeType == Node.TEXT_NODE) {
				buf.add(" " + untyped i.__id + "-" + untyped i.data.length);
			}
		}
		buf.add("'");
	}
	
	inline function camelCaseToDash (str:String):String {
		var outStr = "";
		for (i in 0 ... str.length) {
			var chr = str.charCodeAt(i);
			if (chr >= 'A'.code && chr <= 'Z'.code) {
				outStr += '-' + String.fromCharCode(chr - 'A'.code + 'a'.code);
			} else {
				outStr += String.fromCharCode(chr);
			}
		}
		return outStr;
	}
	
	function attrs (e:Element):Void {
		//Add in class data and id data
		attr = true;
		if (!Reflect.hasField(e, "__noClass")) buf.add(" data-class='" + Type.getClassName(Type.getClass(e)) + "'");
		elemIds(e);
		var count = 0;
		
		//Add in actual 'data-' attrs
		for (i in Reflect.fields(e.dataset)) {
			buf.add(" data-" + camelCaseToDash(i) + "='" + Std.string(Reflect.field(e.dataset, i)).htmlEscape(true) + "'");
		}
		
		//Add in style attribute
		var style = null;
		for (i in Reflect.fields(e.style)) {
			if (style == null) style = " style='";
			style += Std.string(camelCaseToDash(i) + ":" + Reflect.field(e.style, i)).htmlEscape(true) + ";";
		}
		if (style != null) buf.add(style + "'");
		
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
			if (attr) {
				//For attribute serialization we always use the element's id
				//Use 'D' to mark DOM id -- it's unused by serializer
				buf.add("D" + Std.string(untyped v.__id));
			} else {
				//Otherwise we have special serialization for nodes
				var node:Node = cast v;
				switch (node.nodeType) {
					case Node.ELEMENT_NODE:
						element(cast v);
					case Node.TEXT_NODE: 
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