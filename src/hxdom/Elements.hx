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

import haxe.Json;
import hxdom.Elements.VirtualNode;
import hxdom.EventHandler;
import hxdom.html.AnchorElement;
import hxdom.html.AudioElement;
import hxdom.html.BaseElement;
import hxdom.html.BodyElement;
import hxdom.html.BRElement;
import hxdom.html.ButtonElement;
import hxdom.html.CanvasElement;
import hxdom.html.CharacterData;
import hxdom.html.DataListElement;
import hxdom.html.DetailsElement;
import hxdom.html.DirectoryElement;
import hxdom.html.DivElement;
import hxdom.html.DListElement;
import hxdom.html.Element;
import hxdom.html.EmbedElement;
import hxdom.html.Event;
import hxdom.html.EventListener;
import hxdom.html.EventTarget;
import hxdom.html.FieldSetElement;
import hxdom.html.FormElement;
import hxdom.html.HeadElement;
import hxdom.html.HRElement;
import hxdom.html.HtmlElement;
import hxdom.html.IFrameElement;
import hxdom.html.ImageElement;
import hxdom.html.InputElement;
import hxdom.html.KeygenElement;
import hxdom.html.LabelElement;
import hxdom.html.LegendElement;
import hxdom.html.LIElement;
import hxdom.html.LinkElement;
import hxdom.html.MapElement;
import hxdom.html.MenuElement;
import hxdom.html.MetaElement;
import hxdom.html.MeterElement;
import hxdom.html.Node;
import hxdom.html.ObjectElement;
import hxdom.html.OListElement;
import hxdom.html.OptGroupElement;
import hxdom.html.OptionElement;
import hxdom.html.OutputElement;
import hxdom.html.ParagraphElement;
import hxdom.html.ParamElement;
import hxdom.html.PreElement;
import hxdom.html.ProgressElement;
import hxdom.html.QuoteElement;
import hxdom.html.ScriptElement;
import hxdom.html.SelectElement;
import hxdom.html.SourceElement;
import hxdom.html.SpanElement;
import hxdom.html.StyleElement;
import hxdom.html.TableCaptionElement;
import hxdom.html.TableCellElement;
import hxdom.html.TableElement;
import hxdom.html.TableRowElement;
import hxdom.html.TableSectionElement;
import hxdom.html.TextAreaElement;
import hxdom.html.TitleElement;
import hxdom.html.TrackElement;
import hxdom.html.UListElement;
import hxdom.html.VideoElement;

enum InputType {
	Button;
	Checkbox;
	Color;
	Date;
	DateTime;
	DateTimeLocal;
	Email;
	File;
	Hidden;
	Image;
	Month;
	Number;
	Password;
	Radio;
	Range;
	Reset;
	Search;
	Submit;
	Telephone;
	IText;
	Time;
	Url;
	Week;
}

/**
 * Thin wrappers for common elements.
 * 
 * Definitions taken from mdn: https://developer.mozilla.org/en-US/docs/Web/HTML/Element
 * 
 * @author Sam MacPherson
 */

class VirtualNode<T:Node> extends EventTarget {
	
	static var ID:Int = 0;
	
	public var node:T;
	
	var id:Int;
	
	public function new (node:T) {
		this.node = node;
		Reflect.setField(node, "__vdom", this);
		this.id = ID++;
	}
	
	public function appendChild (newChild:VirtualNode<Dynamic>):VirtualNode<Dynamic> {
		node.appendChild(newChild.node);
		
		return newChild;
	}
	
	public function contains (other:VirtualNode<Dynamic>):Bool {
		return node.contains(other.node);
	}
	
	public function hasChildNodes ():Bool {
		return node.childNodes.length > 0;
	}

	public function insertBefore (newChild:VirtualNode<Dynamic>, ?refChild:VirtualNode<Dynamic>):VirtualNode<Dynamic> {
		node.insertBefore(newChild.node, refChild != null ? refChild.node : null);
		
		return newChild;
	}

	public function removeChild (oldChild:VirtualNode<Dynamic>):VirtualNode<Dynamic> {
		node.removeChild(oldChild.node);
		
		return oldChild;
	}

	public function replaceChild (newChild:VirtualNode<Dynamic>, oldChild:VirtualNode<Dynamic>):VirtualNode<Dynamic> {
		node.replaceChild(newChild.node, oldChild.node);
		
		return oldChild;
	}
	
	public function iterator ():Iterator<VirtualNode<Dynamic>> {
		return new VirtualNodeIterator(this);
	}
	
