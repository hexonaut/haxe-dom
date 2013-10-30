/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.js;

import haxe.Unserializer;
import hxdom.html.CharacterData;
import hxdom.html.Element;
import hxdom.html.HtmlElement;
import hxdom.html.Node;
import hxdom.Elements;

using StringTools;

/**
 * Takes the browser parsed dom and returns the root node that was fed into the HTMLSerializer.run() method.
 * 
 * @author Sam MacPherson
 */
class Boot extends Unserializer {
	
	var elementLookup:Map<Int, Node>;		//Find elements from their id
	
	public function new () {
		super("");
		
		elementLookup = new Map<Int, Node>();
	}
	
	inline function getClassFromTagName (tagName:String):Class<Dynamic> {
		return Type.resolveClass(switch (tagName) {
			case "A": "hxdom.EAnchor";
			case "ABBR": "hxdom.EAbbr";
			case "ADDRESS": "hxdom.EAddress";
			case "AREA": "hxdom.EArea";
			case "ARTICLE": "hxdom.EArticle";
			case "ASIDE": "hxdom.EAside";
			case "AUDIO": "hxdom.EAudio";
			case "B": "hxdom.EBold";
			case "BASE": "hxdom.EBase";
			case "BDI": "hxdom.EBiIsolation";
			case "BDO": "hxdom.EBiOverride";
			case "BLOCKQUOTE": "hxdom.EBlockQuote";
			case "BODY": "hxdom.EBody";
			case "BR": "hxdom.EBreak";
			case "BUTTON": "hxdom.EButton";
			case "CANVAS": "hxdom.ECanvas";
			case "CAPTION": "hxdom.ECaption";
			case "CITE": "hxdom.ECite";
			case "CODE": "hxdom.ECode";
			case "COL": "hxdom.EColumn";
			case "COLGROUP": "hxdom.EColumnGroup";
			case "DATA": "hxdom.EData";
			case "DATALIST": "hxdom.EDataList";
			case "DD": "hxdom.EDescription";
			case "DEL": "hxdom.EDeleted";
			case "DETAILS": "hxdom.EDetails";
			case "DEFINITION": "hxdom.EDefinition";
			case "DIV": "hxdom.EDiv";
			case "DL": "hxdom.EDescriptionList";
			case "DT": "hxdom.EDefinitionTerm";
			case "EM": "hxdom.EEmphasis";
			case "EMBED": "hxdom.EEmbed";
			case "FIELDSET": "hxdom.EFieldSet";
			case "FIGCAPTION": "hxdom.EFigureCaption";
			case "FIGURE": "hxdom.EFigure";
			case "FOOTER": "hxdom.EFooter";
			case "FORM": "hxdom.EForm";
			case "H1": "hxdom.EHeader1";
			case "H2": "hxdom.EHeader2";
			case "H3": "hxdom.EHeader3";
			case "H4": "hxdom.EHeader4";
			case "H5": "hxdom.EHeader5";
			case "H6": "hxdom.EHeader6";
			case "HEAD": "hxdom.EHead";
			case "HEADER": "hxdom.EHeader";
			case "HR": "hxdom.EHorizontalRule";
			case "HTML": "hxdom.EHtml";
			case "I": "hxdom.EItalics";
			case "IFRAME": "hxdom.EIFrame";
			case "IMG": "hxdom.EImage";
			case "INPUT": "hxdom.EInput";
			case "INS": "hxdom.EInserted";
			case "KBD": "hxdom.EKeyboard";
			case "KEYGEN": "hxdom.EKeygen";
			case "LABEL": "hxdom.ELabel";
			case "LEGEND": "hxdom.ELegend";
			case "LI": "hxdom.EListItem";
			case "LINK": "hxdom.ELink";
			case "MAIN": "hxdom.EMain";
			case "MAP": "hxdom.EMap";
			case "MARK": "hxdom.EMark";
			case "MENU": "hxdom.EMenu";
			case "MENUITEM": "hxdom.EMenuItem";
			case "META": "hxdom.EMeta";
			case "METER": "hxdom.EMeter";
			case "NAV": "hxdom.ENav";
			case "NOSCRIPT": "hxdom.ENoScript";
			case "OBJECT": "hxdom.EObject";
			case "OL": "hxdom.EOrderedList";
			case "OPTGROUP": "hxdom.EOptionGroup";
			case "OPTION": "hxdom.EOption";
			case "OUTPUT": "hxdom.EOutput";
			case "P": "hxdom.EParagraph";
			case "PARAM": "hxdom.EParam";
			case "PRE": "hxdom.EPre";
			case "PROGRESS": "hxdom.EProgress";
			case "Q": "hxdom.EQuote";
			case "RP": "hxdom.ERubyParen";
			case "RT": "hxdom.ERubyPrononcuation";
			case "RUBY": "hxdom.ERuby";
			case "S": "hxdom.EStrike";
			case "SAMP": "hxdom.ESample";
			case "SCRIPT": "hxdom.EScript";
			case "SECTION": "hxdom.ESection";
			case "SELECT": "hxdom.ESelect";
			case "SMALL": "hxdom.ESmall";
			case "SOURCE": "hxdom.ESource";
			case "SPAN": "hxdom.ESpan";
			case "STRONG": "hxdom.EStrong";
			case "STYLE": "hxdom.EStyle";
			case "SUB": "hxdom.ESub";
			case "SUMMARY": "hxdom.ESummary";
			case "SUP": "hxdom.ESup";
			case "TABLE": "hxdom.ETable";
			case "TBODY": "hxdom.ETableBody";
			case "TD": "hxdom.ETableCell";
			case "TEXTAREA": "hxdom.ETextArea";
			case "TFOOT": "hxdom.ETableFooter";
			case "TH": "hxdom.ETableHeaderCell";
			case "THEAD": "hxdom.ETableHeader";
			case "TIME": "hxdom.ETime";
			case "TITLE": "hxdom.ETitle";
			case "TR": "hxdom.ETableRow";
			case "TRACK": "hxdom.ETrack";
			case "U": "hxdom.EUnderline";
			case "UL": "hxdom.EUnorderedList";
			case "VAR": "hxdom.EVar";
			case "VIDEO": "hxdom.EVideo";
			case "WBR": "hxdom.EWordBreak";
			default: "hxdom.html.Element";
		});
	}
	
