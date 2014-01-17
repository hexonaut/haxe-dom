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
import hxdom.EventDispatcher;

/**
 * A representation of an arbitrary function split into two serializable components.
 * 
 * Use make() to create a new instance.
 * 
 * @author Sam MacPherson
 */
class EventHandler<T> {
	
	public var inst(default, null):Dynamic;
	public var func(default, null):String;
	
	public function new (inst:Dynamic, func:String, origFunc:T) {
		this.inst = inst;
		this.func = func;
	}
	
	public function call (?args:Array<Dynamic>):Dynamic {
		if (args == null) args = new Array<Dynamic>();
		
		return Reflect.callMethod(inst, Reflect.field(inst, func), args);
	}

	macro public static function make<T> (listener:ExprOf<T>):ExprOf<EventHandler<T>> {
		return doMake(listener);
	}
	
	#if macro
	/**
	 * Check through full inheritance chain to find the method.
	 */
	static function hasMethod (cls:ClassType, name:String):Bool {
		while (cls != null) {
			for (i in cls.fields.get()) {
				if (i.name == name) {
					return true;
				}
			}
			
			if (cls.superClass == null) break;
			
			cls = cls.superClass.t.get();
		}
		
		return false;
	}
	
	/**
	 * Check if this class has a static function with the given name.
	 */
	static function hasStaticFunction (cls:ClassType, name:String):Bool {
		for (i in cls.statics.get()) {
			if (i.name == name) {
				return true;
			}
		}
		
		return false;
	}
	
	/**
	 * Build a fully qualified class name reference.
	 */
	static function getFullClassName (cls:ClassType):Expr {
		if (cls.pack.length > 0) {
			var expr = { expr:EConst(CIdent(cls.pack[0])), pos:Context.currentPos() };
			for (i in 1 ... cls.pack.length) {
				expr = { expr:EField(expr, cls.pack[i]), pos:Context.currentPos() };
			}
			expr = { expr:EField(expr, cls.name), pos:Context.currentPos() };
			return expr;
		} else {
			return { expr:EConst(CIdent(cls.name)), pos:Context.currentPos() };
		}
	}
	
	public static function doMake<T> (listener:ExprOf<T>):ExprOf<EventHandler<T>> {
		//Split function and object
		var split = null;
		switch (listener.expr) {
			case EField(e, f):
				split = { inst: e, func:{expr:EConst(CString(f)), pos:Context.currentPos()} };
			case EConst(c):
				switch (c) {
					case CIdent(name):
						//Instance is implicitly "this" or "ClassName" depending on static reference or not
						var cls = Context.getLocalClass().get();
						
						//Check class methods first
						if (hasMethod(cls, name)) {
							split = { inst: macro this, func:{expr:EConst(CString(name)), pos:Context.currentPos()} };
						}
						
						//Check class statics
						if (hasStaticFunction(cls, name)) {
							split = { inst:getFullClassName(cls), func:{expr:EConst(CString(name)), pos:Context.currentPos()} };
						}
						
						if (split == null) throw "Missing function definition.";
					default:
						throw "Unsupported function reference.";
				}
			case EFunction(_, _):
				throw "Anonymous functions are not supported.";
			default:
				throw "Unsupported event handler.";
		}
		return macro new hxdom.EventHandler(${split.inst}, ${split.func}, $listener);
	}
	#end
	
}