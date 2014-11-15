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
import hxdom.html.Event;
#if !macro
import hxdom.html.Element;
import hxdom.html.EventListener;
import hxdom.html.EventTarget;
import hxdom.html.Node;
import hxdom.html.ScriptElement;
import hxdom.Elements;
#end
import hxdom.EventDispatcher;

using Lambda;

/**
 * Utility functions for common DOM operations. Built to mimic the JQuery API. Most functions are built for chaining.
 * 
 * @author Sam MacPherson
 */
class DomTools {
	
	#if !macro
	/**
	 * Appends an element to the end.
	 */
	public static function append<T:VirtualNode<Dynamic>> (parent:T, child:VirtualNode<Dynamic>):T {
		parent.node.appendChild(child.node);
		
		return parent;
	}
	
	/**
	 * Removes the element from its parent.
	 */
	public static function remove<T:VirtualNode<Dynamic>> (e:T):T {
		e.node.parentNode.removeChild(e.node);
		
		return e;
	}
	
	/**
	 * Clear all children.
	 */
	public static function empty<T:VirtualNode<Dynamic>> (node:T):T {
		while (node.node.childNodes.length > 0) {
			node.node.removeChild(node.node.firstChild);
		}
		
		return node;
	}
	
	/**
	 * Add in classes for this element. Space delimited.
	 */
	public static function addClass<T:VirtualElement<Dynamic>> (e:T, cls:String):T {
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
	public static function removeClass<T:VirtualElement<Dynamic>> (e:T, cls:String):T {
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
	 * Toggle a class on and off.
	 */
	public static function toggleClass<T:VirtualElement<Dynamic>> (e:T, cls:String):T {
		if (hasClass(e, cls)) removeClass(e, cls);
		else addClass(e, cls);
		
		return e;
	}
	
	/**
	 * Sets the element's value property.
	 */
	public static function setVal<T:VirtualElement<Dynamic>> (e:T, val:String):T {
		e.node.value = val;
		
		return e;
	}
	
	/**
	 * Gets the element's value property.
	 */
	public static function getVal<T:VirtualElement<Dynamic>> (e:T):String {
		return e.node.value;
	}
	
	/**
	 * Adds some text to this element.
	 */
	public static function addText<T:VirtualElement<Dynamic>> (e:T, text:String):T {
		append(e, new Text(text));
		
		return e;
	}
	
	/**
	 * Sets the text of this node.
	 */
	public static function setText<T:VirtualElement<Dynamic>> (e:T, text:String):T {
		e.node.innerText = text;
		
		return e;
	}
	
	/**
	 * Gets the text of this node.
	 */
	public static function getText<T:VirtualElement<Dynamic>> (e:T):String {
		return e.node.innerText;
	}
	
	/**
	 * Sets the html of this node.
	 */
	public static function setHtml<T:VirtualElement<Dynamic>> (e:T, html:String):T {
		e.node.innerHTML = html;
		
		return e;
	}
	
	/**
	 * Get the html of this node.
	 */
	public static function getHtml<T:VirtualElement<Dynamic>> (e:T):String {
		return e.node.innerHTML;
	}
	
	/**
	 * Set an attribute on the element.
	 */
	public static function setAttr<T:VirtualElement<Dynamic>> (e:T, key:String, val:Dynamic):T {
		switch (std.Type.typeof(val)) {
			case TBool:
				if (val) e.node.setAttribute(key, key);
				else e.node.removeAttribute(key);
			default:
				e.node.setAttribute(key, Std.string(val));
		}
		
		
		return e;
	}
	
	/**
	 * Gets an attribute on the element.
	 */
	public static function getAttr<T:VirtualElement<Dynamic>> (e:T, key:String):String {
		return e.node.getAttribute(key);
	}
	
	/**
	 * Removes an attribute on the element.
	 */
	public static function removeAttr<T:VirtualElement<Dynamic>> (e:T, key:String):T {
		e.node.removeAttribute(key);
		
		return e;
	}
	
	/**
	 * Set a property on the element.
	 */
	public static function setProp<T:VirtualElement<Dynamic>> (e:T, key:String, val:Dynamic):T {
		Reflect.setField(e.node, key, val);
		
		return e;
	}
	
	/**
	 * Gets a property on the element.
	 */
	public static function getProp<T:VirtualElement<Dynamic>> (e:T, key:String):Dynamic {
		return Reflect.field(e.node, key);
	}
	
	/**
	 * Removes a property from the element.
	 */
	public static function removeProp<T:VirtualElement<Dynamic>> (e:T, key:String):T {
		Reflect.deleteField(e.node, key);
		
		return e;
	}
	
	/**
	 * Retrieve the virtual node from this real node.
	 */
	public static inline function vnode (node:Node):VirtualNode<Node> {
		return Reflect.field(node, "__vdom");
	}
	
	/**
	 * Associate some data with this element.
	 */
	public static function setData<T:VirtualElement<Dynamic>> (e:T, key:String, value:String):T {
		Reflect.setField(e.node.dataset, key, value);
		
		return e;
	}
	
	/**
	 * Retrieve some data from this element.
	 */
	public static function getData<T:VirtualElement<Dynamic>> (e:T, key:String, value:String):T {
		Reflect.setField(e.node.dataset, key, value);
		
		return e;
	}
	
	/**
	 * Removes some data from the element.
	 */
	public static function removeData<T:VirtualElement<Dynamic>> (e:T, key:String):T {
		Reflect.deleteField(e.node.dataset, key);
		
		return e;
	}
	
	static function filterEvent (event:Event, type:Class<Dynamic>, listener:SFunc<hxdom.html.EventListener>):Void {
		var currNode:Node = cast event.target;
		while (currNode != null && currNode != event.currentTarget) {
			var vnode = vnode(currNode);
			if (Std.is(vnode, type)) {
				listener.call([]);
			}
			
			currNode = currNode.parentNode;
		}
		return null;
	}
	#end
	
	macro public static function delegate (ethis:ExprOf<VirtualNode<Dynamic>>, type:ExprOf<Class<Dynamic>>, events:ExprOf<String>, listener:ExprOf<hxdom.html.EventListener>):ExprOf<VirtualNode<Dynamic>> {
		return macro {
			for (i in $events.split(" ")) {
				$ethis.__addEventListener(i, ${SFunc.macroMake(listener)});
			}
			$ethis;
		};
	}
	
	/**
	 * Listen to one or more events.
	 */
	macro public static function on (ethis:ExprOf<IEventDispatcher>, events:ExprOf<String>, listener:ExprOf<hxdom.html.EventListener>):ExprOf<IEventDispatcher> {
		return macro {
			for (i in $events.split(" ")) {
				$ethis.__addEventListener(i, ${SFunc.macroMake(listener)});
			}
			$ethis;
		};
	}
	
	/**
	 * Stop listening to one or more events.
	 */
	macro public static function off (ethis:ExprOf<IEventDispatcher>, events:ExprOf<String>, listener:ExprOf<hxdom.html.EventListener>):ExprOf<IEventDispatcher> {
		return macro {
			for (i in $events.split(" ")) {
				$ethis.__removeEventListener(i, ${SFunc.macroMake(listener)});
			}
			$ethis;
		};
	}
	
	/**
	 * Add event listeners to classes implementing IEventDispatcher.
	 */
	macro public static function addEventListener (ethis:ExprOf<IEventDispatcher>, type:ExprOf<String>, listener:ExprOf<hxdom.html.EventListener>, ?useCapture:ExprOf<Bool>):ExprOf<IEventDispatcher> {
		return macro {
			$ethis.__addEventListener($type, ${SFunc.macroMake(listener)}, $useCapture);
			$ethis;
		};
	}
	
	/**
	 * Remove event listeners to classes implementing IEventDispatcher.
	 */
	macro public static function removeEventListener (ethis:ExprOf<IEventDispatcher>, type:ExprOf<String>, listener:ExprOf<hxdom.html.EventListener>, ?useCapture:ExprOf<Bool>):ExprOf<IEventDispatcher> {
		return macro {
			$ethis.__removeEventListener($type, ${SFunc.macroMake(listener)}, $useCapture);
			$ethis;
		};
	}
	
}