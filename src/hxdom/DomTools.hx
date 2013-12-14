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

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
#if !macro
import hxdom.html.Element;
import hxdom.html.Event;
import hxdom.html.EventListener;
import hxdom.html.EventTarget;
import hxdom.html.Node;
import hxdom.html.ScriptElement;
import hxdom.Elements;
#end
import hxdom.EventDispatcher;
using Lambda;

/**
 * Utility functions for common DOM operations. Most functions are built for chaining.
 * 
 * @author Sam MacPherson
 */
class DomTools {
	
	#if !macro
	/**
	 * Does an appendChild, but returns the current node for chaining.
	 */
	public static function add<T:VirtualNode<Dynamic>> (parent:T, child:VirtualNode<Dynamic>):T {
		parent.appendChild(child);
		
		return parent;
	}
	
	/**
	 * Does an removeChild, but returns the current node for chaining.
	 */
	public static function remove<T:VirtualNode<Dynamic>> (parent:T, child:VirtualNode<Dynamic>):T {
		parent.removeChild(child);
		
		return parent;
	}
	
	/**
	 * Does an insertBefore, but returns the current node for chaining.
	 */
	public static function insert<T:VirtualNode<Dynamic>> (parent:T, child:VirtualNode<Dynamic>, ?ref:VirtualNode<Dynamic>):T {
		parent.insertBefore(child, ref);
		
		return parent;
	}
	
	/**
	 * Clear all children.
	 */
	public static function clear<T:VirtualNode<Dynamic>> (node:T):T {
		while (node.node.childNodes.length > 0) {
			node.node.removeChild(node.node.firstChild);
		}
		
		return node;
	}
	
	/**
	 * Add in classes for this element. Space delimited.
	 */
	public static function classes<T:VirtualElement<Dynamic>> (e:T, cls:String):T {
		if (e.node.className == null || e.node.className == "") e.node.className = cls;
		else e.node.className += " " + cls;
		
		return e;
	}
	
	/**
	 * Returns true if the node has the given class.
	 */
	public static function hasClass<T:VirtualElement<Dynamic>> (e:T, cls:String):Bool {
		if (e.node.className != null && e.node.className != "") {
			var ecls:Array<String> = e.node.className.split(" ");
			var newCls = new Array<String>();
			for (i in ecls) {
				if (cls == i) {
					return true;
				}
			}
		}
		
		return false;
	}
	
	/**
	 * Remove classes for this element. Space delimited.
	 */
	public static function removeClasses<T:VirtualElement<Dynamic>> (e:T, cls:String):T {
		if (e.node.className != null && e.node.className != "") {
			var clsArr = cls.split(" ");
			var ecls:Array<String> = e.node.className.split(" ");
			var newCls = new Array<String>();
			for (i in ecls) {
				if (!clsArr.has(i)) {
					newCls.push(i);
				}
			}
			e.node.className = newCls.join(" ");
		}
		
		return e;
	}
	
	/**
	 * Shortcut for adding text.
	 */
	public static function addText<T:VirtualElement<Dynamic>> (parent:T, text:String):T {
		parent.appendChild(new Text(text));
		
		return parent;
	}
	
	/**
	 * Sets the text of this node. This assumes that the text is the only child node.
	 */
	public static function setText<T:VirtualElement<Dynamic>> (parent:T, text:String):T {
		clear(parent);
		parent.appendChild(new Text(text));
		
		return parent;
	}
	
	/**
	 * Set any attribute for this element.
	 */
	public static function unsafeAttr<T:VirtualElement<Dynamic>> (e:T, key:String, val:Dynamic):T {
		Reflect.setField(e.node, key, val);
		
		return e;
	}
	
	/**
	 * Set an attribute from a preset list of valid attributes.
	 */
	public static function attr<T:VirtualElement<Dynamic>> (e:T, key:Attr, val:Dynamic):T {
		var keyStr = Std.string(key);
		unsafeAttr(e, keyStr.charAt(0).toLowerCase() + keyStr.substr(1), val);
		
		return e;
	}
	
	/**
	 * Converts dash seperated to camel case.
	 * 
	 * Example:
	 * 		my-custom-attr => myCustomAttr
	 */
	public static inline function dashToCamelCase (str:String):String {
		var outStr = "";
		var caps = false;
		for (i in 0 ... str.length) {
			var chr = str.charCodeAt(i);
			if (chr == '-'.code) {
				caps = true;
			} else {
				if (caps) {
					if (chr >= 'a'.code && chr <= 'z'.code) {
						chr += 'A'.code - 'a'.code;
					}
					caps = false;
				}
				outStr += String.fromCharCode(chr);
			}
		}
		return outStr;
	}
	
	/**
	 * Converts camel case to dash seperated.
	 * 
	 * Example:
	 * 		myCustomAttr => my-custom-attr
	 */
	public static inline function camelCaseToDash (str:String):String {
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
	
	/**
	 * Retrieve the virtual node from this real node.
	 */
	public static inline function vnode (node:Node):VirtualNode<Node> {
		return Reflect.field(node, "__vdom");
	}
	
	/**
	 * Will return the element of the given type along the event path.
	 */
	public static function delegate<T> (event:Event, type:Class<T>):Null<T> {
		var currNode = cast(event.target, Node);
		while (currNode != null && currNode != event.currentTarget) {
			var vnode = vnode(currNode);
			if (Std.is(vnode, type)) {
				return cast vnode;
			}
			
			currNode = currNode.parentNode;
		}
		return null;
	}
	#end
	
	/**
	 * Add event listeners to classes implementing IEventDispatcher.
	 */
	macro public static function addEventListener (ethis:ExprOf<IEventDispatcher>, type:ExprOf<String>, listener:ExprOf<hxdom.html.EventListener>, ?useCapture:ExprOf<Bool>):ExprOf<Void> {
		return macro $ethis.__addEventListener($type, ${EventHandler.doMake(listener)}, $useCapture);
	}
	
	/**
	 * Remove event listeners to classes implementing IEventDispatcher.
	 */
	macro public static function removeEventListener (ethis:ExprOf<IEventDispatcher>, type:ExprOf<String>, listener:ExprOf<hxdom.html.EventListener>, ?useCapture:ExprOf<Bool>):ExprOf<Void> {
		return macro $ethis.__addEventListener($type, ${EventHandler.doMake(listener)}, $useCapture);
	}
	
}