	function element (e:Element):Void {
		var clsFound = false;
		for (i in e.attributes) {
			if (i.nodeName == "data-class") {
				//Inject the actual class's prototype into the dom element
				var cls = Type.resolveClass(i.nodeValue);
				clsFound = true;
				if (cls != null) {
					untyped e.__proto__ = cls.prototype;
				} else {
					throw "Class " + i.nodeValue + " not found. Be sure the class is available to the client.";
				}
			} else if (i.nodeName == "data-id") {
				//The element's id -- keep moving
			} else if (i.nodeName.startsWith("data-k")) {
				var index = Std.parseInt(i.nodeName.substr("data-k".length));
				var key = i.nodeValue;
				var value = doUnserialize(e.attributes.getNamedItem("data-v" + index).nodeValue);
				if (key == "listeners") {
					//Apply event listeners
					var listeners:Map<String, List<{inst:Dynamic, func:String, cap:Bool}>> = cast value;
					for (eventType in listeners.keys()) {
						for (eh in listeners.get(eventType)) {
							#if js
							//If the instance is a string then treat it as a class path (The event handler was static)
							var inst = Std.is(eh.inst, String) ? Type.resolveClass(eh.inst) : eh.inst;
							e.addEventListener(eventType, function (e) { Reflect.callMethod(inst, Reflect.field(inst, eh.func), [e]); }, eh.cap);
							#end
						}
					}
				} else {
					//This is just some random variable
					Reflect.setField(e, key, value);
				}
			}
		}
		
		if (!clsFound) {
			untyped e.__proto__ = getClassFromTagName(e.tagName).prototype;
		}
	}
	
	function unserializeNode (node:Node):Void {
		switch (node.nodeType) {
			case Node.ELEMENT_NODE: 
				element(cast node);
				for (i in node.childNodes) {
					unserializeNode(i);
				}
		}
	}
	
	function buildElementLookup (node:Node):Void {
		if (node.nodeType == Node.ELEMENT_NODE) {
			var first = true;
			var remainingStr:String = null;
			var child = node.firstChild;
			for (i in node.attributes.getNamedItem("data-id").nodeValue.split(" ")) {
				if (first) {
					//First is always the element ID
					elementLookup.set(Std.parseInt(i), node);
					first = false;
				} else {
					//Any remaining ids are for text nodes
					var dash = i.indexOf('-');
					var id = Std.parseInt(i.substr(0, dash));
					var len = Std.parseInt(i.substr(dash + 1));
					
					while (child.nodeType != Node.TEXT_NODE) child = child.nextSibling;
					
					var txt:CharacterData = cast child;
					var nodeToAdd = child;
					if (remainingStr == null && txt.length == len) {
						//Node is an exact fit
						child = child.nextSibling;
					} else {
						//Node has been normalized -- need to split into sub-nodes
						if (remainingStr == null) {
							//First node gets to stay
							remainingStr = txt.data.substr(len);
							txt.data = txt.data.substr(0, len);
						} else {
							//The rest need to create new text nodes
							nodeToAdd = Text.create(remainingStr.substr(0, len));
							node.insertBefore(nodeToAdd, child.nextSibling);
							if (remainingStr.length == len) {
								remainingStr = null;
							} else {
								remainingStr = remainingStr.substr(len);
							}
							child = child.nextSibling;
						}
					}
					untyped nodeToAdd.__proto__ = Text.prototype;
					elementLookup.set(id, nodeToAdd);
				}
			}
			
			for (i in node.childNodes) {
				buildElementLookup(i);
			}
		}
	}
	
	/**
	 * Sets up a unserialize call by messing with the buffer and position.
	 */
	function doUnserialize (str:String):Dynamic {
		buf = str;
		pos = 0;
		length = str.length;
		
		return unserialize();
	}
	
	public override function unserialize ():Dynamic {
		if (get(pos) == 'D'.code) {
			//Element ID reference
			pos++;
			var e = elementLookup.get(readDigits());
			if (e == null) throw "Missing element reference!";
			return e;
		} else {
			return super.unserialize();
		}
	}
	
	public static function init ():HtmlElement {
		#if js
		var html = js.Browser.document.childNodes[1];
		var boot = new Boot();
		boot.buildElementLookup(html);
		boot.unserializeNode(html);
		return cast html;
		#else
		throw "Only available to JS.";
		return null;
		#end
	}
	
}