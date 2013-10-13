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
import hxdom.html.Element;
import hxdom.html.EventListener;
import hxdom.html.EventTarget;
import hxdom.html.Node;
import hxdom.html.ScriptElement;
import hxdom.Elements;

/**
 * Utility functions for common DOM operations. Most functions are built for chaining.
 * 
 * @author Sam MacPherson
 */
class DomTools {
	
	#if !macro
	/**
	 * Does an appendChild, but returns the current node for chaining.
	 */
	public static function add<T:Node> (parent:T, child:Node):T {
		parent.appendChild(child);
		
		return parent;
	}
	
	/**
	 * Clear all children.
	 */
	public static function clear<T:Node> (node:T):T {
		while (node.childNodes.length > 0) {
			node.removeChild(node.firstChild);
		}
		
		return node;
	}
	
	/**
	 * Add in classes for this element. Space delimited.
	 */
	public static function classes<T:Element> (e:T, cls:String):T {
		if (e.className == null) e.className = cls;
		else e.className += " " + cls;
		
		return e;
	}
	
	/**
	 * Shortcut for adding text.
	 */
	public static function addText<T:Node> (parent:T, text:String):T {
		parent.appendChild(Text.create(text));
		
		return parent;
	}
	
	/**
	 * Set an attribute for this element without type checking.
	 */
	public static function unsafeAttr<T:Element> (e:T, key:Attr, val:Dynamic):T {
		Reflect.setField(e, Std.string(key), val);
		
		return e;
	}
	#end
	
	/**
	 * Set an attribute for this element.
	 */
	macro public static function attr (e:ExprOf<Element>, key:ExprOf<Attr>, val:ExprOf<Dynamic>):ExprOf<Element> {
		var pos = Context.currentPos();
		
		//Do type check
		switch (Context.typeof(e)) {
			case TInst(t, params):
				var key = switch (key.expr) { case EConst(CIdent(s)): s; case EField(_, s): s; default: null; };
				if (key != null) {
					var type = getClassFieldType(t.get(), key);
					if (type == null) {
						Context.error("Attribute does not exist on this element.", pos);
					} else {
						if (!Context.unify(type, Context.typeof(val))) {
							Context.error("Type mismatch.", pos);
						}
					}
				}
			default:
		}
		
		return macro DomTools.unsafeAttr($e, $key, $val);
	}
	
	#if macro
	static function getClassFieldType (cls:ClassType, key:String):Type {
		while (cls != null) {
			for (i in cls.fields.get()) {
				if (i.name == key) return i.type;
			}
			
			if (cls.superClass == null) break;
			
			cls = cls.superClass.t.get();
		}
		
		return null;
	}
	#end
	
