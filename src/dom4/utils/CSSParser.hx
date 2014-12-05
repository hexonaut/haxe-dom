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
 
package dom4.utils;

import dom4.CSSAttrSelector;

typedef SelectorSpecificity = {
    var a : UInt;
    var b : UInt;
    var c : UInt;
    var d : UInt;
}

class CSSParser  {

    /*
     * general purpose
     */
    private var mPreservedTokens : Array<Token>;
    private var mError : String;
    // specific for the an+b notation
    private var ANB_EREG = new EReg("^([\\-\\+]?[0-9]+)n$|^([\\-\\+]?[0-9]+)n[ \t\r\n]*([\\-\\+])[ \t\r\n]*([0-9]+)$|^([\\-\\+]?[0-9]+)$", "");

    /*
     * for tokenization
     */
    private var mScanner : Scanner;
    private var mToken : Token;
    private var mLookAhead : Token;

    /*
     * TOKENIZATION
     */

    public function currentToken() : Token {
        return mToken;
    }

    public function getToken(aSkipWS : Bool, aSkipComment : Bool) : Token {
        if (null != mLookAhead) {
            mToken = mLookAhead;
            mLookAhead = null;
            return mToken;
        }

        mToken = mScanner.nextToken();
        while (null != mToken
               && ((aSkipWS && mToken.isWhiteSpace())
                   || (aSkipComment && mToken.isComment())))
            mToken = mScanner.nextToken();

        return mToken;
    }

    public function ungetToken() : Void {
        mLookAhead = mToken;
    }

    public function lookAhead(aSkipWS : Bool, aSkipComment : Bool) : Token {
        var preservedToken = mToken;
        mScanner.preserveState();
        var token = getToken(aSkipWS, aSkipComment);
        mScanner.restoreState();
        mToken = preservedToken;

        return token;
    }

    public function preserveState() {
        this.mPreservedTokens.push(this.currentToken());
        this.mScanner.preserveState();
    }

    public function restoreState() {
        if (0 != this.mPreservedTokens.length) {
            this.mScanner.restoreState();
            this.mToken = this.mPreservedTokens.pop();
        }
    }

    public function forgetState() {
        if (0 != this.mPreservedTokens.length) {
            this.mScanner.forgetState();
            this.mPreservedTokens.pop();
        }
    }

    public function getHexValue() : Token {
        this.mToken = this.mScanner.nextHexValue();
        return this.mToken;
    }

    public function new() {
        this.mPreservedTokens = [];
        this.mError = null;
    }

    public function isTokenCombinator(aToken : Token) : Bool {
        return (aToken.isWhiteSpace()
               || aToken.isSymbol("+")
               || aToken.isSymbol("~")
               || aToken.isSymbol(">"));
    }

