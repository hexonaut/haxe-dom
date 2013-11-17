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
		text.data = txt;
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
	public override function __addEventListener (inst:Dynamic, type:String, func:String, ?useCapture:Bool = false):Void {
		node.__addEventListener(inst, type, func, useCapture);
	}
	
	public override function __removeEventListener (inst:Dynamic, type:String, func:String, ?useCapture:Bool = false):Void {
		node.__removeEventListener(inst, type, func, useCapture);
	}
	#end
	
	public override function dispatchEvent (event:Event):Bool {
		return node.dispatchEvent(event);
	}
	
}

class EAnchor extends VirtualNode<AnchorElement> { public function new () { super(VirtualNode.buildElement(AnchorElement, "A")); } }
class EAbbr extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "ABBR")); } }
class EAddress extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "ADDRESS")); } }
class EArea extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "AREA")); } }
class EArticle extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "ARTICLE")); } }
class EAside extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "ASIDE")); } }
class EAudio extends VirtualNode<AudioElement> { public function new () { super(VirtualNode.buildElement(AudioElement, "AUDIO")); } }
class EBold extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "B")); } }
class EBase extends VirtualNode<BaseElement> { public function new () { super(VirtualNode.buildElement(BaseElement, "BASE")); } }
class EBiIsolation extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "BDI")); } }
class EBiOverride extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "BDO")); } }
class EBlockQuote extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "BLOCKQUOTE")); } }
class EBody extends VirtualNode<BodyElement> { public function new () { super(VirtualNode.buildElement(BodyElement, "BODY")); } }
class EBreak extends VirtualNode<BRElement> { public function new () { super(VirtualNode.buildElement(BRElement, "BR")); } }
class EButton extends VirtualNode<ButtonElement> { public function new () { super(VirtualNode.buildElement(ButtonElement, "BUTTON")); } }
class ECanvas extends VirtualNode<CanvasElement> { public function new () { super(VirtualNode.buildElement(CanvasElement, "CANVAS")); } }
class ECaption extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "CAPTION")); } }
class ECite extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "CITE")); } }
class ECode extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "CODE")); } }
class EColumn extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "COL")); } }
class EColumnGroup extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "COLGROUP")); } }
class EData extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "DATA")); } }
class EDataList extends VirtualNode<DataListElement> { public function new () { super(VirtualNode.buildElement(DataListElement, "DATALIST")); } }
class EDescription extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "DD")); } }
class EDeleted extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "DEL")); } }
class EDetails extends VirtualNode<DetailsElement> { public function new () { super(VirtualNode.buildElement(DetailsElement, "DETAILS")); } }
class EDefinition extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "DEFINITION")); } }
class EDiv extends VirtualNode<DivElement> { public function new () { super(VirtualNode.buildElement(DivElement, "DIV")); } }
class EDescriptionList extends VirtualNode<DListElement> { public function new () { super(VirtualNode.buildElement(DListElement, "DL")); } }
class EDefinitionTerm extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "DT")); } }
class EEmphasis extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "EM")); } }
class EEmbed extends VirtualNode<EmbedElement> { public function new () { super(VirtualNode.buildElement(EmbedElement, "EMBED")); } }
class EFieldSet extends VirtualNode<FieldSetElement> { public function new () { super(VirtualNode.buildElement(FieldSetElement, "FIELDSET")); } }
class EFigureCaption extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "FIGCAPTION")); } }
class EFigure extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "FIGURE")); } }
class EFooter extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "FOOTER")); } }
class EForm extends VirtualNode<FormElement> { public function new () { super(VirtualNode.buildElement(FormElement, "FORM")); } }
class EHeader1 extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "H1")); } }
class EHeader2 extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "H2")); } }
class EHeader3 extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "H3")); } }
class EHeader4 extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "H4")); } }
class EHeader5 extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "H5")); } }
class EHeader6 extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "H6")); } }
class EHead extends VirtualNode<HeadElement> { public function new () { super(VirtualNode.buildElement(HeadElement, "HEAD")); } }
class EHeader extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "HEADER")); } }
class EHorizontalRule extends VirtualNode<HRElement> { public function new () { super(VirtualNode.buildElement(HRElement, "HR")); } }
class EHtml extends VirtualNode<HtmlElement> { public function new () { super(VirtualNode.buildElement(HtmlElement, "HTML")); } }
class EItalics extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "I")); } }
class EIFrame extends VirtualNode<IFrameElement> { public function new () { super(VirtualNode.buildElement(IFrameElement, "IFRAME")); } }
class EImage extends VirtualNode<ImageElement> { public function new () { super(VirtualNode.buildElement(ImageElement, "IMG")); } }
class EInput extends VirtualNode<InputElement> {
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
class EInserted extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "INS")); } }
class EKeyboard extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "KBD")); } }
class EKeygen extends VirtualNode<KeygenElement> { public function new () { super(VirtualNode.buildElement(KeygenElement, "KEYGEN")); } }
class ELabel extends VirtualNode<LabelElement> { public function new () { super(VirtualNode.buildElement(LabelElement, "LABEL")); } }
class ELegend extends VirtualNode<LegendElement> { public function new () { super(VirtualNode.buildElement(LegendElement, "LEGEND")); } }
class EListItem extends VirtualNode<LIElement> { public function new () { super(VirtualNode.buildElement(LIElement, "LI")); } }
class ELink extends VirtualNode<LinkElement> { public function new () { super(VirtualNode.buildElement(LinkElement, "LINK")); } }
class EMain extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "MAIN")); } }
class EMap extends VirtualNode<MapElement> { public function new () { super(VirtualNode.buildElement(MapElement, "MAP")); } }
class EMark extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "MARK")); } }
class EMenu extends VirtualNode<MenuElement> { public function new () { super(VirtualNode.buildElement(MenuElement, "MENU")); } }
class EMenuItem extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "MENUITEM")); } }
class EMeta extends VirtualNode<MetaElement> { public function new () { super(VirtualNode.buildElement(MetaElement, "META")); } }
class EMeter extends VirtualNode<MeterElement> { public function new () { super(VirtualNode.buildElement(MeterElement, "METER")); } }
class ENav extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "NAV")); } }
class ENoScript extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "NOSCRIPT")); } }
class EObject extends VirtualNode<ObjectElement> { public function new () { super(VirtualNode.buildElement(ObjectElement, "OBJECT")); } }
class EOrderedList extends VirtualNode<OListElement> { public function new () { super(VirtualNode.buildElement(OListElement, "OL")); } }
class EOptionGroup extends VirtualNode<OptGroupElement> { public function new () { super(VirtualNode.buildElement(OptGroupElement, "OPTGROUP")); } }
class EOption extends VirtualNode<OptionElement> { public function new () { super(VirtualNode.buildElement(OptionElement, "OPTION")); } }
class EOutput extends VirtualNode<OutputElement> { public function new () { super(VirtualNode.buildElement(OutputElement, "OUTPUT")); } }
class EParagraph extends VirtualNode<ParagraphElement> { public function new () { super(VirtualNode.buildElement(ParagraphElement, "P")); } }
class EParam extends VirtualNode<ParamElement> { public function new () { super(VirtualNode.buildElement(ParamElement, "PARAM")); } }
class EPre extends VirtualNode<PreElement> { public function new () { super(VirtualNode.buildElement(PreElement, "PRE")); } }
class EProgress extends VirtualNode<ProgressElement> { public function new () { super(VirtualNode.buildElement(ProgressElement, "PROGRESS")); } }
class EQuote extends VirtualNode<QuoteElement> { public function new () { super(VirtualNode.buildElement(QuoteElement, "Q")); } }
class ERubyParen extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "RP")); } }
class ERubyPrononcuation extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "RT")); } }
class ERuby extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "RUBY")); } }
class EStrike extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "S")); } }
class ESample extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "SAMP")); } }
class EScript extends VirtualNode<ScriptElement> { public function new () { super(VirtualNode.buildElement(ScriptElement, "SCRIPT")); } }
class ESection extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "SECTION")); } }
class ESelect extends VirtualNode<SelectElement> { public function new () { super(VirtualNode.buildElement(SelectElement, "SELECT")); } }
class ESmall extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "SMALL")); } }
class ESource extends VirtualNode<SourceElement> { public function new () { super(VirtualNode.buildElement(SourceElement, "SOURCE")); } }
class ESpan extends VirtualNode<SpanElement> { public function new () { super(VirtualNode.buildElement(SpanElement, "SPAN")); } }
class EStrong extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "STRONG")); } }
class EStyle extends VirtualNode<StyleElement> { public function new () { super(VirtualNode.buildElement(StyleElement, "STYLE")); } }
class ESub extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "SUB")); } }
class ESummary extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "SUMMARY")); } }
class ESup extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "SUP")); } }
class ETable extends VirtualNode<TableElement> { public function new () { super(VirtualNode.buildElement(TableElement, "TABLE")); } }
class ETableBody extends VirtualNode<TableSectionElement> { public function new () { super(VirtualNode.buildElement(TableSectionElement, "TBODY")); } }
class ETableCell extends VirtualNode<TableCellElement> { public function new () { super(VirtualNode.buildElement(TableCellElement, "TD")); } }
class ETextArea extends VirtualNode<TextAreaElement> { public function new () { super(VirtualNode.buildElement(TextAreaElement, "TEXTAREA")); } }
class ETableFooter extends VirtualNode<TableSectionElement> { public function new () { super(VirtualNode.buildElement(TableSectionElement, "TFOOT")); } }
class ETableHeaderCell extends VirtualNode<TableCellElement> { public function new () { super(VirtualNode.buildElement(TableCellElement, "TH")); } }
class ETableHeader extends VirtualNode<TableSectionElement> { public function new () { super(VirtualNode.buildElement(TableSectionElement, "THEAD")); } }
class ETime extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "TIME")); } }
class ETitle extends VirtualNode<TitleElement> { public function new () { super(VirtualNode.buildElement(TitleElement, "TITLE")); } }
class ETableRow extends VirtualNode<TableRowElement> { public function new () { super(VirtualNode.buildElement(TableRowElement, "TR")); } }
class ETrack extends VirtualNode<TrackElement> { public function new () { super(VirtualNode.buildElement(TrackElement, "TRACK")); } }
class EUnderline extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "U")); } }
class EUnorderedList extends VirtualNode<UListElement> { public function new () { super(VirtualNode.buildElement(UListElement, "UL")); } }
class EVar extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "VAR")); } }
class EVideo extends VirtualNode<VideoElement> { public function new () { super(VirtualNode.buildElement(VideoElement, "VIDEO")); } }
class EWordBreak extends VirtualNode<Element> { public function new () { super(VirtualNode.buildElement(Element, "WBR")); } }
class Text extends VirtualNode<hxdom.html.Text> { public function new (txt:String) { super(VirtualNode.buildText(txt)); } }