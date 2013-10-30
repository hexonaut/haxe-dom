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
import hxdom.html.Event;
import hxdom.html.EventListener;

/**
 * Cross-platform event dispatcher with the ability to be serialized.
 * 
 * @author Sam MacPherson
 */
class EventDispatcher {

	var listeners:Map<String, List<{inst:Dynamic, func:String, cap:Bool}>>;
	
	public function __addEventListener (inst:Dynamic, type:String, func:String, ?useCapture:Bool = false):Void {
		if (listeners == null) listeners = new Map<String, List<{inst:Dynamic, func:String, cap:Bool}>>();
		
		var list = listeners.get(type);
		var obj = { inst:inst, func:func, cap:useCapture };
		if (list == null) {
			list = new List<{inst:Dynamic, func:String, cap:Bool}>();
			list.add(obj);
			listeners.set(type, list);
		} else {
			for (i in list) {
				if (i.inst == inst && i.func == func && i.cap == useCapture) return;
			}
			list.add(obj);
		}
	}
	
	macro public function addEventListener (ethis:Expr, type:ExprOf<String>, listener:ExprOf<EventListener>, ?useCapture:ExprOf<Bool>):ExprOf<Void> {
		var params = listener.expr.getParameters();
		var isStatic = false;
		var cls = Context.getLocalClass().get();
		for (i in cls.statics.get()) {
			switch (params[0]) {
				case CIdent(name):
					if (i.name == name) isStatic = true;
				default:
			}
		}
		var fullName = (cls.pack.length > 0 ? (cls.pack.join(".") + ".") : "") + cls.name;
		var ecls = {expr:EConst(CString(fullName)), pos:Context.currentPos()};
		var inst = (params.length > 1) ? params[0] : (isStatic ? ecls : macro this);
		var func = Context.makeExpr((params.length > 1) ? params[1] : switch (params[0]) { case CIdent(val): val; default: null; }, Context.currentPos());
		return macro $ethis.__addEventListener($inst, $type, $func, $useCapture);
	}
	
	public function __removeEventListener (inst:Dynamic, type:String, func:String, ?useCapture:Bool = false):Void {
		if (listeners == null || !listeners.exists(type)) return;
		
		var list = listeners.get(type);
		for (i in list) {
			if (i.inst == inst && i.func == func && i.cap == useCapture) {
				list.remove(i);
			}
		}
	}

	macro public function removeEventListener (ethis:Expr, type:ExprOf<String>, listener:ExprOf<EventListener>, ?useCapture:ExprOf<Bool>):ExprOf<Void> {
		var params = listener.expr.getParameters();
		var isStatic = false;
		var cls = Context.getLocalClass().get();
		for (i in cls.statics.get()) {
			switch (params[0]) {
				case CIdent(name):
					if (i.name == name) isStatic = true;
				default:
			}
		}
		var fullName = (cls.pack.length > 0 ? (cls.pack.join(".") + ".") : "") + cls.name;
		var ecls = {expr:EConst(CString(fullName)), pos:Context.currentPos()};
		var inst = (params.length > 1) ? params[0] : (isStatic ? ecls : macro this);
		var func = Context.makeExpr((params.length > 1) ? params[1] : switch (params[0]) { case CIdent(val): val; default: null; }, Context.currentPos());
		return macro $ethis.__removeEventListener($inst, $type, $func, $useCapture);
	}

	public function dispatchEvent (event:Event):Bool {
		//TODO capture/bubbling?
		//May not be necessary
		var list = listeners.get(event.type);
		for (i in list) {
			Reflect.callMethod(i.inst, Reflect.field(i.inst, i.func), [event]);
		}
		
		return !event.defaultPrevented;
	}
	
}