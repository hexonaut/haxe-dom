/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is JSCSSP code.
 *
 * The Initial Developer of the Original Code is
* Disruptive Innovations SAS
 * Portions created by the Initial Developer are Copyright (C) 2010
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *   Daniel Glazman <daniel.glazman@disruptive-innovations.com>
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either of the GNU General Public License Version 2 or later (the "GPL"),
 * or the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */

package dom4;

typedef CSSSelectorSpecificity = {
    var a : UInt;
    var b : UInt;
    var c : UInt;
    var d : UInt;
}

enum CSSCombinator {
    COMBINATOR_NONE;
    COMBINATOR_DESCENDANT;
    COMBINATOR_CHILD;
    COMBINATOR_ADJACENT_SIBLING;
    COMBINATOR_SIBLING;
}

typedef NthFunctionalPseudo = {
  var type: DOMString;
  var a: Int;
  var b: Int;
}

class CSSSelectorHelper {

  static public var mPeudoElementList = [
        "after",
        "before",
        "first-line",
        "first-letter"
    ];

    static public var mPeudoClassList = [
    /*
        "hover",
        "active",
        "focus",
        "enabled",
        "disabled",
        "checked",
        "indeterminate",
    */
        "root",
        "first-child",
        "last-child",
        "first-of-type",
        "last-of-type",
        "only-child",
        "only-of-type",
        "empty"
    ];

    static public var mFunctionalPseudoClassList = [
        "lang(",
        "nth-child(",
        "nth-last-child(",
        "nth-of-type(",
        "nth-last-of-type(",
        "not("
    ];
}

class CSSSelector {

    public var elementTypeList : Array<DOMString>; // could become an Atom
    public var IDList : Array<DOMString>;
    public var ClassList : Array<DOMString>;

    public var AttrList : Array<CSSAttrSelector>;

    public var LangPseudoClassList : Array<Array<DOMString>>;
    public var NthPseudoclassList  : Array<NthFunctionalPseudo>;
    public var PseudoClassList : Array<DOMString>;

    public var pseudoElement: DOMString;
    public var negation : CSSSelector;
    public var negated: Bool;
    public var parent : CSSSelector;

    public var next : CSSSelector;

    public var combinator : CSSCombinator;

    static public function isPseudoElement(s: String) : Bool {
        return (-1 != CSSSelectorHelper.mPeudoElementList.indexOf(s));
    }

    static public function isPseudoClass(s: String) : Bool {
        return (-1 != CSSSelectorHelper.mPeudoClassList.indexOf(s));
    }

    static public function isFunctionalPseudoClass(s: String) : Bool {
        return (-1 != CSSSelectorHelper.mFunctionalPseudoClassList.indexOf(s));
    }

    public function negateIfNeeded(s: DOMString): DOMString
    {
      if (this.negated)
        return ":not(" + s + ")";
      return s;
    }

    public var cssText(get, set): DOMString;
      private function get_cssText(): DOMString {
        var s  = "";
        for (type in this.elementTypeList)
          s += negateIfNeeded(type);
  
        for (id in this.IDList)
          s += negateIfNeeded("#" + id);
  
        for (c in this.ClassList)
          s += negateIfNeeded("." + c);
  
        for (a in this.AttrList) {
          var attrSel = a.name;
          var requireValue = true;
          switch (a.operator) {
            case ATTR_EXISTS:
              requireValue = false;
            case ATTR_EQUALS:
              attrSel += "=";
            case ATTR_INCLUDES:
              attrSel += "~=";
            case ATTR_DASHMATCH:
              attrSel += "|=";
            case ATTR_BEGINSMATCH:
              attrSel += "^=";
            case ATTR_ENDSMATCH:
              attrSel += "$=";
            case ATTR_CONTAINSMATCH:
              attrSel += "*=";
          }
          if (requireValue) {
            attrSel += '"' + a.value + '"';
            if (a.caseInsensitive)
              attrSel += " i";
          }

          s += negateIfNeeded("[" + attrSel + "]");
        }

        for (p in this.PseudoClassList)
          s += negateIfNeeded(":" + p);

        for (p in this.NthPseudoclassList) {
          var pStr = ":" + p.type + "(";
          if (p.a == 2 && p.b == 1) {
            pStr += "odd";
          }
          else if (p.a == 2 && p.b == 0) {
            pStr += "even";
          }
          else {
            pStr += p.a + "n";
            if (p.b < 0)
              pStr += p.b;
            else if (p.b > 0)
              pStr += "+" + p.b;
          }
          pStr += ")";
          s += negateIfNeeded(pStr);
        }

        if (this.negation != null) {
          s += this.negation.cssText;
        }

        if (this.pseudoElement != "")
          s += "::" + pseudoElement;

        if (this.parent != null) {
          switch (this.combinator) {
            case COMBINATOR_DESCENDANT:
              s = " " + s;
            case COMBINATOR_CHILD:
              s = " > " + s;
            case COMBINATOR_ADJACENT_SIBLING:
              s = " + " + s;
            case COMBINATOR_SIBLING:
              s = " ~ " + s;
            case COMBINATOR_NONE:
          }
          s = this.parent.cssText + s;
        }

        if (this.next != null)
          s = this.next.cssText + ", " + s;

        return s;
      }
      private function set_cssText(v: DOMString): DOMString
      {
        return v;
      }

    public function new() {
        this.elementTypeList = [];
        this.IDList = [];
        this.ClassList = [];
        this.AttrList = [];
        this.LangPseudoClassList = [];
        this.PseudoClassList = [];
        this.NthPseudoclassList = [];
        this.negation = null;
        this.negated = false;
        this.parent = null;
        this.next = null;
        this.combinator = COMBINATOR_NONE;
        this.pseudoElement = "";
    }
}
