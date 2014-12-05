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

import dom4.utils.Namespaces;
import dom4.utils.MutationUtils;

typedef NodeEventListener = {
    var type : DOMString;
    var callback : EventListener;
    var capture : Bool;
}
class Node implements EventTarget {

  /*
   * https://dom.spec.whatwg.org/#interface-node
   */

  public static inline var ELEMENT_NODE: Int = 1;
  public static inline var ATTRIBUTE_NODE: Int = 2;
  public static inline var TEXT_NODE: Int = 3;
  public static inline var CDATA_SECTION_NODE: Int = 4;
  public static inline var ENTITY_REFERENCE_NODE: Int = 5;
  public static inline var ENTITY_NODE: Int = 6;
  public static inline var PROCESSING_INSTRUCTION_NODE: Int = 7;
  public static inline var COMMENT_NODE: Int = 8;
  public static inline var DOCUMENT_NODE: Int = 9;
  public static inline var DOCUMENT_TYPE_NODE: Int = 10;
  public static inline var DOCUMENT_FRAGMENT_NODE: Int = 11;
  public static inline var NOTATION_NODE: Int = 12;

  public static inline var DOCUMENT_POSITION_DISCONNECTED: Int = 0x01;
  public static inline var DOCUMENT_POSITION_PRECEDING: Int = 0x02;
  public static inline var DOCUMENT_POSITION_FOLLOWING: Int = 0x04;
  public static inline var DOCUMENT_POSITION_CONTAINS: Int = 0x08;
  public static inline var DOCUMENT_POSITION_CONTAINED_BY: Int = 0x10;
  public static inline var DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC: Int = 0x20;

  private var NOT_WHITESPACE_ONLY_EREG = new EReg("[^ \t\r\n]", "g");

  private var eventListeners: Array<NodeEventListener>;
  /*
   * https://dom.spec.whatwg.org/#dom-node-nodetype
   */
  public var nodeType(default, null): Int;

  /*
   * https://dom.spec.whatwg.org/#dom-node-nodename
   */
  public var nodeName(get, null): DOMString;
      private function get_nodeName(): DOMString
      {
        return switch (this.nodeType)
        {
          case ELEMENT_NODE: cast(this, Element).tagName;
          case TEXT_NODE: "#text";
          case PROCESSING_INSTRUCTION_NODE: cast(this, ProcessingInstruction).target;
          case COMMENT_NODE: "#comment";
          case DOCUMENT_NODE: "#document";
          case DOCUMENT_TYPE_NODE: cast(this, DocumentType).name;
          case DOCUMENT_FRAGMENT_NODE: "#document-fragment";
          case _: ""; // should never hit
        } 
      }

  /*
   * https://dom.spec.whatwg.org/#dom-node-baseuri
   */
  public var baseURI(default, null): DOMString;

  /*
   * https://dom.spec.whatwg.org/#dom-node-ownerdocument
   */
  public var ownerDocument(default, null): Document;

  /*
   * https://dom.spec.whatwg.org/#dom-node-parentnode
   */
  public var parentNode(default, null): Node;

  /*
   * https://dom.spec.whatwg.org/#dom-node-parentelement
   */
  public var parentElement(get, null): Element;
      private function get_parentElement() : Element
      {
        return ((this.parentNode.nodeType == ELEMENT_NODE)
                ? cast(this.parentNode, Element)
                : null);
      }

