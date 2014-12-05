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

package dom4;

import dom4.utils.Either;
import dom4.utils.CSSParser;
import dom4.utils.SelectorMatching;

class ParentNodeImpl {

  /*
   * https://dom.spec.whatwg.org/#interface-parentnode
   */

  /**********************************************
   * HELPERS DEFINED BY SPECIFICATION
   **********************************************/

  /*
   * https://dom.spec.whatwg.org/#mutation-method-macro
   */
  static public function _mutationMethod(refNode: Node, nodes: Array<Either<Node, DOMString>>): Node
  {
    var doc = (refNode.nodeType == Node.DOCUMENT_NODE)
              ? cast(refNode, Document)
              : refNode.ownerDocument;
    // STEP 1
    var node: Node = null;
    // STEP 2
    for (index in 0...nodes.length) {
      if (Std.is(nodes[index], DOMString)) {
        nodes[index] = doc.createTextNode(nodes[index]);
      }
    }
    // STEP 3
    if (nodes.length > 1) {
      node = doc.createDocumentFragment();
      nodes.map(function(n) {
        node.appendChild(n);
      });
    }
    else
      node = nodes[0];
    return node;
  }

  /**********************************************
   * IDL
   **********************************************/

  /*
   * https://dom.spec.whatwg.org/#dom-parentnode-firstelementchild
   */
  static public function firstElementChild(refNode: Node): Element
  {
    var child = refNode.firstChild;
    while (child != null) {
      if (child.nodeType == Node.ELEMENT_NODE)
        return cast(child, Element);
      child = child.nextSibling;
    }
    return null;
  }
  
  static public function lastElementChild(refNode: Node): Element
  {
    var child = refNode.lastChild;
    while (child != null) {
      if (child.nodeType == Node.ELEMENT_NODE)
        return cast(child, Element);
      child = child.previousSibling;
    }
    return null;
  }

  /*
   * https://dom.spec.whatwg.org/#dom-parentnode-children
   */
  static public function children(refNode: Node): HTMLCollection
  {
    var elementArray: Array<Element> = [];
    var child = refNode.firstChild;
    while (null != child) {
      if (child.nodeType == Node.ELEMENT_NODE)
        elementArray.push(cast(child, Element));
      child = child.nextSibling;
    }
    return new HTMLCollection(elementArray);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-parentnode-childelementcount
   */
  static public function childElementCount(refNode: Node): UInt
  {
    return children(refNode).length;
  }

  /*
   * https://dom.spec.whatwg.org/#dom-parentnode-prepend
   */
  static public function prepend(refNode: Node, nodes: Array<Either<Node, DOMString>>): Void
  {
    // extra sanity case
    if (null == refNode)
      throw (new DOMException("HierarchyRequestError"));
    if (nodes.length == 0)
      return;

    // STEP 1
    var node = ParentNodeImpl._mutationMethod(refNode, nodes);
    refNode.insertBefore(node, refNode.firstChild);
  }  

  /*
   * https://dom.spec.whatwg.org/#dom-parentnode-append
   */
  static public function append(refNode: Node, nodes: Array<Either<Node, DOMString>>): Void
  {
    // extra sanity case
    if (null == refNode)
      throw (new DOMException("HierarchyRequestError"));
    if (nodes.length == 0)
      return;

    // STEP 1
    var node = ParentNodeImpl._mutationMethod(refNode, nodes);
    refNode.appendChild(node);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-parentnode-queryselector
   */
  static public function querySelector(refNode: Node, selectors: DOMString): Element
  {
    var parser = new CSSParser();
    var parsedSelectors = parser.parseSelector(selectors);

    var iter = refNode.ownerDocument.createNodeIterator(refNode, 1);
    var node = iter.nextNode();
    while (node != null) {
      var elt = cast(node, Element);
      if (SelectorMatching.matches(elt, parsedSelectors))
        return elt;
      node = iter.nextNode();
    }

    return null;
  }

  /*
   * 
   */
  static public function querySelectorAll(refNode: Node, selectors: DOMString): NodeList
  {
    var parser = new CSSParser();
    var parsedSelectors = parser.parseSelector(selectors);
    var rv = new NodeList(null);

    var iter = refNode.ownerDocument.createNodeIterator(refNode, 1);
    var node = iter.nextNode();
    while (node != null) {
      var elt = cast(node, Element);
      if (SelectorMatching.matches(elt, parsedSelectors))
        rv._getNodes().push(elt);
      node = iter.nextNode();
    }

    return rv;
  }
}
