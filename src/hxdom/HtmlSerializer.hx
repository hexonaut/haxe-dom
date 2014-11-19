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
import hxdom.html.NamedNodeMap;
import hxdom.html.Node;
import hxdom.html.Text;
import hxdom.Elements;
import hxdom.util.Util;

using StringTools;

/**
 * Takes hxdom elements and converts them into idiomatic HTML code.
 * 
 * @author Sam MacPherson
 */
class HtmlSerializer extends Serializer {
	
	/**
	 * Store enums as indexes instead of constructor names.
	 */
	public static var USE_ENUM_INDEX:Bool = false;
	
	var attr:Bool;
	var detachedDom:Array<VirtualNode<Dynamic>>;
	
	public function new () {
		super();
		
		useCache = true;
		useEnumIndex = USE_ENUM_INDEX;
		detachedDom = new Array<VirtualNode<Dynamic>>();
		attr = false;
	}
	
	function text (t:VirtualNode<hxdom.html.Text>):Void {
		buf.add(t.node.data.htmlEscape());
	}
	
	function element (e:VirtualNode<Element>):Void {
		openTag(e);
		children(e);
		if (e.node.tagName == "BODY" && detachedDom.length > 0) {
			//Add detached dom elements at the end of the body
			buf.add('<div data-hxunused="1" style="display:none !important;">');
			for (i in detachedDom) {
				serialize(i);
			}
			buf.add('</div>');
		}
		closeTag(e);
	}
	
	function openTag (e:VirtualNode<Element>):Void {
		buf.add("<" + e.node.tagName.toLowerCase());
		attrs(e);
		buf.add(">");
	}
	
	function closeTag (e:VirtualNode<Element>):Void {
		buf.add("</" + e.node.tagName.toLowerCase() + ">");
	}
	
	/**
	 * Space delimited list of ids with the element's first followed by one or more for text nodes that are direct decendants.
	 * The length is used to find node boundaries when unserializing on the client.
	 */
	inline function elemIds (e:VirtualNode<Element>):Void {
		buf.add(" data-hxid='" + Reflect.field(e, "id"));
		for (i in e) {
			if (i.node.nodeType == Node.TEXT_NODE) {
				buf.add(" " + Reflect.field(i, "id") + "-" + untyped i.node.data.length);
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
			buf.add(" data-" + Util.camelCaseToDash(i) + "='" + Std.string(Reflect.field(e.node.dataset, i)).htmlEscape(true) + "'");
		}
		
		//Add in style attribute
		var style = null;
		for (i in Reflect.fields(e.node.style)) {
			if (style == null) style = " style='";
			style += (Util.camelCaseToDash(i) + ":" + Reflect.field(e.node.style, i)).htmlEscape(true) + ";";
		}
		if (style != null) buf.add(style + "'");
		
		//Add in class attribute
		var classes = e.node.className;
		if (classes != null) buf.add(" class='" + classes + "'");
		
		//Add in attributes
		var attributes:NamedNodeMap = e.node.attributes;
		for (i in 0 ... attributes.length) {
			#if (js && !use_vdom)
			var a:Dynamic = attributes[i];
			#else
			var a:dom4.Attr = cast attributes[i];
			#end
			buf.add(" " + a.name + "='" + a.value.htmlEscape(true) + "'");
		}
		
		//Add in event handlers
		var events:Map<String, List<{inst:Dynamic, func:String, cap:Bool}>> = Reflect.field(e, "__listeners");
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
			if (i != "node" && i != "id" && i != "inDom" && i != "inDomCached") {
				buf.add(" data-hxd" + Util.camelCaseToDash(i) + "='");
				serialize(Reflect.field(e, i));
				buf.add("'");
			}
		}
		
		attr = false;
	}
	
	function children (e:VirtualNode<Element>):Void {
		for (i in e) {
			serialize(i);
		}
	}
	
	inline function addUnusedDom (e:VirtualNode<Dynamic>):Void {
		detachedDom.remove(e);
		detachedDom.push(e);
	}
	
	public override function serialize (v:Dynamic):Void {
		if (Std.is(v, VirtualNode)) {
			var vn:VirtualNode<Node> = cast v;
			if (attr) {
				//For attribute serialization we always use the element's id
				//Use 'D' to mark DOM id -- it's unused by serializer
				buf.add("D" + Std.string(v.id));
				if (untyped !v.isInDom()) {
					//If element is not in the DOM then add it to unused dom list
					addUnusedDom(v);
				}
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