    public function parseSelector(aString: DOMString, ?parsingNegation: Bool = false, ?selector:CSSSelector = null): CSSSelector
    {
      var newInGroup = true;
      var firstInChain = true;

      if (!parsingNegation) {
        // init the scanner with our string to parse
        mScanner = new Scanner(aString);
      }
      // let's dance, baby...
      var token = this.getToken(true, true);

      while (token.isNotNull()
             && (!parsingNegation || !token.isSymbol(")"))) {
        if (token.isSymbol(",")) { // group of selectors;
          // we need a new selector in the chain but we can't allow
          // two consecutive commas
          if (newInGroup || parsingNegation)
            throw (new DOMException("Syntax error, a comma cannot start a selector"));
          newInGroup = true;
          // don't watch whitespaces after a comma
          token = this.getToken(true, true);
          continue;
        }

        if (selector != null
            && selector.pseudoElement != "") {
          // we just set a pseudo-element so we can
          // only end or have a comma
          var t = token;
          if (t.isWhiteSpace())
            t = this.lookAhead(true, true);
          if (t.isNotNull() && !t.isSymbol(","))
            throw (new DOMException("SyntaxError"));
        }

        // did we just find a comma?
        if (newInGroup) {
          // cannot have a combinator as first thing in a group
          if (this.isTokenCombinator(token))
            throw (new DOMException("Syntax error, a combinator cannot lead a selector"));

          newInGroup = false;
          firstInChain = true;
          if (!parsingNegation) {
            var s = new CSSSelector();
            s.next = selector;
            selector = s;
          }
        }

        // is it a combinator?
        if (token.isWhiteSpace()) {
          var nextToken = this.lookAhead(true, true);
          if (!token.isSymbol(",") && !this.isTokenCombinator(nextToken) && !parsingNegation) {
            // yes, it's a combinator
            var s = new CSSSelector();
            s.parent = selector;
            selector = s;
            selector.combinator = COMBINATOR_DESCENDANT;

            firstInChain = true;
            token = this.getToken(true, true);
            continue;
          }
        }
        // other combinators
        else if (!parsingNegation && this.isTokenCombinator(token)) {
          var s = new CSSSelector();
          s.parent = selector;
          selector = s;
          if (token.isSymbol("+"))
            selector.combinator = COMBINATOR_ADJACENT_SIBLING;
          else if (token.isSymbol("~"))
            selector.combinator = COMBINATOR_SIBLING;
          else if (token.isSymbol(">"))
            selector.combinator = COMBINATOR_CHILD;

          firstInChain = true;
          token = this.getToken(true, true);
          continue;
        }

        // TYPE ELEMENT SELECTOR
        else if (firstInChain
            && (token.isSymbol("*")
                || token.isIdent())) {
          // this is a type element selector
          selector.elementTypeList.push(token.value);
        }

        // ID SELECTOR
        else if (token.isSymbol("#")) {
          token = this.getToken(false, true);
          if (!token.isNotNull() || !token.isIdent())
            throw (new DOMException("Syntax error after a hash noting a class selector"));
          selector.IDList.push(token.value);
        }

        // CLASS SELECTOR
        else if (token.isSymbol(".")) {
          token = this.getToken(false, true);
          if (!token.isNotNull() || !token.isIdent())
            throw (new DOMException("Syntax error after a period noting a class selector"));
          selector.ClassList.push(token.value);
        }

        // PSEUDO CLASS AND ELEMENT
        else if (token.isSymbol(":")) {
          token = this.getToken(false, true);
          if (!token.isNotNull())
            throw (new DOMException("SyntaxError"));
          // is it a double-colon for a pseudo-element?
          if (token.isSymbol(":")) {
            token = this.getToken(false, true);
            if (!token.isNotNull() || !token.isIdent())
              throw (new DOMException("SyntaxError"));
            if (!CSSSelector.isPseudoElement(token.ivalue))
              throw (new DOMException("Unknown pseudo-element"));
            selector.pseudoElement = token.ivalue;
          }
          else if (token.isIdent()) {
            // no, it's supposed to be a pseudo-class or a single-
            // colon pseudo-element
            if (CSSSelector.isPseudoElement(token.ivalue))
              selector.pseudoElement = token.ivalue;
            else if (CSSSelector.isPseudoClass(token.ivalue)) {
              selector.PseudoClassList.push(token.ivalue);
            }
            else // unknown...
              throw (new DOMException("Unknown pseudo-class"));
          }
          else if (token.isFunction()
                   && CSSSelector.isFunctionalPseudoClass(token.ivalue)) {
            if (token.ivalue == "lang(") {
              var langArray: Array<DOMString> = [];
              token = this.getToken(true, true);
              var expectingString = true;
              while (token.isNotNull()) {
                if (token.isSymbol(")")) {
                  if (expectingString)
                    throw (new DOMException("SyntaxError"));
                  break;
                }
                else if (token.isSymbol(",") && !expectingString) {
                  expectingString = true;
                }
                else if (token.isIdent() && expectingString) {
                  langArray.push(token.value);
                  expectingString = false;
                }
                else if (token.isSymbol("*") && expectingString) {
                  token = this.getToken(false, true);
                  if (!token.isIdent())
                    throw (new DOMException("SyntaxError"));
                  langArray.push("*" + token.value);
                  expectingString = false;
                }
                else
                  throw (new DOMException("Syntax error in :lang() argument"));

                token = this.getToken(true, true);
              }
              selector.LangPseudoClassList.push(langArray);
            }
            else if (!parsingNegation && token.ivalue == "not(") {
              if (selector.negation == null)
                selector.negation = new CSSSelector();
              this.parseSelector("", true, selector.negation);
            }
            else { // must be an+b/even/odd
              var type = token.ivalue;
              var s = "";
              token = this.getToken(true, false);
              while (token.isNotNull()) {
                if (token.isSymbol(")")) {
                  break;
                }
                s += token.toString();
                token = this.getToken(false, false);
              }
              if (!token.isSymbol(")"))
                throw (new DOMException("SyntaxError"));

              var a: Int = 0;
              var b: Int = 0;
              s = StringTools.trim(s).toLowerCase();
              if (s == "even") {
                a = 2;
              }
              else if (s == "odd") {
                a = 2;
                b = 1;
              }
              else if (this.ANB_EREG.match(s)) {
                // we should be dealing here with the CSS token types but
                // that's so ugly, hacky and painful a good'ol'regexp is a better,
                // cheaper and less error-prone solution. That's wrong but that's
                // life...
                if (this.ANB_EREG.matched(1) != null) {
                  a = Std.parseInt(this.ANB_EREG.matched(1));
                }
                else if (this.ANB_EREG.matched(5) != null) {
                  b = Std.parseInt(this.ANB_EREG.matched(5));
                }
                else {
                  a = Std.parseInt(this.ANB_EREG.matched(2));
                  b = Std.parseInt(this.ANB_EREG.matched(3) + this.ANB_EREG.matched(4));
                }
                var p = {
                  type: type.substr(0, type.length - 1),
                  a: a,
                  b: b
                };
                selector.NthPseudoclassList.push(p);
              }
              else
                throw (new DOMException("Syntax error in :nth-*() argument"));
            }
          }
          else // not a known pseudo-class
            throw (new DOMException("Unknown functional pseudo-class"));
        }

        // ATTR SELECTORS
        else if (token.isSymbol("[")) {
          token = this.getToken(true, true);
          if (!token.isIdent())
            throw (new DOMException("Syntax error, attribute name expected in attribute selector"));
          var name = token.value;
          token = this.getToken(true, true);
          if (token.isSymbol("]")) {
            var attrSelector = new CSSAttrSelector();
            attrSelector.name = name;
            attrSelector.operator = ATTR_EXISTS;
            selector.AttrList.push(attrSelector);
          }
          else {
            var operator = ATTR_EXISTS;
            if (token.isSymbol("="))
              operator = ATTR_EQUALS;
            else if (token.isIncludes())
              operator = ATTR_INCLUDES;
            else if (token.isDashmatch())
              operator = ATTR_DASHMATCH;
            else if (token.isBeginsmatch())
              operator = ATTR_BEGINSMATCH;
            else if (token.isEndsmatch())
              operator = ATTR_ENDSMATCH;
            else if (token.isContainsmatch())
              operator = ATTR_CONTAINSMATCH;
            else
              throw (new DOMException("Syntax error, unknown operator in attribute selector"));

            token = this.getToken(true, true);
            if (!token.isIdent() && !token.isString())
              throw (new DOMException("Syntax error, value in attribute selector must be ident or string"));
            var value = token.isIdent()
                        ? token.value
                        : token.value.substr(1, token.value.length - 2);

            var caseInsensitive = false;
            token = this.getToken(true, true);
            if (token.isIdent("i")) {
              caseInsensitive = true;
              token = this.getToken(true, true);
            }
            if (!token.isSymbol("]"))
              throw (new DOMException("Syntax error, closing bracket not found in attribute selector"));
            var attrSelector = new CSSAttrSelector();
            attrSelector.name            = name;
            attrSelector.value           = value;
            attrSelector.caseInsensitive = caseInsensitive;
            attrSelector.operator        = operator;
            selector.AttrList.push(attrSelector);
          }
        }

        else
          throw (new DOMException("SyntaxError"));

        token = this.getToken(false, true);
        firstInChain = false;
      } // END while (token.isNotNull())

      if (newInGroup) // hey we started a new group but received nothing
        throw (new DOMException("SyntaxError"));

      return selector;
    }
}
