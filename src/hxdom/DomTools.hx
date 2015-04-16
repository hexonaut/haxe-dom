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
import hxdom.html.Event;
import hxdom.html.Element;
import hxdom.html.EventListener;
import hxdom.html.EventTarget;
import hxdom.html.MutationObserver;
import hxdom.html.MutationRecord;
import hxdom.html.Node;
import hxdom.html.ScriptElement;
import hxdom.Elements;
import hxdom.EventDispatcher;
#end
import hxdom.util.Util;

using Lambda;

/**
 * Utility functions for common DOM operations. Built to mimic the JQuery API. Most functions are built for chaining.
 * 
 * @author Sam MacPherson
 */
class DomTools {
	
	#if !macro
	/**
	 * Prepands an element to the beginning.
	 */
	public static function prepend<T:VirtualNode<Dynamic>> (parent:T, child:VirtualNode<Dynamic>):T {
		parent.node.insertBefore(child.node, parent.node.firstChild);
		
		return parent;
	}
	
	/**
	 * Appends an element to the end.
	 */
	public static function append<T:VirtualNode<Dynamic>> (parent:T, child:VirtualNode<Dynamic>):T {
		parent.node.appendChild(child.node);
		
		return parent;
	}
	
	/**
	 * Adds an element after the reference element.
	 */
	public static function after<T:VirtualNode<Dynamic>> (ref:T, e:VirtualNode<Dynamic>):T {
		ref.node.parentNode.insertBefore(e.node, ref.node.nextSibling);
		
		return ref;
	}
	