	/**
	 * Construct and initialize element.
	 */
	static function buildElement<T:Element> (cls:Class<T>, tagName:String):T {
		#if (js && !use_vdom)
		var elem = js.Browser.document.createElement(tagName);
		#else
		var elem = Type.createEmptyInstance(cls);
		Reflect.setField(elem, "childNodes", new hxdom.html.NodeList());
		Reflect.setField(elem, "dataset", {});
		Reflect.setField(elem, "style", {});
		Reflect.setField(elem, "nodeType", Node.ELEMENT_NODE);
		Reflect.setField(elem, "tagName", tagName);
		Reflect.setField(elem, "offsetWidth", 0);
		Reflect.setField(elem, "offsetHeight", 0);
		#end
		return cast elem;
	}
	
	/**
	 * Construct and initialize text node.
	 */
	static function buildText (txt:String):hxdom.html.Text {
		#if (js && !use_vdom)
		var text = js.Browser.document.createTextNode(txt);
		#else
		var text = Type.createEmptyInstance(hxdom.html.Text);
		Reflect.setField(text, "nodeType", Node.TEXT_NODE);
		text.data = StringTools.htmlEscape(txt);
		#end
		return cast text;
	}
	
	#if (js && !use_vdom)
	public override function addEventListener (type:String, listener:EventListener, ?useCapture:Bool = false):Void {
		node.addEventListener(type, listener, useCapture);
	}
	
	public override function removeEventListener (type:String, listener:EventListener, ?useCapture:Bool = false):Void {
		node.removeEventListener(type, listener, useCapture);
	}
	#else
	public override function __addEventListener (type:String, handler:EventHandler, ?useCapture:Bool = false):Void {
		node.__addEventListener(type, handler, useCapture);
	}
	
	public override function __removeEventListener (type:String, handler:EventHandler, ?useCapture:Bool = false):Void {
		node.__removeEventListener(type, handler, useCapture);
	}
	#end
	
	public override function dispatchEvent (event:Event):Bool {
		return node.dispatchEvent(event);
	}
	
}

private class VirtualNodeIterator {
	
	var child:Node;
	
	public function new (node:VirtualNode<Dynamic>) {
		child = node.node.firstChild;
	}
	
	public function iterator ():Iterator<VirtualNode<Dynamic>> { 
		return this;
	}
	
	public function hasNext ():Bool {
		return child != null;
	}
	
	public function next ():VirtualNode<Dynamic> { 
		var c = child;
		child = child.nextSibling;
		return DomTools.vnode(c);
	}
	
}

class VirtualElement<T:Element> extends VirtualNode<T> {
	
	public function new (element:T) {
		super(element);
	}
	
}