	@:noUsing static public function eAnchor():EAnchor{
		return EAnchor.create();
	}
	@:noUsing static public function eAbbr():EAbbr{
		return EAbbr.create();
	}
	@:noUsing static public function eAddress():EAddress{
		return EAddress.create();
	}
	@:noUsing static public function eArea():EArea{
		return EArea.create();
	}
	@:noUsing static public function eArticle():EArticle{
		return EArticle.create();
	}
	@:noUsing static public function eAside():EAside{
		return EAside.create();
	}
	@:noUsing static public function eAudio():EAudio{
		return EAudio.create();
	}
	@:noUsing static public function eBold():EBold{
		return EBold.create();
	}
	@:noUsing static public function eBase():EBase{
		return EBase.create();
	}
	@:noUsing static public function eBiIsolation():EBiIsolation{
		return EBiIsolation.create();
	}
	@:noUsing static public function eBiOverride():EBiOverride{
		return EBiOverride.create();
	}
	@:noUsing static public function eBlockQuote():EBlockQuote{
		return EBlockQuote.create();
	}
	@:noUsing static public function eBody():EBody{
		return EBody.create();
	}
	@:noUsing static public function eBreak():EBreak{
		return EBreak.create();
	}
	@:noUsing static public function eButton():EButton{
		return EButton.create();
	}
	@:noUsing static public function eCanvas():ECanvas{
		return ECanvas.create();
	}
	@:noUsing static public function eCaption():ECaption{
		return ECaption.create();
	}
	@:noUsing static public function eCite():ECite{
		return ECite.create();
	}
	@:noUsing static public function eCode():ECode{
		return ECode.create();
	}
	@:noUsing static public function eColumn():EColumn{
		return EColumn.create();
	}
	@:noUsing static public function eColumnGroup():EColumnGroup{
		return EColumnGroup.create();
	}
	@:noUsing static public function eData():EData{
		return EData.create();
	}
	@:noUsing static public function eDataList():EDataList{
		return EDataList.create();
	}
	@:noUsing static public function eDescription():EDescription{
		return EDescription.create();
	}
	@:noUsing static public function eDeleted():EDeleted{
		return EDeleted.create();
	}
	@:noUsing static public function eDetails():EDetails{
		return EDetails.create();
	}
	@:noUsing static public function eDefinition():EDefinition{
		return EDefinition.create();
	}
	@:noUsing static public function eDiv():EDiv{
		return EDiv.create();
	}
	@:noUsing static public function eDescriptionList():EDescriptionList{
		return EDescriptionList.create();
	}
	@:noUsing static public function eDefinitionTerm():EDefinitionTerm{
		return EDefinitionTerm.create();
	}
	@:noUsing static public function eEmphasis():EEmphasis{
		return EEmphasis.create();
	}
	@:noUsing static public function eEmbed():EEmbed{
		return EEmbed.create();
	}
	@:noUsing static public function eFieldSet():EFieldSet{
		return EFieldSet.create();
	}
	@:noUsing static public function eFigureCaption():EFigureCaption{
		return EFigureCaption.create();
	}
	@:noUsing static public function eFigure():EFigure{
		return EFigure.create();
	}
	@:noUsing static public function eFooter():EFooter{
		return EFooter.create();
	}
	@:noUsing static public function eForm():EForm{
		return EForm.create();
	}
	@:noUsing static public function eHeader1():EHeader1{
		return EHeader1.create();
	}
	@:noUsing static public function eHeader2():EHeader2{
		return EHeader2.create();
	}
	@:noUsing static public function eHeader3():EHeader3{
		return EHeader3.create();
	}
	@:noUsing static public function eHeader4():EHeader4{
		return EHeader4.create();
	}
	@:noUsing static public function eHeader5():EHeader5{
		return EHeader5.create();
	}
	@:noUsing static public function eHeader6():EHeader6{
		return EHeader6.create();
	}
	@:noUsing static public function eHead():EHead{
		return EHead.create();
	}
	@:noUsing static public function eHeader():EHeader{
		return EHeader.create();
	}
	@:noUsing static public function eHorizontalRule():EHorizontalRule{
		return EHorizontalRule.create();
	}
	@:noUsing static public function eHtml():EHtml{
		return EHtml.create();
	}
	@:noUsing static public function eItalics():EItalics{
		return EItalics.create();
	}
	@:noUsing static public function eIFrame():EIFrame{
		return EIFrame.create();
	}
	@:noUsing static public function eImage():EImage{
		return EImage.create();
	}
	@:noUsing static public function eInput():EInput{
		return EInput.create();
	}
	@:noUsing static public function eInserted():EInserted{
		return EInserted.create();
	}
	@:noUsing static public function eKeyboard():EKeyboard{
		return EKeyboard.create();
	}
	@:noUsing static public function eKeygen():EKeygen{
		return EKeygen.create();
	}
	@:noUsing static public function eLabel():ELabel{
		return ELabel.create();
	}
	@:noUsing static public function eLegend():ELegend{
		return ELegend.create();
	}
	@:noUsing static public function eListItem():EListItem{
		return EListItem.create();
	}
	@:noUsing static public function eLink():ELink{
		return ELink.create();
	}
	@:noUsing static public function eMain():EMain{
		return EMain.create();
	}
	@:noUsing static public function eMap():EMap{
		return EMap.create();
	}
	@:noUsing static public function eMark():EMark{
		return EMark.create();
	}
	@:noUsing static public function eMenu():EMenu{
		return EMenu.create();
	}
	@:noUsing static public function eMenuItem():EMenuItem{
		return EMenuItem.create();
	}
	@:noUsing static public function eMeta():EMeta{
		return EMeta.create();
	}
	@:noUsing static public function eMeter():EMeter{
		return EMeter.create();
	}
	@:noUsing static public function eNav():ENav{
		return ENav.create();
	}
	@:noUsing static public function eNoScript():ENoScript{
		return ENoScript.create();
	}
	@:noUsing static public function eObject():EObject{
		return EObject.create();
	}
	@:noUsing static public function eOrderedList():EOrderedList{
		return EOrderedList.create();
	}
	@:noUsing static public function eOptionGroup():EOptionGroup{
		return EOptionGroup.create();
	}
	@:noUsing static public function eOption():EOption{
		return EOption.create();
	}
	@:noUsing static public function eOutput():EOutput{
		return EOutput.create();
	}
	@:noUsing static public function eParagraph():EParagraph{
		return EParagraph.create();
	}
	@:noUsing static public function eParam():EParam{
		return EParam.create();
	}
	@:noUsing static public function ePre():EPre{
		return EPre.create();
	}
	@:noUsing static public function eProgress():EProgress{
		return EProgress.create();
	}
	@:noUsing static public function eQuote():EQuote{
		return EQuote.create();
	}
	@:noUsing static public function eRubyParen():ERubyParen{
		return ERubyParen.create();
	}
	@:noUsing static public function eRubyPrononcuation():ERubyPrononcuation{
		return ERubyPrononcuation.create();
	}
	@:noUsing static public function eRuby():ERuby{
		return ERuby.create();
	}
	@:noUsing static public function eStrike():EStrike{
		return EStrike.create();
	}
	@:noUsing static public function eSample():ESample{
		return ESample.create();
	}
	@:noUsing static public function eScript():EScript{
		return EScript.create();
	}
	@:noUsing static public function eSection():ESection{
		return ESection.create();
	}
	@:noUsing static public function eSelect():ESelect{
		return ESelect.create();
	}
	@:noUsing static public function eSmall():ESmall{
		return ESmall.create();
	}
	@:noUsing static public function eSource():ESource{
		return ESource.create();
	}
	@:noUsing static public function eSpan():ESpan{
		return ESpan.create();
	}
	@:noUsing static public function eStrong():EStrong{
		return EStrong.create();
	}
	@:noUsing static public function eStyle():EStyle{
		return EStyle.create();
	}
	@:noUsing static public function eSub():ESub{
		return ESub.create();
	}
	@:noUsing static public function eSummary():ESummary{
		return ESummary.create();
	}
	@:noUsing static public function eSup():ESup{
		return ESup.create();
	}
	@:noUsing static public function eTable():ETable{
		return ETable.create();
	}
	@:noUsing static public function eTableBody():ETableBody{
		return ETableBody.create();
	}
	@:noUsing static public function eTableCell():ETableCell{
		return ETableCell.create();
	}
	@:noUsing static public function eTextArea():ETextArea{
		return ETextArea.create();
	}
	@:noUsing static public function eTableFooter():ETableFooter{
		return ETableFooter.create();
	}
	@:noUsing static public function eTableHeaderCell():ETableHeaderCell{
		return ETableHeaderCell.create();
	}
	@:noUsing static public function eTableHeader():ETableHeader{
		return ETableHeader.create();
	}
	@:noUsing static public function eTime():ETime{
		return ETime.create();
	}
	@:noUsing static public function eTitle():ETitle{
		return ETitle.create();
	}
	@:noUsing static public function eTableRow():ETableRow{
		return ETableRow.create();
	}
	@:noUsing static public function eTrack():ETrack{
		return ETrack.create();
	}
	@:noUsing static public function eUnderline():EUnderline{
		return EUnderline.create();
	}
	@:noUsing static public function eUnorderedList():EUnorderedList{
		return EUnorderedList.create();
	}
	@:noUsing static public function eVar():EVar{
		return EVar.create();
	}
	@:noUsing static public function eVideo():EVideo{
		return EVideo.create();
	}
	@:noUsing static public function eWordBreak():EWordBreak{
		return EWordBreak.create();
	}
}