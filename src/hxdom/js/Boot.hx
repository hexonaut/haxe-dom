/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.js;

import haxe.Unserializer;
import hxdom.html.Element;
import hxdom.html.HtmlElement;
import hxdom.html.Node;

using StringTools;

/**
 * Takes the browser parsed dom and returns the root node that was fed into the HTMLSerializer.run() method.
 * 
 * @author Sam MacPherson
 */
class Boot extends Unserializer {
	
	var elementLookup:Map<Int, Element>;		//Find elements from their id
	
	public function new () {
		super("");
		
		elementLookup = new Map<Int, Element>();
	}
	
	function element (e:Element):Void {
		for (i in e.attributes) {
			if (i.nodeName == "data-class") {
				//Inject the actual class's prototype into the dom element
				var cls = Type.resolveClass(i.nodeValue);
				if (cls != null) {
					untyped e.__proto__ = cls.prototype;
				} else {
					throw "Class " + i.nodeValue + " not found. Be sure the class is available to the client.";
				}
			} else if (i.nodeName == "data-id") {
				//The element's id -- keep moving
			} else if (i.nodeName.startsWith("data-k")) {
				var index = Std.parseInt(i.nodeName.substr("data-k".length));
				var key = i.nodeValue;
				var value = doUnserialize(e.attributes.getNamedItem("data-v" + index).nodeValue);
				if (key == "listeners") {
					//Apply event listeners
					var listeners:Map<String, List<{inst:Dynamic, func:String, cap:Bool}>> = cast value;
					for (eventType in listeners.keys()) {
						for (eh in listeners.get(eventType)) {
							#if js
							e.addEventListener(eventType, function (e) { Reflect.callMethod(eh.inst, Reflect.field(eh.inst, eh.func), [e]); }, eh.cap);
							#end
						}
					}
				} else {
					//This is just some random variable
					Reflect.setField(e, key, value);
				}
			}
		}
	}
	
	function unserializeNode (node:Node):Void {
		switch (node.nodeType) {
			case Node.ELEMENT_NODE: 
				element(cast node);
				for (i in node.childNodes) {
					unserializeNode(i);
				}
		}
	}
	
	function buildElementLookup (node:Node):Void {
		if (node.nodeType == Node.ELEMENT_NODE) {
			elementLookup.set(Std.parseInt(node.attributes.getNamedItem("data-id").nodeValue), cast node);
			
			for (i in node.childNodes) {
				buildElementLookup(i);
			}
		}
	}
	
	/**
	 * Sets up a unserialize call by messing with the buffer and position.
	 */
	function doUnserialize (str:String):Dynamic {
		buf = str;
		pos = 0;
		length = str.length;
		
		return unserialize();
	}
	
	public override function unserialize ():Dynamic {
		if (get(pos) == 'D'.code) {
			//Element ID reference
			pos++;
			var e = elementLookup.get(readDigits());
			if (e == null) throw "Missing element reference!";
			return e;
		} else {
			return super.unserialize();
		}
	}
	
	public static function init ():HtmlElement {
		#if js
		var html = js.Browser.document.childNodes[1];
		var boot = new Boot();
		boot.buildElementLookup(html);
		boot.unserializeNode(html);
		return cast html;
		#else
		throw "Only available to JS.";
		return null;
		#end
	}
	
}