  /*
   * https://dom.spec.whatwg.org/#dom-node-haschildnodes
   */
  public function hasChildNodes(): Bool
  {
    return (null != this.firstChild);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-node-childnodes
   */
  public var childNodes(get, null): NodeList;
      private function get_childNodes(): NodeList
      {
        return new NodeList(this.firstChild);
      }

  /*
   * https://dom.spec.whatwg.org/#dom-node-firstchild
   */
  public var firstChild(default, null): Node;

  /*
   * https://dom.spec.whatwg.org/#dom-node-lastchild
   */
  public var lastChild(default, null): Node;

  /*
   * https://dom.spec.whatwg.org/#dom-node-previoussibling
   */
  public var previousSibling(default, null): Node;

  /*
   * https://dom.spec.whatwg.org/#dom-node-nextsibling
   */
  public var nextSibling(default, null): Node;

  /*
   * https://dom.spec.whatwg.org/#dom-node-nodevalue
   */
  public var nodeValue(get, set): DOMString;
      private function get_nodeValue(): DOMString
      {
        switch (this.nodeType) {
          case TEXT_NODE | PROCESSING_INSTRUCTION_NODE | COMMENT_NODE:
            return cast(this, CharacterData).data;
          case _:
            return null;
        }
      }
      private function set_nodeValue(v: DOMString): DOMString
      {
        switch (this.nodeType) {
          case TEXT_NODE | PROCESSING_INSTRUCTION_NODE | COMMENT_NODE:
            cast(this, CharacterData).data = v; // TBD, use "replace data"
        }
        return v;
      }

  /*
   * https://dom.spec.whatwg.org/#dom-node-textcontent
   */
  public var textContent(get, set): DOMString;
      private function get_textContent(): DOMString
      {
        var rv = this.nodeValue;
        if (rv == null) {
          rv = "";
          var n = this.firstChild;
          while (n != null) {
            rv += n.textContent;
            n = n.nextSibling;
          }
        }
        return rv;
      }
      private function set_textContent(v: DOMString): DOMString
      {
        switch (this.nodeType) {
          case TEXT_NODE | PROCESSING_INSTRUCTION_NODE | COMMENT_NODE:
            cast(this, CharacterData).data = v;
          case ELEMENT_NODE: {
            this.firstChild = new Text(v);
            this.lastChild = this.firstChild;
          }
          case _:{}
        }
        return v;
      }

  /*
   * https://dom.spec.whatwg.org/#dom-node-normalize
   */
  public function normalize(): Void
  {
    var node = this.firstChild;
    while (node != null) {
      switch (node.nodeType) {
        case TEXT_NODE: {
          while (node.nextSibling != null && node.nextSibling.nodeType == TEXT_NODE) {
            cast(node, Text).data += cast(node.nextSibling, Text).data;
            node.parentNode.removeChild(node.nextSibling);
          }
        }
        case ELEMENT_NODE: node.normalize();
      }
      node = node.nextSibling;
    }
  }

  /*
   * https://dom.spec.whatwg.org/#dom-node-clonenode
   */
  public function cloneNode(?deep: Bool = false) : Node
  {
    // XXX
    return null;
  }

  private function _cloneOneNode() : Node
  {
    switch (this.nodeType) {
      case DOCUMENT_TYPE_NODE: {
        var dt = cast(this, DocumentType);
        return cast(this.ownerDocument.implementation.createDocumentType(dt.name, dt.publicId, dt.systemId), Node);
      }
      case TEXT_NODE:
        return cast(this.ownerDocument.createTextNode(cast(this, Text).data), Node);
      case COMMENT_NODE:
        return cast(this.ownerDocument.createComment(cast(this, Comment).data), Node);
      case PROCESSING_INSTRUCTION_NODE: {
        var pi = cast(this, ProcessingInstruction);
        return cast(this.ownerDocument.createProcessingInstruction(pi.target, pi.data), Node);
      }
      case ELEMENT_NODE: {
        var e = cast(this, Element);
        var newElt = this.ownerDocument.createElementNS(e.namespaceURI, e.localName);
      }
    }
    return null; // should never happen
  }

  /*
   * https://dom.spec.whatwg.org/#dom-node-isequalnode
   */
  public function isEqualNode(node: Node): Bool
  {
    // TBD must run in depth
    return (node == this);
  }

  /* 
   * https://dom.spec.whatwg.org/#dom-node-comparedocumentposition
   */
  public function compareDocumentPosition(other: Node): Int
  {
    if (this == other)
      return 0;

    var referenceRoot = this;
    var referenceAncestors: Array<Node> = [];
    while (referenceRoot.parentNode != null
           && (referenceRoot.parentNode.nodeType == ELEMENT_NODE
               ||  referenceRoot.parentNode.nodeType == TEXT_NODE
               ||  referenceRoot.parentNode.nodeType == COMMENT_NODE
               ||  referenceRoot.parentNode.nodeType == PROCESSING_INSTRUCTION_NODE)) {
      referenceRoot = referenceRoot.parentNode;
      referenceAncestors.push(referenceRoot);
      if (referenceRoot == other)
        return DOCUMENT_POSITION_CONTAINS | DOCUMENT_POSITION_PRECEDING;
    }

    var otherRoot = other;
    var otherAncestors: Array<Node> = [];
    while (otherRoot.parentNode != null
           && (otherRoot.parentNode.nodeType == ELEMENT_NODE
               ||  otherRoot.parentNode.nodeType == TEXT_NODE
               ||  otherRoot.parentNode.nodeType == COMMENT_NODE
               ||  otherRoot.parentNode.nodeType == PROCESSING_INSTRUCTION_NODE)) {
      otherRoot = otherRoot.parentNode;
      otherAncestors.push(otherRoot);
      if (otherRoot == this)
        return  DOCUMENT_POSITION_CONTAINED_BY | DOCUMENT_POSITION_FOLLOWING;
    }

    if (referenceRoot != otherRoot)
      return  DOCUMENT_POSITION_DISCONNECTED
              | DOCUMENT_POSITION_IMPLEMENTATION_SPECIFIC
              | DOCUMENT_POSITION_PRECEDING;

    // find deepest common ancestor
    var index = 0;
    var commonAncestor: Node = null;
    while (index < Math.min(referenceAncestors.length, otherAncestors.length)) {
      if (referenceAncestors[index] == otherAncestors[index])
        commonAncestor = referenceAncestors[index];
    }

    // there _is_ a common ancestor because they belong to same tree
    var node: Node = commonAncestor;
    while (true) {
      if (node == other)
        return DOCUMENT_POSITION_PRECEDING;
      if (node == this)
        return DOCUMENT_POSITION_FOLLOWING;

      if (null != node.firstChild) {
        node = node.firstChild;
      }
      else if (null != node.nextSibling)
        node = node.nextSibling;
      else if (null == node.parentNode)
        break;
      else {
        while (null == node.nextSibling
               && null != node.parentNode
               && node.parentNode.nodeType == Node.ELEMENT_NODE) {
          node = node.parentNode;
        }
        node = node.nextSibling;
        if (null == node)
          break;
      }
    }

    // sanity case
    throw (new DOMException("ShouldNeverHitError"));
  }

  /*
   * https://dom.spec.whatwg.org/#dom-node-contains
   */
  public function contains(other: Node): Bool
  {
    if (this.isEqualNode(other))
      return true;
    var node = this.firstChild;
    while (node != null) {
      if (node.isEqualNode(other))
        return true;
      node = node.nextSibling;
    }
    return false;
  }

  /*
   * https://dom.spec.whatwg.org/#dom-node-insertbefore
   */
  public function insertBefore(node: Node, child: Node): Node {
    return this._preInsert(node, child);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-node-appendchild
   */
  public function appendChild(node: Node): Node
  {
    return this.insertBefore(node, null);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-node-removechild
   */
  public function removeChild(child: Node): Node
  {
    return this._preRemove(child);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-node-replacechild
   */
  public function replaceChild(node: Node, child: Node): Node
  {
    switch (this.nodeType) {
      case DOCUMENT_NODE
           | DOCUMENT_FRAGMENT_NODE
           | ELEMENT_NODE: {}
      case _: throw (new DOMException("HierarchyRequestError"));
    }

    if (child != null && child.parentNode != this)
      throw (new DOMException("NotFoundError"));

    switch (node.nodeType) {
      case DOCUMENT_FRAGMENT_NODE
           | DOCUMENT_TYPE_NODE
           | ELEMENT_NODE
           | TEXT_NODE
           | PROCESSING_INSTRUCTION_NODE
           | COMMENT_NODE: {}
      case _: throw (new DOMException("HierarchyRequestError"));
    }

    if ((node.nodeType == TEXT_NODE && this.nodeType == DOCUMENT_NODE)
        || (node.nodeType == DOCUMENT_TYPE_NODE && this.nodeType != DOCUMENT_NODE))
      throw (new DOMException("HierarchyRequestError"));

    var t = cast(this, ParentNode);
    if (this.nodeType == DOCUMENT_NODE) {
      if (node.nodeType == DOCUMENT_FRAGMENT_NODE) {
        var n = cast(node, ParentNode);
        if (n.firstElementChild != null && n.firstElementChild != n.lastElementChild)
          throw (new DOMException("HierarchyRequestError"));
        var currentNode = node.firstChild;
        while (currentNode != null) {
          if (currentNode.nodeType == TEXT_NODE)
            throw (new DOMException("HierarchyRequestError"));
          currentNode = child.nextSibling;
        }

        if (n.firstElementChild != null
            && ((t.firstElementChild != null && t.firstElementChild != child)
                || (child.nextSibling != null && child.nextSibling.nodeType == DOCUMENT_TYPE_NODE)))
          throw (new DOMException("HierarchyRequestError"));
      }
      else if (node.nodeType == ELEMENT_NODE) {
        if ((t.firstElementChild != null && t.firstElementChild != child)
            || (child.nextSibling != null && child.nextSibling.nodeType == DOCUMENT_TYPE_NODE))
          throw (new DOMException("HierarchyRequestError"));
      }
      else if (node.nodeType == DOCUMENT_TYPE_NODE) {
        var currentNode = this.firstChild;
        var foundDoctypeInParent = false;
        while (!foundDoctypeInParent && child != null) {
          if (currentNode.nodeType == DOCUMENT_TYPE_NODE && currentNode != child)
            foundDoctypeInParent = true;
          currentNode = currentNode.nextSibling;
        }
        if (foundDoctypeInParent
            || (child == null && cast(child, ParentNode) != null && cast(child, ParentNode).firstElementChild != null))
          throw (new DOMException("HierarchyRequestError"));
      }
    }

    var reference = child.nextSibling;
    if (reference == node)
      reference = node.nextSibling;

    if (this.nodeType == DOCUMENT_NODE)
      cast(this, Document).adoptNode(node);
    else
      this.ownerDocument.adoptNode(node);
    this.removeChild(child);
    this.insertBefore(node, reference);
    return child;
  }

  /*
   * 
   */

  /**********************************************
   * IMPLEMENTATION HELPERS
   **********************************************/
  public function _doInsertBefore(n: Node, referenceChild: Node): Void
  {
    if (null != referenceChild) {
      n.previousSibling = referenceChild.previousSibling;
      referenceChild.previousSibling = n;
    }
    else {
      n.previousSibling = this.lastChild;
      this.lastChild = n;
    }
    if (null != n.previousSibling) {
      n.previousSibling.nextSibling = n;
    }
    else {
      this.firstChild = n;
    }
    n.nextSibling = referenceChild;
    n.parentNode = this;
  }

  public var _childIndex(get, null): UInt;
    private function get__childIndex(): UInt
    {
      // sanity check
      if (this.parentNode == null)
        throw (new DOMException("HierarchyRequestError"));
      var index = -1;
      var node = this;
      while (node != null) {
        index++;
        node = node.previousSibling;
      }
      return index;
    }

  /**********************************************
   * HELPERS DEFINED BY SPECIFICATION
   **********************************************/

  /*
   * https://dom.spec.whatwg.org/#concept-node-ensure-pre-insertion-validity
   */
  public function _preInsertValidation(node:Node, child: Node): Void
  {
    switch (this.nodeType) {
      case Node.DOCUMENT_NODE
           | Node.DOCUMENT_FRAGMENT_NODE
           | Node.ELEMENT_NODE: {}
      case _: throw (new DOMException("HierarchyRequestError"));
    }
    var i = 0;

    if (node._isInclusiveAncestor(this))
      throw (new DOMException("HierarchyRequestError"));

    if (child != null && child.parentNode != this)
      throw (new DOMException("NotFoundError"));

    switch (node.nodeType) {
      case Node.DOCUMENT_FRAGMENT_NODE
           | Node.DOCUMENT_TYPE_NODE
           | Node.ELEMENT_NODE
           | Node.TEXT_NODE
           | Node.PROCESSING_INSTRUCTION_NODE
           | Node.COMMENT_NODE: {}
      case _: throw (new DOMException("HierarchyRequestError"));
    }

    if ((node.nodeType == Node.TEXT_NODE
         && this.NOT_WHITESPACE_ONLY_EREG.match(cast(node, Text).data)
         && this.nodeType == Node.DOCUMENT_NODE)
        || (node.nodeType == Node.DOCUMENT_TYPE_NODE
            && this.nodeType != Node.DOCUMENT_NODE)) {
      throw (new DOMException("HierarchyRequestError"));
    }

    if (this.nodeType == Node.DOCUMENT_NODE) {
      if (node.nodeType == Node.DOCUMENT_FRAGMENT_NODE) {
        var n = cast(node, ParentNode);
        if (n.firstElementChild != null && n.firstElementChild != n.lastElementChild)
          throw (new DOMException("HierarchyRequestError"));
        var currentNode = node.firstChild;
        while (currentNode != null) {
          if (currentNode.nodeType == Node.TEXT_NODE)
            throw (new DOMException("HierarchyRequestError"));
          currentNode = child.nextSibling;
        }

        if (n.firstElementChild != null
            && (cast(this, ParentNode).firstElementChild != null
                || (child != null
                    && child.nodeType == Node.DOCUMENT_TYPE_NODE)
                || (child != null
                    && child.nextSibling != null
                    && child.nextSibling.nodeType == Node.DOCUMENT_TYPE_NODE)))
          throw (new DOMException("HierarchyRequestError"));
      }
      else if (node.nodeType == Node.ELEMENT_NODE) {
        if (cast(this, ParentNode).firstElementChild != null
            || (child != null
                && child.nodeType == Node.DOCUMENT_TYPE_NODE)
            || (child != null
                && child.nextSibling != null
                && child.nextSibling.nodeType == Node.DOCUMENT_TYPE_NODE))
          throw (new DOMException("HierarchyRequestError"));
      }
      else if (node.nodeType == Node.DOCUMENT_TYPE_NODE) {
        var currentNode = this.firstChild;
        var foundDoctypeInParent = false;
        while (!foundDoctypeInParent
               && currentNode != null) {
          if (currentNode.nodeType == Node.DOCUMENT_TYPE_NODE)
            foundDoctypeInParent = true;
          currentNode = currentNode.nextSibling;
        }
        if (foundDoctypeInParent
            || (child != null
                && cast(child, NonDocumentTypeChildNode).previousElementSibling != null)
            || (child == null
                && cast(this, ParentNode).firstElementChild != null))
          throw (new DOMException("HierarchyRequestError"));
      }
    }
  }

  /*
   * https://dom.spec.whatwg.org/#concept-tree-host-including-inclusive-ancestor
   */
  public function _isHostIncludingInclusiveAncestor(refNode: Node): Bool
  {
    /*
     * XXX this is not implemented for the time being
     */
    return this._isInclusiveAncestor(refNode);
  }

  /*
   * https://dom.spec.whatwg.org/#concept-tree-inclusive-ancestor
   */
  public function _isInclusiveAncestor(refNode: Node): Bool
  {
    if (refNode.parentNode == null)
      return false;
    var currentNode = refNode.parentNode;
    while (currentNode != null) {
      if (currentNode == this)
        return true;
      currentNode = currentNode.parentNode;
    }
    return false;
  }

  /*
   * https://dom.spec.whatwg.org/#concept-tree-inclusive-descendant
   */
  public function _isInclusiveDescendant(refNode: Node): Bool
  {
    var currentNode = this;
    while (currentNode != null) {
      if (currentNode == refNode)
        return true;
      currentNode = currentNode.parentNode;
    }
    return false;
  }

  /*
   * https://dom.spec.whatwg.org/#concept-node-pre-insert
   * 
   */
  public function _preInsert(node:Node, child: Node): Node
  {
    this._preInsertValidation(node, child);

    var referenceChild = child;
    if (referenceChild == node)
      referenceChild = node.nextSibling;

    if (this.nodeType == Node.DOCUMENT_NODE)
      cast(this, Document).adoptNode(node);
    else
      this.ownerDocument.adoptNode(node);

    this._insert(node, referenceChild);
    return node;
  }

  /*
   * https://dom.spec.whatwg.org/#concept-node-insert
   */
  public function _insert(node:Node, child:Node, ?suppressObservers: Bool = false): Void
  {
    // STEP 1
    var count = ((node.nodeType == Node.DOCUMENT_FRAGMENT_NODE)
                 ? node.childNodes.length
                 : 1);
    // STEP 2
    if (child != null) {
      var index = child._childIndex;
      var ranges = this.ownerDocument._ranges;
      // STEP 2.1
      ranges.map(function(r) {
          if (r.startContainer == this && r.startOffset > index)
            r.setStart(r.startContainer, r.startOffset + count);
        });
      // STEP 2.2
      ranges.map(function(r) {
          if (r.endContainer == this && r.endOffset > index)
            r.setEnd(r.endContainer, r.endOffset + count);
        });
    }

    // STEP 3
    var nodes = ((node.nodeType == Node.DOCUMENT_FRAGMENT_NODE)
                 ? node.childNodes._getNodes().copy()
                 : [node]);
    // STEP 4
    if (node.nodeType == Node.DOCUMENT_FRAGMENT_NODE) {
      MutationUtils.queueMutationRecord(node, "childList", null, null, null, null, nodes, null, null);
    }
    // STEP 5
    if (node.nodeType == Node.DOCUMENT_FRAGMENT_NODE) {
      node._removeChildren(true);
    }
    // STEP 6
    if (!suppressObservers) {
      MutationUtils.queueMutationRecord(this, "childList", null, null, null, nodes, null,
                                        ((child == null) ? this.lastChild : child.previousSibling),
                                        child);
    }
    // STEP 7
    nodes.map(function(n){
      this._doInsertBefore(n, child);
    });
  }

  public function _removeChildren(?suppressObservers: Bool = false): Void
  {
    while (this.firstChild != null) {
      this._remove(this.firstChild, suppressObservers);
    }
  }

  public function _remove(node: Node, ?suppressObservers: Bool = false): Void
  {
    // STEP 1
    var index = node._childIndex;

    var ranges = this.ownerDocument._ranges;
    // STEP 2
    ranges.map(function(r) {
        if (r.startContainer._isInclusiveDescendant(node))
          r.setStart(this, index);
      });
    // STEP 3
    ranges.map(function(r) {
        if (r.endContainer._isInclusiveDescendant(node))
          r.setEnd(this, index);
      });
    // STEP 4
    ranges.map(function(r) {
        if (r.startContainer == this && r.startOffset > index)
          r.setStart(r.startContainer, r.startOffset - 1);
      });
    // STEP 5
    ranges.map(function(r) {
        if (r.endContainer == this && r.endOffset > index)
          r.setEnd(r.endContainer, r.endOffset - 1);
      });
    // STEP 6
    var oldPreviousSibling = node.previousSibling;
    // STEP 7
    if (!suppressObservers) {
      MutationUtils.queueMutationRecord(this, "childList", null, null, null,
                                        null, [node],
                                        node.nextSibling,
                                        oldPreviousSibling);
    }
    // STEP 8 TBD
    // STEP 9
    if (node.previousSibling != null)
      node.previousSibling.nextSibling = node.nextSibling;
    if (node.nextSibling != null)
      node.nextSibling.previousSibling = node.previousSibling;
    if (this.firstChild == node)
      this.firstChild = node.nextSibling;
    if (this.lastChild == node)
      this.lastChild = null;
  }
  
  /*
   * https://dom.spec.whatwg.org/#concept-node-replace-all
   */
  public function _replaceAll(node: Node): Void
  {
    // STEP 1
    if (null != node) {
      if (node.nodeType == Node.DOCUMENT_NODE)
        cast(this, Document).adoptNode(node);
      else
        this.ownerDocument.adoptNode(node);
    }
    // STEP 2
    var removedNodes = this.childNodes._getNodes().copy();
    // STEP 3
    var addedNodes: Array<Node> = [];
    if (node != null) {
      addedNodes = ((node.nodeType == Node.DOCUMENT_FRAGMENT_NODE)
                    ? addedNodes = node.childNodes._getNodes().copy()
                    : [node]);
    }
    // STEP 4
    this._removeChildren(true);
    // STEP 5
    if (null != node)
      this._insert(node, null, true);
    // STEP 6
    MutationUtils.queueMutationRecord(this, "childList", null, null, null,
                                      addedNodes, removedNodes,
                                      null,
                                      null);
  }

  /*
   * https://dom.spec.whatwg.org/#concept-node-pre-remove
   */
  public function _preRemove(child: Node): Node
  {
    // STEP 1
    if (child.parentNode != this)
      throw (new DOMException("NotFoundError"));
    // STEP 2
    this._remove(child);
    // STEP 3
    return child;
  }

  /*
   * https://dom.spec.whatwg.org/#locate-a-namespace-prefix
   */
  private function _locateNamespacePrefix(namespace: DOMString): DOMString
  {
    var node = this;

    while (node != null) {
      var elt = cast(this, Element);
      if (elt != null) {
        // STEP 1
        if (elt.namespaceURI == namespace && elt.prefix != null)
          return elt.prefix;
        // STEP 2
        var attrs = elt.attributes;
        for (index in 0...attrs.length) {
          var a = attrs[index];
          if (a.prefix == "xmlns" && a.value == namespace)
            return a.localName;
        }
  
        // STEP 3
        if (elt.parentElement != null)
          node = cast(elt.parentElement, Node);
        else
          return null;
      }
    }
    throw (new DOMException("ShouldNeverHitError"));
  }

  /*
   * https://dom.spec.whatwg.org/#locate-a-namespace
   */
  public function _locateNamespace(prefix: DOMString): DOMString
  {
    if (prefix == "xml")
      return Namespaces.XML_NAMESPACE;
    if (prefix == "xmlns")
      return Namespaces.XMLNS_NAMESPACE;

    var node = this;

    while (node != null) {
      switch (node.nodeType) {
        case Node.ELEMENT_NODE: {
          var elt = cast(node, Element);
          // STEP 1
          if (elt.namespaceURI != null && elt.prefix == prefix)
            return elt.namespaceURI;
          // STEP 2
          var attr: Attr = null;
          if (elt.hasAttributeNS(Namespaces.XMLNS_NAMESPACE, prefix)) {
            attr = elt.getAttributeNodeNS(Namespaces.XMLNS_NAMESPACE, prefix);
            if (attr.prefix == "xmlns") {
              return ((attr.value != "") ? attr.value : null);
            }
          } else if ((prefix == null || prefix == "")
                   && elt.hasAttributeNS(Namespaces.XMLNS_NAMESPACE, "xmlns")) {
            attr = elt.getAttributeNodeNS(Namespaces.XMLNS_NAMESPACE, "xmlns");
            if (attr.prefix == "" || attr.prefix == null)
              return ((attr.value != "") ? attr.value : null);
          }
          // STEP 3
          if (node.parentElement == null)
            return null;
          // STEP 4
          node = cast(node.parentElement, Node);
        }
        case Node.DOCUMENT_NODE: {
          var elt = cast(node, Document).documentElement;
          // STEP 1
          if (elt == null)
            return null;
          // STEP 2
          node = cast(elt, Node);
        }
        case Node.DOCUMENT_TYPE_NODE
             | Node.DOCUMENT_FRAGMENT_NODE: {
          return null;
        }
        case _: {
          // STEP 1
          if (node.parentElement == null)
            return null;
          // STEP 2
          node = cast(node.parentElement, Node);
        }
      }
    }
    throw (new DOMException("ShouldNeverHitError"));
  }

  /*
   * https://dom.spec.whatwg.org/#dom-eventtarget-addeventlistener
   */
  public function addEventListener(type: DOMString, callback: EventListener, ?capture: Bool = false): Void
  {
    // STEP 1
    if (callback == null)
      return;

    // STEP 2
    if (this.eventListeners.filter(
          function(f) {
            return (f.type == type
                    && f.callback == callback
                    && f.capture == capture);
          }).length != 0)
      return;
    this.eventListeners.push({type: type, callback: callback, capture: capture});
  }

  /*
   * https://dom.spec.whatwg.org/#dom-eventtarget-removeeventlistener
   */
  public function removeEventListener(type: DOMString, callback: EventListener, ?capture: Bool = false): Void
  {
    if (callback == null)
      return;

    this.eventListeners = this.eventListeners.filter(
          function(f) {
            return (f.type != type
                    || f.callback != callback
                    || f.capture != capture);
          });
  }

  /*
   * https://dom.spec.whatwg.org/#dom-eventtarget-dispatchevent
   */
  public function dispatchEvent(event: Event): Bool
  {
    // STEP 1
    if (event.dispatchFlag || !event.initializedFlag)
      throw (new DOMException("InvalidStateError"));

    // STEP 2
    event.set_isTrusted(false);
    // STEP 3
    return Event.dispatch(event, this);
  }

  /*
   * https://dom.spec.whatwg.org/#concept-event-listener-invoke
   */
  public function _invokeListeners(event: Event): Void
  {
    // STEP 3
    event.set_currentTarget(this);
    // STEP 4 and 4.2
    for (listener in this.eventListeners) {
      // STEP 4.1
      if (event.stopImmediatePropagationFlag)
        return;
      // STEP 4.3
      if (listener.type != event.type
          || (event.eventPhase == event.CAPTURING_PHASE && !listener.capture)
          || (event.eventPhase == event.BUBBLING_PHASE && listener.capture)) {
        // do nothing, STEPS 4.4 and 4.5
      }
      else {
        listener.callback.handleEvent(event);
      }
    }
  }

  public function new() {
    this.eventListeners = [];
  }
}
