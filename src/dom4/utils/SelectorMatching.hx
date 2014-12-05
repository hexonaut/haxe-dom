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
 * The Original Code is dom4 code.
 *
 * The Initial Developer of the Original Code is
 * Disruptive Innovations SAS
 * Portions created by the Initial Developer are Copyright (C) 2014
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

import dom4.CSSSelector;

class SelectorMatching {

  static public function matches(elt: Element, selector: CSSSelector, ?isNegation: Bool = false): Bool
  {
    // test all selectors in the group, exit on positive answer
    if (!isNegation && selector.next != null) {
      if (SelectorMatching.matches(elt, selector.next))
        return true;
    }

    if (selector == null) // sanity case
      throw (new DOMException("Unknown error, parsed selector should not be null"));

    var rv: Bool;
    var currentCombinator = COMBINATOR_NONE;
    do {
      rv = !isNegation;
      var id = elt.getAttribute("id");
      for (i in 0...selector.IDList.length) {
        var f = selector.IDList[i];
        rv = (id == f);
        if ((isNegation ? rv : !rv))
          break;
      }
  
      var n = elt.localName;
      if (elt.ownerDocument.documentElement.namespaceURI == Namespaces.HTML_NAMESPACE)
        n = n.toLowerCase();
      if ((isNegation ? !rv : rv))
        for (i in 0...selector.elementTypeList.length) {
          var f = selector.elementTypeList[i];
          rv = (f == "*") || ((elt.namespaceURI == Namespaces.HTML_NAMESPACE)
                              ? n == f.toLowerCase()
                              : n == f);
          if ((isNegation ? rv : !rv))
            break;
        }
  
      var cl = elt.classList;
      if ((isNegation ? !rv : rv))
        for (i in 0...selector.ClassList.length) {
          var f = selector.ClassList[i];
          rv = cl.contains(f);
          if ((isNegation ? rv : !rv))
            break;
        }
  
      if ((isNegation ? !rv : rv))
        for (i in 0...selector.AttrList.length) {
          var f = selector.AttrList[i];
          rv = (elt.hasAttribute(f.name) && switch (f.operator) {
                  case ATTR_EXISTS:        true;
                  case ATTR_EQUALS:        (f.caseInsensitive
                                            ? elt.getAttribute(f.name).toLowerCase() == f.value.toLowerCase()
                                            : elt.getAttribute(f.name) == f.value);
                  case ATTR_CONTAINSMATCH: (f.caseInsensitive
                                            ? (elt.getAttribute(f.name).toLowerCase().indexOf(f.value.toLowerCase()) != -1)
                                            : (elt.getAttribute(f.name).indexOf(f.value) != -1));
                  case ATTR_BEGINSMATCH:   (f.caseInsensitive
                                            ? StringTools.startsWith(elt.getAttribute(f.name).toLowerCase(), f.value.toLowerCase())
                                            : StringTools.startsWith(elt.getAttribute(f.name), f.value));
                  case ATTR_ENDSMATCH:     (f.caseInsensitive
                                            ? StringTools.endsWith(elt.getAttribute(f.name).toLowerCase(), f.value.toLowerCase())
                                            : StringTools.endsWith(elt.getAttribute(f.name), f.value));
                  case ATTR_DASHMATCH:     (f.caseInsensitive
                                            ? elt.getAttribute(f.name).toLowerCase() == f.value.toLowerCase()
                                            : elt.getAttribute(f.name) == f.value)
                                           || (f.caseInsensitive
                                               ? StringTools.startsWith(elt.getAttribute(f.name).toLowerCase(), f.value.toLowerCase() + "-")
                                               : StringTools.startsWith(elt.getAttribute(f.name), f.value + "-"));
                  case ATTR_INCLUDES:      (f.caseInsensitive
                                            ? (elt.getAttribute(f.name).toLowerCase().split(" ").indexOf(f.value.toLowerCase()) != -1)
                                            : (elt.getAttribute(f.name).split(" ").indexOf(f.value) != -1));
                });
          if ((isNegation ? rv : !rv))
            break;
        }

      /*
       * STRUCTURAL PSEUDO-CLASSES
       */
      if ((isNegation ? !rv : rv))
        for (i in 0...selector.PseudoClassList.length) {
          switch (selector.PseudoClassList[i]) {
            case "root":          rv = (elt.ownerDocument.documentElement == elt);
            case "first-child":   rv = (elt.parentNode != null
                                        && elt.parentNode.nodeType == Node.ELEMENT_NODE
                                        && cast(elt.parentNode, Element).firstElementChild == elt);
            case "last-child":    rv = (elt.parentNode != null
                                        && elt.parentNode.nodeType == Node.ELEMENT_NODE
                                        && cast(elt.parentNode, Element).lastElementChild == elt);
            case "only-child":    rv = (elt.parentNode != null
                                        && elt.parentNode.nodeType == Node.ELEMENT_NODE
                                        && cast(elt.parentNode, Element).lastElementChild == elt
                                        && cast(elt.parentNode, Element).firstElementChild == elt);
            case "empty":         var child = elt.firstChild;
                                  while ((isNegation ? !rv : rv) && child != null) {
                                    rv = (child.nodeType != Node.ELEMENT_NODE && child.nodeType != Node.TEXT_NODE);
                                    child = child.nextSibling;
                                  }
            case "first-of-type": var ns = elt.namespaceURI;
                                  var type = elt.localName;
                                  var sibling = elt.previousElementSibling;
                                  while ((isNegation ? !rv : rv) && sibling != null) {
                                    rv = (ns != sibling.namespaceURI || type != sibling.localName);
                                    sibling = sibling.previousElementSibling;
                                  }
            case "last-of-type":  var ns = elt.namespaceURI;
                                  var type = elt.localName;
                                  var sibling = elt.nextElementSibling;
                                  while ((isNegation ? !rv : rv) && sibling != null) {
                                    rv = (ns != sibling.namespaceURI || type != sibling.localName);
                                    sibling = sibling.nextElementSibling;
                                  }
            case "only-of-type":  var ns = elt.namespaceURI;
                                  var type = elt.localName;
                                  var sibling = elt.previousElementSibling;
                                  while ((isNegation ? !rv : rv) && sibling != null) {
                                    rv = (ns != sibling.namespaceURI || type != sibling.localName);
                                    sibling = sibling.previousElementSibling;
                                  }
                                  var sibling = elt.nextElementSibling;
                                  while ((isNegation ? !rv : rv) && sibling != null) {
                                    rv = (ns != sibling.namespaceURI || type != sibling.localName);
                                    sibling = sibling.nextElementSibling;
                                  }
          }
          if ((isNegation ? rv : !rv))
            break;
        }

      /*
       * NTH PSEUDO-CLASSES
       */
      if ((isNegation ? !rv : rv))
        for (i in 0...selector.NthPseudoclassList.length) {
          var f = selector.NthPseudoclassList[i];
          var n: Int = 0;
          switch (f.type) {
            case "nth-child":       n = 1;
                                    var sibling = elt.previousElementSibling;
                                    while (sibling != null) {
                                      n++;
                                      sibling = sibling.previousElementSibling;
                                    }
            case "nth-last-child":  n = 1;
                                    var sibling = elt.nextElementSibling;
                                    while (sibling != null) {
                                      n++;
                                      sibling = sibling.nextElementSibling;
                                    }
            case "nth-of-type":     var ns = elt.namespaceURI;
                                    var type = elt.localName;
                                    var sibling = elt.previousElementSibling;
                                    while (sibling != null) {
                                      if (sibling.namespaceURI == ns && sibling.localName == type)
                                         n++;
                                       sibling = sibling.previousElementSibling;
                                     }
            case "nth-last-of-type": var ns = elt.namespaceURI;
                                     var type = elt.localName;
                                     var sibling = elt.nextElementSibling;
                                     while (sibling != null) {
                                       if (sibling.namespaceURI == ns && sibling.localName == type)
                                       n++;
                                       sibling = sibling.nextElementSibling;
                                     }
          }
          if (n != 0) { // sanity case
            if (f.a != 0) {
              var q = (n - f.b)/f.a;
              rv = (Math.floor(q) == q);
            }
            else {
              rv = (f.b == n);
            }
            if ((isNegation ? rv : !rv))
              break;
          }
        }

      /*
       * LANG PSEUDO-CLASS...
       */
      if ((isNegation ? !rv : rv)) {
        var eltLang = ""; 
        var e = elt;
        while (e != null && e.nodeType == Node.ELEMENT_NODE && eltLang == "") {
          if (e.hasAttribute("lang"))
            eltLang = e.getAttribute("lang");
          else if (e.hasAttributeNS(Namespaces.XML_NAMESPACE, "lang"))
            eltLang = e.getAttributeNS(Namespaces.XML_NAMESPACE, "lang");
          if (e.parentNode != null && e.parentNode.nodeType == Node.ELEMENT_NODE)
            e = cast(e.parentNode, Element);
          else
            e = null;
        }
        for (i in 0...selector.LangPseudoClassList.length) {
          var f = selector.LangPseudoClassList[i];
          var lrv = false;
          for (j in 0...f.length) {
            var l = f[j].toLowerCase();
            if (l.charAt(0) == "*")
              lrv = StringTools.endsWith(eltLang, l.substr(1));
            else
              lrv = StringTools.startsWith(eltLang, l);
            if (lrv)
              break;
          }
          if ((isNegation ? lrv : !lrv)) {
            rv = isNegation;
            break;
          }
        }
      }

      if (!isNegation && rv && selector.negation != null)
        rv = !SelectorMatching.matches(elt, selector.negation, true);

      if (isNegation)
        return rv;

      if (rv && selector.combinator == COMBINATOR_NONE)
        return rv;
      if (rv) {
        currentCombinator = selector.combinator;
        switch (selector.combinator) {
          case COMBINATOR_NONE: return rv;
          case COMBINATOR_DESCENDANT
               | COMBINATOR_CHILD:           var n = elt.parentNode;
                                             if (n != null && n.nodeType == Node.ELEMENT_NODE)
                                               elt = cast(n, Element);
                                             else
                                               return false;
                                             selector = selector.parent;
          case COMBINATOR_ADJACENT_SIBLING
               | COMBINATOR_SIBLING:         elt = elt.previousElementSibling;
                                             if (elt == null)
                                               return false;
                                             selector = selector.parent;
        }
      }
      else {
        switch (currentCombinator) {
          case COMBINATOR_NONE:             return rv; // should never happen
          case COMBINATOR_CHILD:            return false;
          case COMBINATOR_ADJACENT_SIBLING: return false;
          case COMBINATOR_SIBLING:          elt = elt.previousElementSibling;
                                            if (elt == null)
                                              return false;
          case COMBINATOR_DESCENDANT:       var n = elt.parentNode;
                                            if (n != null && n.nodeType == Node.ELEMENT_NODE)
                                              elt = cast(n, Element);
                                            else
                                              return false;
        }
      }
    } while (elt != null);
    
    return rv;
  }
}
