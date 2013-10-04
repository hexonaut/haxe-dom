package hxdom.macro;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
import hxdom.html.Node;

/**
 * Apply macro logic to nodes.
 * 
 * @author Sam MacPherson
 */
class NodeMacros {
	
	/**
	 * Build element info from inheritance tree.
	 */
	static function getElementInfo ():{ nodeType:Expr, ?tagName:Expr } {
		var clsRef = Context.getLocalClass();
		var pos = Context.currentPos();
		
		var tagName:String = null;
		var nodeType:Int = null;
		
		//Loop through class hierarchy and fill in relavent values
		while (clsRef != null) {
			var cls = clsRef.get();
			switch (cls.name) {
				case "DivElement": tagName = "DIV";
				case "HeadElement": tagName = "HEAD";
				case "HtmlElement": tagName = "HTML";
				case "BodyElement": tagName = "BODY";
				case "ScriptElement": tagName = "SCRIPT";
				case "Element": if (nodeType == null) nodeType = Node.ELEMENT_NODE;
				case "CharacterData": if (nodeType == null) nodeType = Node.TEXT_NODE;
				default:
			}
			
			if (cls.superClass == null) break;
			
			clsRef = cls.superClass.t;
		}
		
		return { tagName:tagName != null ? Context.makeExpr(tagName, pos) : null, nodeType:Context.makeExpr(nodeType, pos) };
	}
	
	static function getConstructorArgs ():Array<FunctionArg> {
		var fields = Context.getBuildFields();
		
		for (i in fields) {
			switch (i.kind) {
				case FFun(ctor) if (i.name == "new"):
					return ctor.args;
				default:
			}
		}
		return null;
	}

	macro public static function build ():Array<Field> {
		var fields = Context.getBuildFields();
		var clsRef = Context.getLocalClass().get();
		var pos = Context.currentPos();
		var ctorArgs = getConstructorArgs();
		var eInfo = getElementInfo();
		
		//Build static create function that is the exact same as the constructor -- also initialize stuff
		if (ctorArgs != null) {
			var newArgs = new Array<Expr>();
			for (i in ctorArgs) {
				newArgs.push({expr:EConst(CIdent(i.name)), pos:pos});
			}
			var funcExprs = new Array<Expr>();
			var enew = { expr: ENew( { name:clsRef.name, pack: clsRef.pack, params: [] }, newArgs), pos:pos };
			funcExprs.push(macro var e = $enew);
			funcExprs.push(macro untyped e.childNodes = new hxdom.html.NodeList());
			funcExprs.push(macro untyped e.nodeType = ${eInfo.nodeType});
			if (eInfo.tagName != null) funcExprs.push(macro untyped e.tagName = ${eInfo.tagName});
			funcExprs.push(macro return e);
			fields.push( { kind: FFun( { args:ctorArgs, expr: { expr: EBlock(funcExprs), pos:pos }, params: [], ret: TPath({ name: clsRef.name, pack: clsRef.pack, params: [] }) }), meta: [], name: "create", doc: null, pos: pos, access: [AStatic,APublic] });
		}
		
		return fields;
	}
	
	macro public static function buildJS ():Array<Field> {
		var fields = Context.getBuildFields();
		var clsRef = Context.getLocalClass().get();
		var pos = Context.currentPos();
		var ctorArgs = getConstructorArgs();
		var eInfo = getElementInfo();
		
		//Build static create function that is the exact same as the constructor -- inject class prototype into DOM element
		if (ctorArgs != null && eInfo.tagName != null) {
			var newArgs = new Array<Expr>();
			for (i in ctorArgs) {
				newArgs.push({expr:EConst(CIdent(i.name)), pos:pos});
			}
			var funcExprs = new Array<Expr>();
			var ecls = {expr:EConst(CIdent(clsRef.name)), pos:Context.currentPos()};
			funcExprs.push(macro var e:Dynamic = js.Browser.document.createElement(${eInfo.tagName}.toUpperCase()));
			funcExprs.push(macro untyped ${ecls}.call(e));
			funcExprs.push(macro untyped e.__proto__ = ${ecls}.prototype);
			funcExprs.push(macro return cast e);
			fields.push( { kind: FFun( { args:ctorArgs, expr: { expr: EBlock(funcExprs), pos:pos }, params: [], ret: TPath({ name: clsRef.name, pack: clsRef.pack, params: [] }) }), meta: [], name: "create", doc: null, pos: pos, access: [AStatic,APublic] });
		}
		
		return fields;
	}
	
}