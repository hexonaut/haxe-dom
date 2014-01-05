package hxdom.js;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;

/**
 * Allows for methods marked with @:client to be only executed on the client.
 * 
 * Useful for initializing JS-only code.
 * 
 * @author Sam MacPherson
 */
#if !macro @:autoBuild(hxdom.js.ClientOnlyMacros.build()) #end
interface ClientOnly {
	
}

class ClientOnlyMacros {
	
	#if macro
	static function buildMethodCallBlock (names:Array<String>):Array<Expr> {
		var block = new Array<Expr>();
		
		for (i in names) {
			block.push( { expr:ECall( { expr:EConst(CIdent(i)), pos:Context.currentPos() }, []), pos:Context.currentPos() } );
		}
		
		return block;
	}
	
	static function shouldOverride (funcName:String):Bool {
		var cls = Context.getLocalClass().get();
		while (cls != null) {
			for (i in cls.fields.get()) {
				if (i.name == funcName) {
					return true;
				}
			}
			
			if (cls.superClass == null) break;
			cls = cls.superClass.t.get();
		}
		
		return false;
	}
	#end
	
	macro public static function build ():Array<Field> {
		var fields = new Array<Field>();
		var methodsToCall = new Array<String>();
		var ctor:Field = null;
		
		for (i in Context.getBuildFields()) {
			if (i.name == "new") {
				ctor = i;
				fields.push(i);
			} else {
				var keep = true;
				for (o in i.meta) {
					if (o.name == ":client") {
						if (Context.defined("js") && !Context.defined("use_vdom")) {
							//Store method name for later appending to the ctor
							methodsToCall.push(i.name);
						} else {
							//Drop field for server
							keep = false;
						}
					}
				}
				if (keep) {
					fields.push(i);
				}
			}
		}
		
		//Add methods to a boot method for client
		if (Context.defined("js") && !Context.defined("use_vdom")) {
			var funcBody = buildMethodCallBlock(methodsToCall);
			var funcAccess = [];
			if (shouldOverride("__hxdomBoot")) {
				funcBody.unshift(macro super.__hxdomBoot());
				funcAccess = [AOverride];
			}
			fields.push( { pos:Context.currentPos(), name:"__hxdomBoot", meta:[], kind:FFun( { ret:null, params:[], args:[], expr:{ expr:EBlock(funcBody), pos:Context.currentPos() } } ), doc:null, access:funcAccess } );
		}
		
		//Add in method calls to ctor
		if (ctor != null) {
			switch (ctor.kind) {
				case FFun(f):
					if (f.expr != null) {
						switch (f.expr.expr) {
							case EBlock(block):
								for (i in buildMethodCallBlock(methodsToCall)) {
									block.push(i);
								}
							default:
								var block = buildMethodCallBlock(methodsToCall);
								block.unshift(f.expr);
								f.expr = { expr:EBlock(buildMethodCallBlock(methodsToCall)), pos:Context.currentPos() };
						}
					} else {
						f.expr = { expr:EBlock(buildMethodCallBlock(methodsToCall)), pos:Context.currentPos() };
					}
				default:
			}
		} else {
			throw "Client only classes must have a constructor.";
		}
		
		return fields;
	}
	
}