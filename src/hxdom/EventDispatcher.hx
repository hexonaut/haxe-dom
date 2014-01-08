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
import hxdom.EventHandler;

using Lambda;

/**
 * Cross-platform event dispatcher with the ability to be serialized.
 * 
 * @author Sam MacPherson
 */
class EventDispatcher implements IEventDispatcher {
	
	macro public function addEventListener (ethis:Expr, type:ExprOf<String>, listener:ExprOf<hxdom.html.EventListener>, ?useCapture:ExprOf<Bool>):ExprOf<Void> {
		return macro $ethis.__addEventListener($type, ${EventHandler.doMake(listener)}, $useCapture);
	}

	macro public function removeEventListener (ethis:Expr, type:ExprOf<String>, listener:ExprOf<hxdom.html.EventListener>, ?useCapture:ExprOf<Bool>):ExprOf<Void> {
		return macro $ethis.__removeEventListener($type, ${EventHandler.doMake(listener)}, $useCapture);
	}
	
}

#if !macro
@:build(hxdom.EventDispatcherMacro.store())
@:autoBuild(hxdom.EventDispatcherMacro.build())
#end
interface IEventDispatcher {
	
	#if !macro
	@:skip var __listeners:Map<String, List<{handler:hxdom.EventHandler, cap:Bool}>>;
	
	public function __addEventListener (type:String, handler:hxdom.EventHandler, ?useCapture:Bool = false):Void {
		if (__listeners == null) __listeners = new Map<String, List<{handler:hxdom.EventHandler, cap:Bool}>>();
		
		var list = __listeners.get(type);
		var obj = { handler:handler, cap:useCapture };
		if (list == null) {
			list = new List<{handler:hxdom.EventHandler, cap:Bool}>();
			list.add(obj);
			__listeners.set(type, list);
		} else {
			for (i in list) {
				if (i.handler.inst == handler.inst && i.handler.func == handler.func && i.cap == useCapture) return;
			}
			list.add(obj);
		}
	}
	
	public function __removeEventListener (type:String, handler:hxdom.EventHandler, ?useCapture:Bool = false):Void {
		if (__listeners == null || !__listeners.exists(type)) return;
		
		var list = __listeners.get(type);
		for (i in list) {
			if (i.handler.inst == handler.inst && i.handler.func == handler.func && i.cap == useCapture) {
				list.remove(i);
			}
		}
	}
	
	public function __callListeners (event:hxdom.html.Event, capture:Bool):Void {
		untyped {
			if (event.target == this) {
				event.eventPhase = hxdom.html.Event.AT_TARGET;
			} else {
				event.eventPhase = capture ? hxdom.html.Event.CAPTURING_PHASE : hxdom.html.Event.BUBBLING_PHASE;
			}
			
			var list = __listeners.get(event.type);
			if (list != null) {
				for (i in list) {
					if (i.cap == capture) {
						Reflect.callMethod(i.handler.inst, Reflect.field(i.handler.inst, i.handler.func), [event]);
						if (Reflect.field(event, "cancelImmediate") == true) break;
					}
				}
			}
		}
	}
	
	public function __capturePhase (event:hxdom.html.Event):Void {
		untyped {
			event.currentTarget = node;
			
			//Start from root
			if (Std.is(this, hxdom.html.Node)) {
				var node:hxdom.html.Node = cast this;
				if (node.parentNode != null && event.bubbles) {
					node.parentNode.__capturePhase(event);
				}
			}
			
			//Call listeners
			if (!event.cancelable || !event.cancelBubble) __callListeners(event, true);
		}
	}
	
	public function __bubblePhase (event:hxdom.html.Event):Void {
		untyped {
			event.currentTarget = node;
			
			//Call listeners
			if (!event.cancelable || !event.cancelBubble) __callListeners(event, false);
			
			//Bubble up from target element
			if (Std.is(this, hxdom.html.Node)) {
				var node:hxdom.html.Node = cast this;
				if (node.parentNode != null && event.bubbles) {
					node.parentNode.__bubblePhase(event);
				}
			}
		}
	}

	public function dispatchEvent (event:hxdom.html.Event):Bool {
		if (__listeners == null) __listeners = new Map<String, List<{handler:hxdom.EventHandler, cap:Bool}>>();
		
		#if (js && !use_vdom)
		//Need to copy on client because target and currentTarget are read-only
		var evt:Dynamic = { };
		untyped __js__("for (var f in event) {");
		untyped __js__("if (f != 'returnValue') evt[f] = event[f]");
		untyped __js__("}");
		untyped evt.__proto__ = event.__proto__;
		#else
		var evt = event;
		#end
		
		untyped evt.target = this;
		
		__capturePhase(evt);
		__bubblePhase(evt);
		
		return !event.defaultPrevented;
	}
	#end
	
}

class EventDispatcherMacro {
	
	#if macro
	static var edFields:Array<Field> = new Array<Field>();
	
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
	
	macro static function store ():Array<Field> {
		var fields = Context.getBuildFields();
		var _fields = new Array<Field>();
		
		for (i in fields) {
			//Remove __listeners, public keyword and body content
			switch (i.kind) {
				case FFun(f):
					_fields.push( {
						pos:i.pos,
						name:i.name,
						meta:i.meta,
						kind:FFun( {
								ret:f.ret,
								params:f.params,
								expr:null,
								args:f.args
							}),
						doc:i.doc,
						access:[]
					});
				default:
			}
			
			edFields.push(i);
		}
		
		return _fields;
	}
	
	macro static function build ():Array<Field> {
		var fields = Context.getBuildFields();
		
		if (!hasMethod(Context.getLocalClass().get(), edFields[0].name)) {
			for (i in edFields) {
				fields.push(i);
			}
		}
		
		return fields;
	}
	#end
	
}