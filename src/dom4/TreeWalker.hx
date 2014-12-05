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

enum TreeWalkerType {
  TREE_WALKER_FIRST;
  TREE_WALKER_LAST;
  TREE_WALKER_NEXT;
  TREE_WALKER_PREVIOUS;
}
/*
 * https://dom.spec.whatwg.org/#treewalker
 */

class TreeWalker {

  public var root(default, null): Node;

  public var whatToShow(default, null): FlagsWithAllState<WhatToShowFlag>;

  public var filter(default, null): NodeFilter;

  public var currentNode(default, default): Node;

  /*
   * https://dom.spec.whatwg.org/#dom-treewalker-parentnode
   */
  public function parentNode(): Node {
    // STEP 1
    var node = this.currentNode;
    // STEP 2
    while (node != null && node != this.root) {
      // STEP 2.1
      node = node.parentNode;
      // STEP 2.2
      if (node != null && NodeIterator._filterNode(node, whatToShow, filter) == FILTER_ACCEPT) {
        this.currentNode = node;
        return node;
      }
    }
    // STEP 3
    return null;
  }

  /*
   * https://dom.spec.whatwg.org/#dom-treewalker-firstchild
   */
  public function firstChild(): Node
  {
    return this._traverseChildren(TREE_WALKER_FIRST);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-treewalker-lastchild
   */
  public function lastChild(): Node
  {
    return this._traverseChildren(TREE_WALKER_LAST);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-treewalker-previoussibling
   */
  public function previousSibling(): Node
  {
    return this._traverseSiblings(TREE_WALKER_PREVIOUS);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-treewalker-nextsibling
   */
  public function nextSibling(): Node
  {
    return this._traverseSiblings(TREE_WALKER_NEXT);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-treewalker-previousnode
   */
  public function previousNode(): Node
  {
    // STEP 1
    var node = this.currentNode;
    // STEP 2
    while (node != this.root) {
      // STEP 2.1
      var sibling = node.previousSibling;
      // STEP 2.2
      while (sibling != null) {
        // STEP 2.2.1
        node = sibling;
        // STEP 2.2.2
        var result = NodeIterator._filterNode(node, whatToShow, filter);
        // STEP 2.2.3
        while (result != FILTER_REJECT
               && node.firstChild != null) {
          node = node.lastChild;
          result = NodeIterator._filterNode(node, whatToShow, filter);
        }
        // STEP 2.2.4
        if (result == FILTER_ACCEPT) {
          this.currentNode = node;
          return node;
        }
        // STEP 2.2.5
        sibling = node.previousSibling;
      }
      // STEP 2.3
      if (node == this.root || node.parentNode == null)
        return null;
      // STEP 2.4
      node = node.parentNode;
      // STEP 2.5
      if (NodeIterator._filterNode(node, whatToShow, filter) == FILTER_ACCEPT) {
        this.currentNode = node;
        return node;
      }
    }
    return null;
  }

  /*
   * https://dom.spec.whatwg.org/#dom-treewalker-nextnode
   */
  public function nextNode(): Node
  {
    // STEP 1
    var node = this.currentNode;
    // STEP 2
    var result = FILTER_ACCEPT;
    // STEP 3
    do {
      // STEP 3.1
      while (result != FILTER_ACCEPT && node.firstChild != null) {
        // STEP 3.1.1
        node = node.firstChild;
        // STEP 3.1.2
        result = NodeIterator._filterNode(node, whatToShow, filter);
        // STEP 3.1.3
        if (result == FILTER_ACCEPT) {
          this.currentNode = node;
          return node;
        }
      }
      // STEP 3.2
      var n = node.nextSibling;
      var found: Node = null;
      while (n != null && found == null) {
        var comparison = n.compareDocumentPosition(this.root);
        if (comparison & Node.DOCUMENT_POSITION_FOLLOWING == 0)
          found = n;
        n = n.nextSibling;
      }
      if (found != null) {
        node = found;
      }
      else
        return null;
      // STEP 3.3
      result = NodeIterator._filterNode(node, whatToShow, filter);
    }
    while (true);
  }

  /**********************************************
   * HELPERS DEFINED BY SPECIFICATION
   **********************************************/

  /*
   * https://dom.spec.whatwg.org/#concept-traverse-children
   */
  private function _traverseChildren(type: TreeWalkerType) : Node
  {
    // STEP 1
    var node = this.currentNode;
    // STEP 2
    node = ((type == TREE_WALKER_FIRST)
            ? node.firstChild
            : node.lastChild);
    // STEP 3
    while (node != null) {
      // STEP 3.1
      var result = NodeIterator._filterNode(node, whatToShow, filter);
      // STEP 3.2
      if (result == FILTER_ACCEPT) {
        this.currentNode = node;
        return node;
      }
      // STEP 3.3
      if (result == FILTER_SKIP) {
        // STEP 3.3.1
        var child = ((type == TREE_WALKER_FIRST)
                     ? node.firstChild
                     : node.lastChild);
        // STEP 3.3.2
        if (child != null) {
          node = child;
          continue;
        }
      }
      // STEP 3.4
      while (node != null) {
        // STEP 3.4.1
        var sibling = ((type == TREE_WALKER_FIRST)
                       ? node.nextSibling
                       : node.previousSibling);
        // STEP 3.4.2
        if (sibling != null) {
          node = sibling;
          continue;
        }
        // STEP 3.4.3
        var parent = node.parentNode;
        // STEP 3.4.4
        if (parent == null
            || parent == this.root
            || parent == this.currentNode)
          return null;
        // STEP 3.4.5
        node = parent;
      }
    }
    // STEP 4
    return null; 
  }

  /*
   * https://dom.spec.whatwg.org/#concept-traverse-siblings
   */
  private function _traverseSiblings(type: TreeWalkerType) : Node
  {
    // STEP 1
    var node = this.currentNode;
    // STEP 2
    if (node == this.root)
      return null;
    // STEP 3
    do {
      // STEP 3.1
      var sibling = ((type == TREE_WALKER_NEXT)
                     ? node.nextSibling
                     : node.previousSibling);
      // STEP 3.2
      while (sibling != null) {
        // STEP 3.2.1
        node = sibling;
        // STEP 3.2.2
        var result = NodeIterator._filterNode(node, whatToShow, filter);
        // STEP 3.2.3
        if (result == FILTER_ACCEPT) {
          this.currentNode = node;
          return node;
        }
        // STEP 3.2.4
        sibling = ((type == TREE_WALKER_NEXT)
                   ? node.firstChild
                   : node.lastChild);
        // STEP 3.2.5
        if (result == FILTER_REJECT
            || sibling == null) {
          sibling = ((type == TREE_WALKER_NEXT)
                     ? node.nextSibling
                     : node.previousSibling);
        }
      }
      // STEP 3.3
      node = node.parentNode;
      // STEP 3.4
      if (node == null || node == this.root)
        return null;
      // STEP 3.5
      if (NodeIterator._filterNode(node, whatToShow, filter) == FILTER_ACCEPT)
        return null;
      // STEP 3.6
    }
    while (true);
  }

  public function new(root: Node, whatToShow: FlagsWithAllState<WhatToShowFlag>, filter: NodeFilter)
  {
    this.root = root;
    this.currentNode = root;
    this.whatToShow = whatToShow;
    this.filter = filter;
  }
}
