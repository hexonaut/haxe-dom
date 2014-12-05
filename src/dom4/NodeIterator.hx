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

import dom4.NodeFilter;

/*
 * https://dom.spec.whatwg.org/#interface-nodeiterator
 */

enum NodeIteratorDirection {
  NODE_ITERATOR_NEXT;
  NODE_ITERATOR_PREVIOUS;
}

class NodeIterator {

  public var root(default, null): Node;

  public var referenceNode(default, null): Node;

  public var pointerBeforeRefenceNode(default, null): Bool;

  public var whatToShow(default, null): FlagsWithAllState<WhatToShowFlag>;

  public var filter(default, null): NodeFilter;

  public function nextNode(): Node
  {
    return this._traverse(NODE_ITERATOR_NEXT);
  }

  public function previousNode(): Node
  {
    return this._traverse(NODE_ITERATOR_PREVIOUS);
  }

  public function detach(): Void
  {
    // TBD
  }

  /**********************************************
   * HELPERS DEFINED BY SPECIFICATION
   **********************************************/

  /*
   * https://dom.spec.whatwg.org/#concept-node-filter
   */
  static public function _filterNode(node: Node, w: FlagsWithAllState<WhatToShowFlag>, f: NodeFilter): NodeFilterResponse {
    // STEP 1
    var n = node.nodeType - 1;
    // STEP 2
    if (w.toInt() & (1 << n) == 0)
      return FILTER_SKIP;
    // STEP 3
    if (f == null)
      return FILTER_ACCEPT;

    // STEPS 4 and 5
    return f.acceptNode(node);
  }

  /*
   * https://dom.spec.whatwg.org/#concept-nodeiterator-traverse
   */
  private function _traverse(direction: NodeIteratorDirection): Node {
    // STEP 1
    var node = this.referenceNode;
    // STEP 2
    var beforeNode = this.pointerBeforeRefenceNode;
    // STEP 3
    do { // STEP 3.2
      // STEP 3.1.a
      if (direction == NODE_ITERATOR_NEXT) {
        if (!beforeNode) {
          if (node.firstChild != null)
            node = node.firstChild;
          else if (node != this.root && node.nextSibling != null) {
            node = node.nextSibling;
          }
          else { // find the next sibling of an ancestor in the subtree
            while (node != null && node != this.root
                   && node.nextSibling == null) {
              node = node.parentNode;
            }
            if (node != null && node != this.root && node.nextSibling != null)
              node = node.nextSibling;
          }
          if (node == this.root)
            return null;
        }
        else
          beforeNode = false;
      }
      else { // STEP 3.1.b
        if (beforeNode) {
          if (node.lastChild != null)
            node = node.lastChild;
          else if (node != this.root && node.previousSibling != null) {
            node = node.previousSibling;
          }
          else { // find the previous sibling of an ancestor in the subtree
            while (node != null && node != this.root
                   && node.previousSibling == null) {
              node = node.parentNode;
            }
            if (node != null && node != this.root && node.previousSibling != null)
              node = node.previousSibling;
          }
          if (node == this.root)
            return null;
        }
        else
          beforeNode = true;
      }
    }
    while (node != null && node != this.root && NodeIterator._filterNode(node, whatToShow, filter) != FILTER_ACCEPT);

    // STEP 4
    this.referenceNode = node;
    this.pointerBeforeRefenceNode = beforeNode;
    return node;
  }

  public function new(root: Node, whatToShow: FlagsWithAllState<WhatToShowFlag>, filter: NodeFilter)
  {
    this.root = root;
    this.whatToShow = whatToShow;
    this.filter = filter;

    this.referenceNode = root;
    this.pointerBeforeRefenceNode = true;
  }
}
