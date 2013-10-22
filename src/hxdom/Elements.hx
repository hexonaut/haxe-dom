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
import hxdom.macro.DOM;

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

class EAnchor extends AnchorElement implements DOM { public function new () {} }
class EAbbr extends Element implements DOM { public function new () {} }
class EAddress extends Element implements DOM { public function new () {} }
class EArea extends Element implements DOM { public function new () {} }
class EArticle extends Element implements DOM { public function new () {} }
class EAside extends Element implements DOM { public function new () {} }
class EAudio extends AudioElement implements DOM { public function new () { super(); } }
class EBold extends Element implements DOM { public function new () {} }
class EBase extends BaseElement implements DOM { public function new () {} }
class EBiIsolation extends Element implements DOM { public function new () {} }
class EBiOverride extends Element implements DOM { public function new () {} }
class EBlockQuote extends Element implements DOM { public function new () {} }
class EBody extends BodyElement implements DOM { public function new () {} }
class EBreak extends BRElement implements DOM { public function new () {} }
class EButton extends ButtonElement implements DOM { public function new () {} }
class ECanvas extends CanvasElement implements DOM { public function new () {} }
class ECaption extends Element implements DOM { public function new () {} }
class ECite extends Element implements DOM { public function new () {} }
class ECode extends Element implements DOM { public function new () {} }
class EColumn extends Element implements DOM { public function new () {} }
class EColumnGroup extends Element implements DOM { public function new () {} }
class EData extends Element implements DOM { public function new () {} }
class EDataList extends DataListElement implements DOM { public function new () {} }
class EDescription extends Element implements DOM { public function new () {} }
class EDeleted extends Element implements DOM { public function new () {} }
class EDetails extends DetailsElement implements DOM { public function new () {} }
class EDefinition extends Element implements DOM { public function new () {} }
class EDiv extends DivElement implements DOM { public function new () {} }
class EDescriptionList extends DListElement implements DOM { public function new () {} }
class EDefinitionTerm extends Element implements DOM { public function new () {} }
class EEmphasis extends Element implements DOM { public function new () {} }
class EEmbed extends EmbedElement implements DOM { public function new () {} }
class EFieldSet extends FieldSetElement implements DOM { public function new () {} }
class EFigureCaption extends Element implements DOM { public function new () {} }
class EFigure extends Element implements DOM { public function new () {} }
class EFooter extends Element implements DOM { public function new () {} }
class EForm extends FormElement implements DOM { public function new () {} }
class EHeader1 extends Element implements DOM { public function new () {} }
class EHeader2 extends Element implements DOM { public function new () {} }
class EHeader3 extends Element implements DOM { public function new () {} }
class EHeader4 extends Element implements DOM { public function new () {} }
class EHeader5 extends Element implements DOM { public function new () {} }
class EHeader6 extends Element implements DOM { public function new () {} }
class EHead extends HeadElement implements DOM { public function new () {} }
class EHeader extends Element implements DOM { public function new () {} }
class EHorizontalRule extends HRElement implements DOM { public function new () {} }
class EHtml extends HtmlElement implements DOM { public function new () {} }
class EItalics extends Element implements DOM { public function new () {} }
class EIFrame extends IFrameElement implements DOM { public function new () {} }
class EImage extends ImageElement implements DOM { public function new () {} }
class EInput extends InputElement implements DOM {
	public function new (type:InputType) {
		this.type = switch (type) {
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
class EInserted extends Element implements DOM { public function new () {} }
class EKeyboard extends Element implements DOM { public function new () {} }
class EKeygen extends KeygenElement implements DOM { public function new () {} }
class ELabel extends LabelElement implements DOM { public function new () {} }
class ELegend extends LegendElement implements DOM { public function new () {} }
class EListItem extends LIElement implements DOM { public function new () {} }
class ELink extends LinkElement implements DOM { public function new () {} }
class EMain extends Element implements DOM { public function new () {} }
class EMap extends MapElement implements DOM { public function new () {} }
class EMark extends Element implements DOM { public function new () {} }
class EMenu extends MenuElement implements DOM { public function new () {} }
class EMenuItem extends Element implements DOM { public function new () {} }
class EMeta extends MetaElement implements DOM { public function new () {} }
class EMeter extends MeterElement implements DOM { public function new () {} }
class ENav extends Element implements DOM { public function new () {} }
class ENoScript extends Element implements DOM { public function new () {} }
class EObject extends ObjectElement implements DOM { public function new () {} }
class EOrderedList extends OListElement implements DOM { public function new () {} }
class EOptionGroup extends OptGroupElement implements DOM { public function new () {} }
class EOption extends OptionElement implements DOM { public function new () { super(); } }
class EOutput extends OutputElement implements DOM { public function new () {} }
class EParagraph extends ParagraphElement implements DOM { public function new () {} }
class EParam extends ParamElement implements DOM { public function new () {} }
class EPre extends PreElement implements DOM { public function new () {} }
class EProgress extends ProgressElement implements DOM { public function new () {} }
class EQuote extends QuoteElement implements DOM { public function new () {} }
class ERubyParen extends Element implements DOM { public function new () {} }
class ERubyPrononcuation extends Element implements DOM { public function new () {} }
class ERuby extends Element implements DOM { public function new () {} }
class EStrike extends Element implements DOM { public function new () {} }
class ESample extends Element implements DOM { public function new () {} }
class EScript extends ScriptElement implements DOM { public function new () {} }
class ESection extends Element implements DOM { public function new () {} }
class ESelect extends SelectElement implements DOM { public function new () {} }
class ESmall extends Element implements DOM { public function new () {} }
class ESource extends SourceElement implements DOM { public function new () {} }
class ESpan extends SpanElement implements DOM { public function new () {} }
class EStrong extends Element implements DOM { public function new () {} }
class EStyle extends StyleElement implements DOM { public function new () {} }
class ESub extends Element implements DOM { public function new () {} }
class ESummary extends Element implements DOM { public function new () {} }
class ESup extends Element implements DOM { public function new () {} }
class ETable extends TableElement implements DOM { public function new () {} }
class ETableBody extends TableSectionElement implements DOM { public function new () {} }
class ETableCell extends TableCellElement implements DOM { public function new () {} }
class ETextArea extends TextAreaElement implements DOM { public function new () {} }
class ETableFooter extends TableSectionElement implements DOM { public function new () {} }
class ETableHeaderCell extends TableCellElement implements DOM { public function new () {} }
class ETableHeader extends TableSectionElement implements DOM { public function new () {} }
class ETime extends Element implements DOM { public var datetime:String; public function new () { } }
class ETitle extends TitleElement implements DOM { public function new () {} }
class ETableRow extends TableRowElement implements DOM { public function new () {} }
class ETrack extends TrackElement implements DOM { public function new () {} }
class EUnderline extends Element implements DOM { public function new () {} }
class EUnorderedList extends UListElement implements DOM { public function new () {} }
class EVar extends Element implements DOM { public function new () {} }
class EVideo extends VideoElement implements DOM { public function new () {} }
class EWordBreak extends Element implements DOM { public function new () {} }

class Text extends CharacterData implements DOM {

	public function new (txt:String) {
		this.data = txt;
	}
	
}

class ElementId { public static var ID:Int = 0; }