	/**
	 * Adds an element before the reference element.
	 */
	public static function before<T:VirtualNode<Dynamic>> (ref:T, e:VirtualNode<Dynamic>):T {
		ref.node.parentNode.insertBefore(e.node, ref.node);
		
		return ref;
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
	public static function empty<T:VirtualNode<Dynamic>> (e:T):T {
		while (e.node.firstChild != null) {
			e.node.removeChild(e.node.firstChild);
		}
		
		return e;
	}
	
	/**
	 * Replaces the element with a new element.
	 */
	public static function replaceWith<T:VirtualNode<Dynamic>> (e:T, newEl:VirtualNode<Dynamic>):T {
		e.node.parentNode.replaceChild(e.node, newEl.node);
		
		return e;
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
	public static function setVal<T:VirtualElement<Dynamic>> (e:T, val:Dynamic):T {
		#if (js && !use_vdom)
		setProp(e, "value", val);
		#else
		setAttr(e, "value", val);
		#end
		
		return e;
	}
	
	/**
	 * Gets the element's value property.
	 */
	public static function getVal<T:VirtualElement<Dynamic>> (e:T):String {
		#if (js && !use_vdom)
		return getProp(e, "value");
		#else
		return getAttr(e, "value");
		#end
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
		empty(e);
		addText(e, text);
		
		return e;
	}
	
	/**
	 * Gets the text of this node.
	 */
	public static function getText<T:VirtualElement<Dynamic>> (e:T):String {
		#if (js && !use_vdom)
		return e.node.textContent;
		#else
		return e.node.get_textContent();
		#end
	}
	
	/**
	 * Sets the html of this node.
	 */
	public static function setHtml<T:VirtualElement<Dynamic>> (e:T, html:String):T {
		#if (js && !use_vdom)
		e.node.innerHTML = html;
		#else
		empty(e);
		untyped e.__rawHtml = html;
		/*var contentSink = new dom4.utils.BasicContentSink();
        var parser = new dom4.DOMParser(contentSink);
		var document = parser.parseFromString('<!DOCTYPE html><html>$html</html>', "text/xml");
		var nodes = document.documentElement.childNodes;
		var toVirtualize = new List<Node>();
		for (i in 0 ... nodes.length) {
			e.node.appendChild(nodes[i]);
			toVirtualize.add(nodes[i]);
		}
		while (toVirtualize.length > 0) {
			var node = toVirtualize.pop();
			new VirtualNode<Node>(node);
			for (i in 0 ... node.childNodes.length) {
				toVirtualize.add(node.childNodes[i]);
			}
		}*/
		#end
		
		return e;
	}
	
	/**
	 * Get the html of this node.
	 */
	public static function getHtml<T:VirtualElement<Dynamic>> (e:T):String {
		#if (js && !use_vdom)
		return e.node.innerHTML;
		#else
		var s = new dom4.utils.Serializer();
		return s.serializeToString(e.node);
		#end
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
	 * Set a css style property on the element.
	 */
	public static function setCss<T:VirtualElement<Dynamic>> (e:T, key:String, val:String):T {
		Reflect.setField(e.node.style, key, Util.dashToCamelCase(val));
		
		return e;
	}
	
	/**
	 * Gets a css style property on the element.
	 */
	public static function getCss<T:VirtualElement<Dynamic>> (e:T, key:String):String {
		return Reflect.field(e.node.style, key);
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
	
	static function __closest<V> (e:Node, type:Class<V>, ?stop:Node):Null<V> {
		var currNode:Node = e;
		while (currNode != null) {
			var vnode = vnode(currNode);
			if (vnode != null && Std.is(vnode, type)) {
				return cast vnode;
			}
			
			if (currNode == stop) return null;
			
			currNode = currNode.parentNode;
		}
		return null;
	}
	
	/**
	 * Traverses the element's ancestors until it finds a match on the virtual element type.
	 */
	public static function closest<T:VirtualNode<Dynamic>, V> (e:T, type:Class<V>):Null<V> {
		return __closest(e.node, type);
	}
	
	/**
	 * Get the next sibling.
	 */
	public static function next<T:VirtualNode<Dynamic>> (e:T):Null<VirtualNode<Dynamic>> {
		var next = e.node.nextSibling;
		return next != null ? vnode(next) : null;
	}
	
	/**
	 * Get the previous sibling.
	 */
	public static function prev<T:VirtualNode<Dynamic>> (e:T):Null<VirtualNode<Dynamic>> {
		var next = e.node.previousSibling;
		return next != null ? vnode(next) : null;
	}
	
	/**
	 * Get the parent node.
	 */
	public static function parent<T:VirtualNode<Dynamic>> (e:T):Null<VirtualElement<Dynamic>> {
		var p = e.node.parentNode;
		return p != null ? cast vnode(p) : null;
	}
	
	/**
	 * Turns on mutation observers for the body.
	 */
	public static function observe<T:EBody> (e:T):T {
		#if (js && !use_vdom)
		new MutationObserver(function (changes:Array<MutationRecord>, obs:MutationObserver):Bool {
			for (i in changes) {
				for (o in i.removedNodes) {
					var vnode = vnode(o);
					if (vnode != null) untyped vnode.__onRemoved();
				}
				for (o in i.addedNodes) {
					var vnode = vnode(o);
					if (vnode != null) untyped vnode.__onAdded();
				}
			}
			
			return false;
		}).observe(e.node, {
			childList: true,
			subtree: true
		});
		#else
		//TODO add mutation observer support when available from dom4
		Reflect.setField(e, "__observe", true);
		#end
		
		return e;
	}
	
	static function __delegateEvent (e:Event):Void {
		var delegates:List<{ event:String, handler:hxdom.SFunc<hxdom.html.Event -> Void>, filter:Class<Dynamic> }> = Reflect.field(vnode(cast e.currentTarget), "__delegates");
		for (i in delegates) {
			if (i.event == e.type) {
				var child = __closest(cast e.target, i.filter, cast e.currentTarget);
				if (child != null) {
					i.handler.call([e, child]);
				}
			}
		}
	}
	
	static function __delegate<T:VirtualNode<Dynamic>, V> (e:T, filter:Class<V>, events:String, listener:SFunc<Event->V->Void>):T {
		var delegates:List<{ event:String, handler:hxdom.SFunc<Event->V->Void>, filter:Class<Dynamic> }> = Reflect.field(e, "__delegates");
		if (delegates == null) {
			delegates = new List<{ event:String, handler:hxdom.SFunc<Event->V->Void>, filter:Class<Dynamic> }>();
			Reflect.setField(e, "__delegates", delegates);
		}
		
		for (i in events.split(" ")) {
			delegates.add( { event:i, handler:listener, filter:filter } );
			#if (js && !use_vdom)
			e.addEventListener(i, __delegateEvent);
			#else
			e.__addEventListener(i, SFunc.make(__delegateEvent));
			#end
		}
		
		return e;
	}
	
	static function __undelegate<T:VirtualNode<Dynamic>, V> (e:T, filter:Class<V>, events:String, listener:SFunc<Event->V->Void>):T {
		var delegates:List<{ event:String, handler:hxdom.SFunc<Event->V->Void>, filter:Class<Dynamic> }> = Reflect.field(e, "__delegates");
		if (delegates == null) {
			//No delegates so just do a no-op
			return e;
		}
		
		for (i in events.split(" ")) {
			var found = false;
			for (d in delegates) {
				if (d.event == i && d.handler.isSame(listener) && d.filter == filter) {
					delegates.remove(d);
					found = true;
					break;
				}
			}
			if (found) {
				//We found a match -- be sure to clean up event listeners if it was the last event
				if (!delegates.exists(function (e) { return e.event == i; } )) {
					#if (js && !use_vdom)
					e.removeEventListener(i, __delegateEvent);
					#else
					e.__removeEventListener(i, SFunc.make(__delegateEvent));
					#end
				}
			}
		}
		
		if (delegates.length == 0) {
			Reflect.deleteField(e, "__delegates");
		}
		
		return e;
	}
	
	/**
	 * Create an event. Use this to smooth over cross-browser/server inconsistencies.
	 */
	public static function createEvent (type:String, ?bubbles:Bool = false, ?cancelable:Bool = false):Event {
		#if (js && !use_vdom)
		var e = Browser.document.createEvent("Event");
		#else
		var e = new Event(type, bubbles, cancelable);
		#end
		e.initEvent(type, bubbles, cancelable);
		return e;
	}
	#end
	
	/**
	 * Watch for one or more events on any descendant filtered by the given class now or in the future.
	 */
	macro public static function delegate (ethis:ExprOf<VirtualNode<Dynamic>>, filter:ExprOf<Class<Dynamic>>, events:ExprOf<String>, listener:ExprOf<Event->Dynamic->Void>):ExprOf<VirtualNode<Dynamic>> {
		return macro untyped hxdom.DomTools.__delegate($ethis, $filter, $events, ${SFunc.macroMake(listener)} );
	}
	
	/**
	 * Stop watching for one or more events on any descendant filtered by the given class.
	 */
	macro public static function undelegate (ethis:ExprOf<VirtualNode<Dynamic>>, filter:ExprOf<Class<Dynamic>>, events:ExprOf<String>, listener:ExprOf<Event->Dynamic->Void>):ExprOf<VirtualNode<Dynamic>> {
		return macro untyped hxdom.DomTools.__undelegate($ethis, $filter, $events, ${SFunc.macroMake(listener)} );
	}
	
	/**
	 * Listen to one or more events.
	 */
	macro public static function on (ethis:ExprOf<VirtualNode<Dynamic>>, events:ExprOf<String>, listener:ExprOf<hxdom.html.EventListener>):ExprOf<VirtualNode<Dynamic>> {
		var callExpr = if (Context.defined("js") && !Context.defined("use_vdom"))
			macro result.addEventListener(i, $listener);
		else
			macro result.__addEventListener(i, ${SFunc.macroMake(listener)} );
		
		return macro {
			var result = $ethis;
			for (i in $events.split(" ")) {
				$callExpr;
			}
			result;
		};
	}
	
	/**
	 * Stop listening to one or more events.
	 */
	macro public static function off (ethis:ExprOf<VirtualNode<Dynamic>>, events:ExprOf<String>, listener:ExprOf<hxdom.html.EventListener>):ExprOf<VirtualNode<Dynamic>> {
		var callExpr = if (Context.defined("js") && !Context.defined("use_vdom"))
			macro result.removeEventListener(i, $listener);
		else
			macro result.__removeEventListener(i, ${SFunc.macroMake(listener)} );
		
		return macro {
			var result = $ethis;
			for (i in $events.split(" ")) {
				$callExpr;
			}
			result;
		};
	}
	
}