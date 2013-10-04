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
	
	public function new () {
		super("");
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
							e.addEventListener(eventType, Reflect.field(eh.inst, eh.func), eh.cap);
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
	
	function unserializeNode (node:Node):Dynamic {
		cache.push(node);
		
		switch (node.nodeType) {
			case Node.ELEMENT_NODE: element(cast node);
		}
		
		for (i in node.childNodes) {
			unserializeNode(i);
		}
		
		return node;
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
	
	public static function init ():HtmlElement {
		#if js
		return cast new Boot().unserializeNode(js.Browser.document.childNodes[1]);
		#else
		throw "Only available to JS.";
		return null;
		#end
	}
	
}