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
import hxdom.html.Element;
import hxdom.html.EventListener;
import hxdom.html.EventTarget;
import hxdom.html.Node;
import hxdom.html.ScriptElement;
import hxdom.Elements;

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
	public static function add<T:Node> (parent:T, child:Node):T {
		parent.appendChild(child);
		
		return parent;
	}
	
	/**
	 * Clear all children.
	 */
	public static function clear<T:Node> (node:T):T {
		while (node.childNodes.length > 0) {
			node.removeChild(node.firstChild);
		}
		
		return node;
	}
	
	/**
	 * Add in classes for this element. Space delimited.
	 */
	public static function classes<T:Element> (e:T, cls:String):T {
		if (e.className == null) e.className = cls;
		else e.className += " " + cls;
		
		return e;
	}
	
	/**
	 * Shortcut for adding text.
	 */
	public static function addText<T:Node> (parent:T, text:String):T {
		parent.appendChild(Text.create(text));
		
		return parent;
	}
	
	/**
	 * Sets the text of this node. This assumes that the text is the only child node.
	 */
	public static function setText<T:Node> (parent:T, text:String):T {
		clear(parent);
		parent.appendChild(Text.create(text));
		
		return parent;
	}
	
	/**
	 * Set an attribute for this element without type checking.
	 */
	public static function unsafeAttr<T:Element> (e:T, key:Attr, val:Dynamic):T {
		Reflect.setField(e, Std.string(key), val);
		
		return e;
	}
	#end
	
	/**
	 * Set an attribute for this element.
	 */
	macro public static function attr (e:ExprOf<Element>, key:ExprOf<Attr>, val:ExprOf<Dynamic>):ExprOf<Element> {
		var pos = Context.currentPos();
		
		//Do type check
		switch (Context.typeof(e)) {
			case TInst(t, params):
				var key = switch (key.expr) { case EConst(CIdent(s)): s; case EField(_, s): s; default: null; };
				if (key != null) {
					var type = getClassFieldType(t.get(), key);
					if (type == null) {
						Context.error("Attribute does not exist on this element.", pos);
					} else {
						if (!Context.unify(type, Context.typeof(val))) {
							Context.error("Type mismatch.", pos);
						}
					}
				}
			default:
		}
		
		return macro DomTools.unsafeAttr($e, $key, $val);
	}
	
	#if macro
	static function getClassFieldType (cls:ClassType, key:String):Type {
		while (cls != null) {
			for (i in cls.fields.get()) {
				if (i.name == key) return i.type;
			}
			
			if (cls.superClass == null) break;
			
			cls = cls.superClass.t.get();
		}
		
		return null;
	}
	#end
	
}