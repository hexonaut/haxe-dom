/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.macro;

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
import hxdom.html.Element;
import hxdom.html.Node;
import hxdom.Elements;

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
		
		//Loop through class hierarchy until you find the Element class
		while (clsRef != null) {
			var cls = clsRef.get();
			nodeType = Node.ELEMENT_NODE;	//99% of the time its an element
			switch (cls.name) {
				case "EAnchor": tagName = "A";
				case "EAbbr": tagName = "ABBR";
				case "EAddress": tagName = "ADDRESS";
				case "EArea": tagName = "AREA";
				case "EArticle": tagName = "ARTICLE";
				case "EAside": tagName = "ASIDE";
				case "EAudio": tagName = "AUDIO";
				case "EBold": tagName = "B";
				case "EBase": tagName = "BASE";
				case "EBiIsolation": tagName = "BDI";
				case "EBiOverride": tagName = "BDO";
				case "EBlockQuote": tagName = "BLOCKQUOTE";
				case "EBody": tagName = "BODY";
				case "EBreak": tagName = "BR";
				case "EButton": tagName = "BUTTON";
				case "ECanvas": tagName = "CANVAS";
				case "ECaption": tagName = "CAPTION";
				case "ECite": tagName = "CITE";
				case "ECode": tagName = "CODE";
				case "EColumn": tagName = "COL";
				case "EColumnGroup": tagName = "COLGROUP";
				case "EData": tagName = "DATA";
				case "EDataList": tagName = "DATALIST";
				case "EDescription": tagName = "DD";
				case "EDeleted": tagName = "DEL";
				case "EDetails": tagName = "DETAILS";
				case "EDefinition": tagName = "DEFINITION";
				case "EDiv": tagName = "DIV";
				case "EDescriptionList": tagName = "DL";
				case "EDefinitionTerm": tagName = "DT";
				case "EEmphasis": tagName = "EM";
				case "EEmbed": tagName = "EMBED";
				case "EFieldSet": tagName = "FIELDSET";
				case "EFigureCaption": tagName = "FIGCAPTION";
				case "EFigure": tagName = "FIGURE";
				case "EFooter": tagName = "FOOTER";
				case "EForm": tagName = "FORM";
				case "EHeader1": tagName = "H1";
				case "EHeader2": tagName = "H2";
				case "EHeader3": tagName = "H3";
				case "EHeader4": tagName = "H4";
				case "EHeader5": tagName = "H5";
				case "EHeader6": tagName = "H6";
				case "EHead": tagName = "HEAD";
				case "EHeader": tagName = "HEADER";
				case "EHorizontalRule": tagName = "HR";
				case "EHtml": tagName = "HTML";
				case "EItalics": tagName = "I";
				case "EIFrame": tagName = "IFRAME";
				case "EImage": tagName = "IMG";
				case "EInput": tagName = "INPUT";
				case "EInserted": tagName = "INS";
				case "EKeyboard": tagName = "KBD";
				case "EKeygen": tagName = "KEYGEN";
				case "ELabel": tagName = "LABEL";
				case "ELegend": tagName = "LEGEND";
				case "EListItem": tagName = "LI";
				case "ELink": tagName = "LINK";
				case "EMain": tagName = "MAIN";
				case "EMap": tagName = "MAP";
				case "EMark": tagName = "MARK";
				case "EMenu": tagName = "MENU";
				case "EMenuItem": tagName = "MENUITEM";
				case "EMeta": tagName = "META";
				case "EMeter": tagName = "METER";
				case "ENav": tagName = "NAV";
				case "ENoScript": tagName = "NOSCRIPT";
				case "EObject": tagName = "OBJECT";
				case "EOrderedList": tagName = "OL";
				case "EOptionGroup": tagName = "OPTGROUP";
				case "EOption": tagName = "OPTION";
				case "EOutput": tagName = "OUTPUT";
				case "EParagraph": tagName = "P";
				case "EParam": tagName = "PARAM";
				case "EPre": tagName = "PRE";
				case "EProgress": tagName = "PROGRESS";
				case "EQuote": tagName = "Q";
				case "ERubyParen": tagName = "RP";
				case "ERubyPrononcuation": tagName = "RT";
				case "ERuby": tagName = "RUBY";
				case "EStrike": tagName = "S";
				case "ESample": tagName = "SAMP";
				case "EScript": tagName = "SCRIPT";
				case "ESection": tagName = "SECTION";
				case "ESelect": tagName = "SELECT";
				case "ESmall": tagName = "SMALL";
				case "ESource": tagName = "SOURCE";
				case "ESpan": tagName = "SPAN";
				case "EStrong": tagName = "STRONG";
				case "EStyle": tagName = "STYLE";
				case "ESub": tagName = "SUB";
				case "ESummary": tagName = "SUMMARY";
				case "ESup": tagName = "SUP";
				case "ETable": tagName = "TABLE";
				case "ETableBody": tagName = "TBODY";
				case "ETableCell": tagName = "TD";
				case "ETextArea": tagName = "TEXTAREA";
				case "ETableFooter": tagName = "TFOOT";
				case "ETableHeaderCell": tagName = "TH";
				case "ETableHeader": tagName = "THEAD";
				case "ETime": tagName = "TIME";
				case "ETitle": tagName = "TITLE";
				case "ETableRow": tagName = "TR";
				case "ETrack": tagName = "TRACK";
				case "EUnderline": tagName = "U";
				case "EUnorderedList": tagName = "UL";
				case "EVar": tagName = "VAR";
				case "EVideo": tagName = "VIDEO";
				case "EWordBreak": tagName = "WBR";
				case "CharacterData": 
					nodeType = Node.TEXT_NODE;
					break;
			}
			
			if (cls.superClass == null || tagName != null) break;
			
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
	
	static function removeCtorPublic (fields:Array<Field>):Array<Field> {
		for (i in fields) {
			switch (i.kind) {
				case FFun(ctor) if (i.name == "new"):
					for (o in i.access) {
						switch (o) {
							case APublic:
								i.access.remove(o);
								break;
							default:
						}
					}
				default:
			}
		}
		
		return fields;
	}

	macro public static function build ():Array<Field> {
		var fields = Context.getBuildFields();
		var clsRef = Context.getLocalClass().get();
		var pos = Context.currentPos();
		var ctorArgs = getConstructorArgs();
		var eInfo = getElementInfo();
		
		//If this is an implementor of the DOM interface then stick initialization in the constructor
		var domElem = false;
		for (i in clsRef.interfaces) {
			if (i.t.get().name == "DOM") {
				domElem = true;
				break;
			}
		}
		if (domElem) {
			for (i in fields) {
				if (i.name == "new") {
					switch (i.kind) {
						case FFun(func):
							switch (func.expr.expr) {
								case EBlock(exprs):
									exprs.push(macro untyped this.__id = hxdom.ElementId.ID++);
									exprs.push(macro untyped childNodes = new hxdom.html.NodeList());
									exprs.push(macro untyped nodeType = ${eInfo.nodeType});
									if (eInfo.tagName != null) exprs.push(macro untyped tagName = ${eInfo.tagName} );
								default:
							}
							default:
					}
				}
			}
		}
		
		//Build static create function that is the exact same as the constructor
		if (ctorArgs != null) {
			var newArgs = new Array<Expr>();
			for (i in ctorArgs) {
				newArgs.push({expr:EConst(CIdent(i.name)), pos:pos});
			}
			var funcExprs = new Array<Expr>();
			var enew = { expr: ENew( { name:clsRef.name, pack: clsRef.pack, params: [] }, newArgs), pos:pos };
			funcExprs.push(macro var e = $enew);
			if (domElem)funcExprs.push(macro untyped e.__noClass = true);
			funcExprs.push(macro return e);
			fields.push( { kind: FFun( { args:ctorArgs, expr: { expr: EBlock(funcExprs), pos:pos }, params: [], ret: TPath({ name: clsRef.name, pack: clsRef.pack, params: [] }) }), meta: [], name: "create", doc: null, pos: pos, access: [AStatic,APublic] });
		}
		
		return removeCtorPublic(fields);
	}
	
	macro public static function buildJS ():Array<Field> {
		var fields = Context.getBuildFields();
		var clsRef = Context.getLocalClass().get();
		var pos = Context.currentPos();
		var ctorArgs = getConstructorArgs();
		var eInfo = getElementInfo();
		
		//Build static create function that is the exact same as the constructor -- inject class prototype into DOM element
		if (ctorArgs != null) {
			var newArgs = new Array<Expr>();
			for (i in ctorArgs) {
				newArgs.push({expr:EConst(CIdent(i.name)), pos:pos});
			}
			var funcExprs = new Array<Expr>();
			var ecls = {expr:EConst(CIdent(clsRef.name)), pos:Context.currentPos()};
			if (eInfo.tagName != null) {
				//Element
				newArgs.unshift( { expr:EConst(CIdent("e")), pos:pos } );
				var ctorCall = {expr:ECall(macro ${ecls}.call, newArgs), pos:pos};
				funcExprs.push(macro var e:Dynamic = js.Browser.document.createElement(${eInfo.tagName}.toUpperCase()));
				funcExprs.push(macro untyped e.__proto__ = ${ecls}.prototype);
				funcExprs.push(macro untyped $ctorCall);
			} else {
				//Text Node
				funcExprs.push(macro var e:Dynamic = js.Browser.document.createTextNode(${newArgs[0]}));
				funcExprs.push(macro untyped e.__proto__ = ${ecls}.prototype);
			}
			funcExprs.push(macro return cast e);
			fields.push( { kind: FFun( { args:ctorArgs, expr: { expr: EBlock(funcExprs), pos:pos }, params: [], ret: TPath({ name: clsRef.name, pack: clsRef.pack, params: [] }) }), meta: [], name: "create", doc: null, pos: pos, access: [AStatic,APublic] });
		}
		
		return removeCtorPublic(fields);
	}
	
}