class EAnchor extends VirtualElement<AnchorElement> { public function new () { super(VirtualNode.buildElement(AnchorElement, "A")); } }
class EAbbr extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "ABBR")); } }
class EAddress extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "ADDRESS")); } }
class EArea extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "AREA")); } }
class EArticle extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "ARTICLE")); } }
class EAside extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "ASIDE")); } }
class EAudio extends VirtualElement<AudioElement> { public function new () { super(VirtualNode.buildElement(AudioElement, "AUDIO")); } }
class EBold extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "B")); } }
class EBase extends VirtualElement<BaseElement> { public function new () { super(VirtualNode.buildElement(BaseElement, "BASE")); } }
class EBiIsolation extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "BDI")); } }
class EBiOverride extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "BDO")); } }
class EBlockQuote extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "BLOCKQUOTE")); } }
class EBody extends VirtualElement<BodyElement> { public function new () { super(VirtualNode.buildElement(BodyElement, "BODY")); } }
class EBreak extends VirtualElement<BRElement> { public function new () { super(VirtualNode.buildElement(BRElement, "BR")); } }
class EButton extends VirtualElement<ButtonElement> { public function new () { super(VirtualNode.buildElement(ButtonElement, "BUTTON")); } }
class ECanvas extends VirtualElement<CanvasElement> { public function new () { super(VirtualNode.buildElement(CanvasElement, "CANVAS")); } }
class ECaption extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "CAPTION")); } }
class ECite extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "CITE")); } }
class ECode extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "CODE")); } }
class EColumn extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "COL")); } }
class EColumnGroup extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "COLGROUP")); } }
class EData extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "DATA")); } }
class EDataList extends VirtualElement<DataListElement> { public function new () { super(VirtualNode.buildElement(DataListElement, "DATALIST")); } }
class EDescription extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "DD")); } }
class EDeleted extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "DEL")); } }
class EDetails extends VirtualElement<DetailsElement> { public function new () { super(VirtualNode.buildElement(DetailsElement, "DETAILS")); } }
class EDefinition extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "DEFINITION")); } }
class EDiv extends VirtualElement<DivElement> { public function new () { super(VirtualNode.buildElement(DivElement, "DIV")); } }
class EDescriptionList extends VirtualElement<DListElement> { public function new () { super(VirtualNode.buildElement(DListElement, "DL")); } }
class EDefinitionTerm extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "DT")); } }
class EEmphasis extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "EM")); } }
class EEmbed extends VirtualElement<EmbedElement> { public function new () { super(VirtualNode.buildElement(EmbedElement, "EMBED")); } }
class EFieldSet extends VirtualElement<FieldSetElement> { public function new () { super(VirtualNode.buildElement(FieldSetElement, "FIELDSET")); } }
class EFigureCaption extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "FIGCAPTION")); } }
class EFigure extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "FIGURE")); } }
class EFooter extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "FOOTER")); } }
class EForm extends VirtualElement<FormElement> { public function new () { super(VirtualNode.buildElement(FormElement, "FORM")); } }
class EHeader1 extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "H1")); } }
class EHeader2 extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "H2")); } }
class EHeader3 extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "H3")); } }
class EHeader4 extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "H4")); } }
class EHeader5 extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "H5")); } }
class EHeader6 extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "H6")); } }
class EHead extends VirtualElement<HeadElement> { public function new () { super(VirtualNode.buildElement(HeadElement, "HEAD")); } }
class EHeader extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "HEADER")); } }
class EHorizontalRule extends VirtualElement<HRElement> { public function new () { super(VirtualNode.buildElement(HRElement, "HR")); } }
class EHtml extends VirtualElement<HtmlElement> { public function new () { super(VirtualNode.buildElement(HtmlElement, "HTML")); } }
class EItalics extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "I")); } }
class EIFrame extends VirtualElement<IFrameElement> { public function new () { super(VirtualNode.buildElement(IFrameElement, "IFRAME")); } }
class EImage extends VirtualElement<ImageElement> { public function new () { super(VirtualNode.buildElement(ImageElement, "IMG")); } }
class EInput extends VirtualElement<InputElement> {
	public function new (type:InputType) {
		super(VirtualNode.buildElement(InputElement, "INPUT"));
		node.type = switch (type) {
			case Button: "button";
			case Checkbox: "checkbox";
			case Color: "color";
			case Date: "date";
			case DateTime: "datetime";
			case DateTimeLocal: "datetime-local";
			case Email: "email";
			case File: "file";
			case Hidden: "hidden";
			case Image: "image";
			case Month: "month";
			case Number: "number";
			case Password: "password";
			case Radio: "radio";
			case Range: "range";
			case Reset: "reset";
			case Search: "search";
			case Submit: "submit";
			case Telephone: "tel";
			case IText: "text";
			case Time: "time";
			case Url: "url";
			case Week: "week";
		};
	}
}
class EInserted extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "INS")); } }
class EKeyboard extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "KBD")); } }
class EKeygen extends VirtualElement<KeygenElement> { public function new () { super(VirtualNode.buildElement(KeygenElement, "KEYGEN")); } }
class ELabel extends VirtualElement<LabelElement> { public function new () { super(VirtualNode.buildElement(LabelElement, "LABEL")); } }
class ELegend extends VirtualElement<LegendElement> { public function new () { super(VirtualNode.buildElement(LegendElement, "LEGEND")); } }
class EListItem extends VirtualElement<LIElement> { public function new () { super(VirtualNode.buildElement(LIElement, "LI")); } }
class ELink extends VirtualElement<LinkElement> { public function new () { super(VirtualNode.buildElement(LinkElement, "LINK")); } }
class EMain extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "MAIN")); } }
class EMap extends VirtualElement<MapElement> { public function new () { super(VirtualNode.buildElement(MapElement, "MAP")); } }
class EMark extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "MARK")); } }
class EMenu extends VirtualElement<MenuElement> { public function new () { super(VirtualNode.buildElement(MenuElement, "MENU")); } }
class EMenuItem extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "MENUITEM")); } }
class EMeta extends VirtualElement<MetaElement> { public function new () { super(VirtualNode.buildElement(MetaElement, "META")); } }
class EMeter extends VirtualElement<MeterElement> { public function new () { super(VirtualNode.buildElement(MeterElement, "METER")); } }
class ENav extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "NAV")); } }
class ENoScript extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "NOSCRIPT")); } }
class EObject extends VirtualElement<ObjectElement> { public function new () { super(VirtualNode.buildElement(ObjectElement, "OBJECT")); } }
class EOrderedList extends VirtualElement<OListElement> { public function new () { super(VirtualNode.buildElement(OListElement, "OL")); } }
class EOptionGroup extends VirtualElement<OptGroupElement> { public function new () { super(VirtualNode.buildElement(OptGroupElement, "OPTGROUP")); } }
class EOption extends VirtualElement<OptionElement> { public function new () { super(VirtualNode.buildElement(OptionElement, "OPTION")); } }
class EOutput extends VirtualElement<OutputElement> { public function new () { super(VirtualNode.buildElement(OutputElement, "OUTPUT")); } }
class EParagraph extends VirtualElement<ParagraphElement> { public function new () { super(VirtualNode.buildElement(ParagraphElement, "P")); } }
class EParam extends VirtualElement<ParamElement> { public function new () { super(VirtualNode.buildElement(ParamElement, "PARAM")); } }
class EPre extends VirtualElement<PreElement> { public function new () { super(VirtualNode.buildElement(PreElement, "PRE")); } }
class EProgress extends VirtualElement<ProgressElement> { public function new () { super(VirtualNode.buildElement(ProgressElement, "PROGRESS")); } }
class EQuote extends VirtualElement<QuoteElement> { public function new () { super(VirtualNode.buildElement(QuoteElement, "Q")); } }
class ERubyParen extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "RP")); } }
class ERubyPrononcuation extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "RT")); } }
class ERuby extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "RUBY")); } }
class EStrike extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "S")); } }
class ESample extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "SAMP")); } }
class EScript extends VirtualElement<ScriptElement> { public function new () { super(VirtualNode.buildElement(ScriptElement, "SCRIPT")); } }
class ESection extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "SECTION")); } }
class ESelect extends VirtualElement<SelectElement> { public function new () { super(VirtualNode.buildElement(SelectElement, "SELECT")); } }
class ESmall extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "SMALL")); } }
class ESource extends VirtualElement<SourceElement> { public function new () { super(VirtualNode.buildElement(SourceElement, "SOURCE")); } }
class ESpan extends VirtualElement<SpanElement> { public function new () { super(VirtualNode.buildElement(SpanElement, "SPAN")); } }
class EStrong extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "STRONG")); } }
class EStyle extends VirtualElement<StyleElement> { public function new () { super(VirtualNode.buildElement(StyleElement, "STYLE")); } }
class ESub extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "SUB")); } }
class ESummary extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "SUMMARY")); } }
class ESup extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "SUP")); } }
class ETable extends VirtualElement<TableElement> { public function new () { super(VirtualNode.buildElement(TableElement, "TABLE")); } }
class ETableBody extends VirtualElement<TableSectionElement> { public function new () { super(VirtualNode.buildElement(TableSectionElement, "TBODY")); } }
class ETableCell extends VirtualElement<TableCellElement> { public function new () { super(VirtualNode.buildElement(TableCellElement, "TD")); } }
class ETextArea extends VirtualElement<TextAreaElement> { public function new () { super(VirtualNode.buildElement(TextAreaElement, "TEXTAREA")); } }
class ETableFooter extends VirtualElement<TableSectionElement> { public function new () { super(VirtualNode.buildElement(TableSectionElement, "TFOOT")); } }
class ETableHeaderCell extends VirtualElement<TableCellElement> { public function new () { super(VirtualNode.buildElement(TableCellElement, "TH")); } }
class ETableHeader extends VirtualElement<TableSectionElement> { public function new () { super(VirtualNode.buildElement(TableSectionElement, "THEAD")); } }
class ETime extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "TIME")); } }
class ETitle extends VirtualElement<TitleElement> { public function new () { super(VirtualNode.buildElement(TitleElement, "TITLE")); } }
class ETableRow extends VirtualElement<TableRowElement> { public function new () { super(VirtualNode.buildElement(TableRowElement, "TR")); } }
class ETrack extends VirtualElement<TrackElement> { public function new () { super(VirtualNode.buildElement(TrackElement, "TRACK")); } }
class EUnderline extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "U")); } }
class EUnorderedList extends VirtualElement<UListElement> { public function new () { super(VirtualNode.buildElement(UListElement, "UL")); } }
class EVar extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "VAR")); } }
class EVideo extends VirtualElement<VideoElement> { public function new () { super(VirtualNode.buildElement(VideoElement, "VIDEO")); } }
class EWordBreak extends VirtualElement<Element> { public function new () { super(VirtualNode.buildElement(Element, "WBR")); } }
class Text extends VirtualNode<hxdom.html.Text> { public function new (txt:String) { super(VirtualNode.buildText(txt)); } }
class HtmlSnippet extends ESpan { public function new (html:String) { super(); #if (js && !use_vdom) node.innerHTML = html; #else untyped { node.__htmlSnippet = null; } var txt = new Text(""); txt.node.data = html; appendChild(txt); #end } }