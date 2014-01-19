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
import hxdom.Elements;

using StringTools;

/**
 * Takes hxdom elements and converts them into idiomatic HTML code.
 * 
 * @author Sam MacPherson
 */
class HtmlSerializer extends Serializer {
	
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
			dataset:null,
			style:null,
			offsetWidth:null,
			offsetHeight:null,
			__listeners:null,
			__vdom:null,
			__htmlSnippet:null
		};
	
	public static var prettyPrint:Bool = false;
	public static var iStr:String = '\t';
	public static var eol:String = '\r\n';
	var indent:Int;
	var actIndent:String;
	
	public function new () {
		super();
		
		indent = 0;
		useCache = true;
		useEnumIndex = USE_ENUM_INDEX;
		attr = false;
	}
	
	function text (t:VirtualNode<hxdom.html.Text>):Void {
		if(prettyPrint)
			buf.add("".lpad(iStr, indent) + iStr + t.node.data + eol );
		else
			buf.add(t.node.data);
	}
	
	function element (e:VirtualNode<Element>):Void {
		openTag(e);
		indent++;
		children(e);
		indent--;
		closeTag(e);
	}
	
	function openTag (e:VirtualNode<Element>):Void {
		if(prettyPrint)
			buf.add("".lpad(iStr, indent) + "<" + e.node.tagName.toLowerCase());
		else
			buf.add("<" + e.node.tagName.toLowerCase());
		attrs(e);
		buf.add(prettyPrint && e.node.hasChildNodes() ? ">" + eol: ">");
	}
	
	function closeTag (e:VirtualNode<Element>):Void {
		if(prettyPrint)
			buf.add((e.node.hasChildNodes()? "".lpad(iStr, indent):'') + "</" + e.node.tagName.toLowerCase() + ">" + eol);
		else	
			buf.add("</" + e.node.tagName.toLowerCase() + ">");
	}
	
	/**
	 * Space delimited list of ids with the element's first followed by one or more for text nodes that are direct decendants.
	 * The length is used to find node boundaries when unserializing on the client.
	 */
	inline function elemIds (e:VirtualNode<Element>):Void {
		buf.add(" data-hxid='" + Reflect.field(e, "id"));
		if (!Reflect.hasField(e.node, "__htmlSnippet")) {
			for (i in e.node.childNodes) {
				if (i.nodeType == Node.TEXT_NODE) {
					var text:Text = Reflect.field(i, "__vdom");
					if(prettyPrint)
						buf.add(" " + Reflect.field(text, "id") + "-" + ("".lpad(iStr, indent) + iStr + untyped i.data + eol).length);
					else
						buf.add(" " + Reflect.field(text, "id") + "-" + untyped i.data.length);
				}
			}
		}
		buf.add("'");
	}
	
	function attrs (e:VirtualNode<Element>):Void {
		//Add in class data and id data
		attr = true;
		elemIds(e);
		
		//Add in actual 'data-' attrs
		for (i in Reflect.fields(e.node.dataset)) {
			buf.add(" data-" + DomTools.camelCaseToDash(i) + "='" + Std.string(Reflect.field(e.node.dataset, i)).htmlEscape(true) + "'");
		}
		
		//Add in style attribute
		var style = null;
		for (i in Reflect.fields(e.node.style)) {
			if (style == null) style = " style='";
			style += (DomTools.camelCaseToDash(i) + ":" + Reflect.field(e.node.style, i)).htmlEscape(true) + ";";
		}
		if (style != null) buf.add(style + "'");
		
		for (i in Reflect.fields(e.node)) {
			//Skip over some redundant fields
			if (Reflect.hasField(fieldsToIgnore, i)) continue;
			
			//This is a core html attribute
			var attrName = i;
			if (attrName == "className") attrName = "class";	//className maps to class
			var val = Reflect.field(e.node, i);
			switch (Type.typeof(val)) {
				case TBool:
					if (val) buf.add(" " + DomTools.camelCaseToDash(attrName));
				default:
					buf.add(" " + DomTools.camelCaseToDash(attrName) + "='" + val + "'");
			}
		}
		
		//Add in event handlers
		var events:Map<String, List<{inst:Dynamic, func:String, cap:Bool}>> = Reflect.field(e.node, "__listeners");
		if (events != null) {
			buf.add(" data-hxevents='");
			serialize(events);
			buf.add("'");
		}
		
		//Add in vdom fields
		var sortedFields = Reflect.fields(e);
		sortedFields.sort(function (a, b) { return (a < b) ? -1 : 1; } );
		buf.add(" data-hxclass='" + Type.getClassName(Type.getClass(e)) + "'");
		for (i in sortedFields) {
			if (i != "node" && i != "id") {
				buf.add(" data-hxd" + DomTools.camelCaseToDash(i) + "='");
				serialize(Reflect.field(e, i));
				buf.add("'");
			}
		}
		
		attr = false;
	}
	
	function children (e:VirtualNode<Element>):Void {
		for (i in e.node.childNodes) {
			serialize(Reflect.field(i, "__vdom"));
		}
	}
	
	public override function serialize (v:Dynamic):Void {
		if (Std.is(v, VirtualNode)) {
			var vn:VirtualNode<Node> = cast v;
			if (attr) {
				//For attribute serialization we always use the element's id
				//Use 'D' to mark DOM id -- it's unused by serializer
				buf.add("D" + Std.string(v.id));
			} else {
				//Otherwise we have special serialization for elements
				switch (vn.node.nodeType) {
					case Node.ELEMENT_NODE:
						element(cast vn);
					case Node.TEXT_NODE:
						text(cast vn);
				}
			}
		} else if (Type.typeof(v) == TObject) {
			var name = null;
			try {
				name = Type.getClassName(v);
			} catch (e:Dynamic) {
			}
			if (name != null) {
				//This is a reference to a class -- just serialize the name
				buf.add("O");
				serializeString(name);
			} else {
				//Regular object
				super.serialize(v);
			}
		} else {
			super.serialize(v);
		}
	}

	public static function run (html:VirtualNode<HtmlElement>):String {
		var s = new HtmlSerializer();
		s.buf.add("<!DOCTYPE html>");
		s.serialize(html);
		return s.toString();
	}
	
}