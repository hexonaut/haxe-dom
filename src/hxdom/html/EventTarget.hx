package hxdom.html;

import haxe.macro.Context;
import haxe.macro.Expr;

#if js
typedef EventTarget = js.html.EventTarget;
#else
class EventTarget {
	
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
		var inst = (params.length > 1) ? params[0] : macro this;
		var func = Context.makeExpr((params.length > 1) ? params[1] : switch (params[0]) { case CIdent(val): val; default: null; }, Context.currentPos());
		return macro $ethis.__addEventListener($inst, $type, $func, $useCapture);
	}
	
	public function __removeEventListener (inst:Int, type:String, func:String, ?useCapture:Bool = false):Void {
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
		var inst = (params.length > 1) ? params[0] : macro this;
		var func = Context.makeExpr((params.length > 1) ? params[1] : switch (params[0]) { case CIdent(val): val; default: null; }, Context.currentPos());
		return macro $ethis.__removeEventListener($inst, $type, $func, $useCapture);
	}

	public function dispatchEvent (event:Event):Bool {
		throw "Dispatch event not available on the server.";
		
		return null;
	}
	
}
#end