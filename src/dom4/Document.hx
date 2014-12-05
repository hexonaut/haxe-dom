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

import dom4.utils.Either;
import dom4.utils.Namespaces;

class Document extends Node
               implements ParentNode
               implements NonParentElementNode {

  /*
   * https://dom.spec.whatwg.org/#interface-document
   */

  public var _ranges: Array<Range> = [];

  /*
   * https://dom.spec.whatwg.org/#dom-document-implementation
   */
  public var implementation(default, null): DOMImplementation;

  /*
   * https://dom.spec.whatwg.org/#dom-document-url
   */
  public var URL(default, null): DOMString; 
  public var documentURI(get, null): DOMString;
      private function get_documentURI(): DOMString
      {
        return this.URL;
      }

  /*
   * https://dom.spec.whatwg.org/#dom-document-origin
   */
  public var origin(default, null): DOMString;

  /*
   * https://dom.spec.whatwg.org/#dom-document-compatmode
   */
  public var compatMode(default, null): DOMString;

  /*
   * https://dom.spec.whatwg.org/#dom-document-characterset
   */
  public var characterSet(default, null): DOMString;

  /*
   * https://dom.spec.whatwg.org/#dom-document-contenttype
   */
  public var contentType(default, null): DOMString;

  /*
   * https://dom.spec.whatwg.org/#dom-document-doctype
   */
  public var doctype(get, null): DocumentType;
      private function get_doctype(): DocumentType
      {
        var child = cast(this, Node).firstChild;
        while (child != null) {
          if (child.nodeType == Node.DOCUMENT_TYPE_NODE)
            return cast(child, DocumentType);
          child = child.nextSibling;
        }
        return null;
      }

  /*
   * https://dom.spec.whatwg.org/#dom-document-documentelement
   */
  public var documentElement(get, null): Element;
      private function get_documentElement(): Element
      {
        var node = cast(this, ParentNode).firstElementChild;
        return ((null != node) ? cast(node, Element) : null);
      }

  /*
   * https://dom.spec.whatwg.org/#dom-document-getelementsbytagname
   */
  public function getElementsByTagName(localName: DOMString): HTMLCollection
  {
    var node = cast(this.documentElement, Node);
    var rv: Array<Element> = [];
    while (node != null) {
      if (node.nodeType == Node.ELEMENT_NODE) {
        var elt = cast(node, Element);
        if (localName == "*" // STEP 1
            || (this.documentElement.namespaceURI == Namespaces.HTML_NAMESPACE // STEP 2
                && ((elt.namespaceURI == Namespaces.HTML_NAMESPACE && localName == elt.localName.toLowerCase())
                    || (elt.namespaceURI != Namespaces.HTML_NAMESPACE && localName == elt.localName)))
            || localName == elt.localName) // STEP 3
        rv.push(cast(node, Element));
      }
      if (node.firstChild != null)
        node = node.firstChild;
      else if (node.nextSibling != null)
        node = node.nextSibling;
      else {
        while (node != null && node.nextSibling == null)
          node = node.parentNode;
        if (node != null)
          node = node.nextSibling;
      }
    }
    return new HTMLCollection(rv);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-document-getelementsbytagnamens
   */
  public function getElementsByTagNameNS(?namespace: DOMString, localName: DOMString): HTMLCollection
  {
    var node = cast(this.documentElement, Node);
    var rv: Array<Element> = [];
    while (node != null) {
      if (node.nodeType == Node.ELEMENT_NODE) {
        var elt = cast(node, Element);
        if ((localName == "*" || elt.localName == localName)
            && (namespace == "*" || elt.namespaceURI == namespace))
          rv.push(elt);
      }
      if (node.firstChild != null)
        node = node.firstChild;
      else if (node.nextSibling != null)
        node = node.nextSibling;
      else {
        while (node != null && node.nextSibling == null)
          node = node.parentNode;
      }
    }
    return new HTMLCollection(rv);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-document-getelementsbyclassname
   */
  public function getElementsByClassName(classNames: DOMString): HTMLCollection
  {
    var node = cast(this.documentElement, Node);
    var domTokens = new DOMTokenList(classNames);
    // early way out if we can
    if (domTokens.length == 0)
      return new HTMLCollection();

    var rv: Array<Element> = [];
    while (node != null) {
      if (node.nodeType == Node.ELEMENT_NODE) {
        var elt = cast(node, Element);
        var elementDomTokens = new DOMTokenList(elt.className);
        if (elementDomTokens.supersets(domTokens))
          rv.push(elt);
      }
      if (node.firstChild != null)
        node = node.firstChild;
      else if (node.nextSibling != null)
        node = node.nextSibling;
      else {
        while (node != null && node.nextSibling == null)
          node = node.parentNode;
      }
    }
    return new HTMLCollection(rv);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-document-adoptnode
   */
  public function adoptNode(node: Node): Node
  {
    if (node == null)
      throw (new DOMException("HierarchyRequestError"));
    if (node.nodeType == Node.DOCUMENT_NODE)
      throw (new DOMException("NotSupportedError"));

    if (node.parentNode != null)
      node.parentNode._remove(node);
    _setNodeOwnerDocument(node, this);

    return node;
  }

  /*
   * https://dom.spec.whatwg.org/#dom-document-createelementns
   */
  public function createElementNS(namespace: DOMString, qualifiedName: DOMString): Element
  {
    var v = Namespaces._validateAndExtract(namespace, qualifiedName);

    var e = new Element(v.namespace, v.localName, v.prefix);
    e.ownerDocument = this;
    return e;
  }

  /*
   * https://dom.spec.whatwg.org/#dom-document-createelement
   */
  public function createElement(localName: DOMString): Element
  {
    Namespaces._validateAsXMLName(localName);

    if (this.documentElement != null
        && this.documentElement.namespaceURI == Namespaces.HTML_NAMESPACE
        && this.documentElement.localName.toLowerCase() == "html")
      localName = localName.toLowerCase();

    var e = new Element(Namespaces.HTML_NAMESPACE, localName, "");
    e.ownerDocument = this;
    return e;
  }

  /*
   * https://dom.spec.whatwg.org/#dom-document-createtextnode
   */
  public function createTextNode(data: DOMString): Text
  {
    var t = new Text(data);
    t.ownerDocument = this;
    return t;
  }

  /*
   * https://dom.spec.whatwg.org/#dom-document-createcomment
   */
  public function createComment(data: DOMString): Comment
  {
    var c = new Comment(data);
    c.ownerDocument = this;
    return c;
  }

  /*
   * https://dom.spec.whatwg.org/#dom-document-createprocessinginstruction
   */
  public function createProcessingInstruction(target: DOMString, data: DOMString): ProcessingInstruction
  {
    Namespaces._validateAsXMLName(target);

    if (data.indexOf("?>") != -1)
      throw (new DOMException("Invalid character error"));

    var pi = new ProcessingInstruction(target, data);
    pi.ownerDocument = this;
    return pi;
  }

  /*
   * https://dom.spec.whatwg.org/#dom-document-createdocumentfragment
   */
  public function createDocumentFragment(): DocumentFragment
  {
    var df = new DocumentFragment();
    df.ownerDocument = this;
    return df;
  }

  public var firstElementChild(get, null): Element;
      private function get_firstElementChild(): Element
      {
        return ParentNodeImpl.firstElementChild(this);
      }
  public var lastElementChild(get, null): Element;
  private function get_lastElementChild(): Element
  {
    return ParentNodeImpl.lastElementChild(this);
  }
  public var children(get, null): HTMLCollection;
      private function get_children(): HTMLCollection
      {
        return ParentNodeImpl.children(this);
      }
  public var childElementCount(get, null): UInt;
      private function get_childElementCount(): UInt
      {
        return ParentNodeImpl.childElementCount(this);
      }
  public function prepend(nodes: Array<Either<Node, DOMString>>): Void
  {
    return ParentNodeImpl.prepend(this, nodes);
  }
  public function append(nodes: Array<Either<Node, DOMString>>): Void
  {
    return ParentNodeImpl.append(this, nodes);
  }

  public function getElementById(elementID: DOMString): Element
  {
    return NonParentElementNodeImpl.getElementById(this, elementID);
  }

  public function query(relativeSelectors: DOMString): Element     {throw (new DOMException("Not yet implemented")); }
  public function queryAll(relativeSelectors: DOMString): Elements {throw (new DOMException("Not yet implemented")); }
  public function querySelector(selectors: DOMString): Element
  {
    return ParentNodeImpl.querySelector(this.documentElement, selectors);
  }
  public function querySelectorAll(selectors: DOMString): NodeList
  {
    return ParentNodeImpl.querySelectorAll(this, selectors);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-document-createrange
   */
  public function createRange(): Range {
    var range = new Range(this, 0, this, 0);
    this._ranges.push(range);
    return range;
  }

  public function _detachRange(r: Range): Void {
    this._ranges.remove(r);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-document-createnodeiterator
   */
  public function createNodeIterator(root: Node,
                                     ?whatToShow: Int = 0xFFFFFFFF,
                                     ?filter: NodeFilter = null): NodeIterator {
    var flags = new FlagsWithAllState<WhatToShowFlag>(whatToShow);
    return (new NodeIterator(root, flags, filter));
  }

  /*
   * https://dom.spec.whatwg.org/#treewalker
   */
  public function createTreeWalker(root: Node,
                                     ?whatToShow: Int = 0xFFFFFFFF,
                                     ?filter: NodeFilter = null): TreeWalker {
    var flags = new FlagsWithAllState<WhatToShowFlag>(whatToShow);
    return (new TreeWalker(root, flags, filter));
  }

  /**********************************************
   * IMPLEMENTATION HELPERS
   **********************************************/
  static public function _setNodeOwnerDocument(node: Node, doc: Document): Void
  {
    if (node == null)
      return;
    node.ownerDocument = doc;
    var child = node.firstChild;
    while (child != null) {
      _setNodeOwnerDocument(child, doc);
      child = child.nextSibling;
    }
  }

  static public function _setURL(doc: Document, URL: DOMString): Void
  {
    if (doc == null)
      return;
    doc.URL = URL;
  }

  /**********************************************
   * HELPERS DEFINED BY SPECIFICATION
   **********************************************/

  public function new(?implementation: DOMImplementation = null) {
    super();
    this.implementation = ((null == implementation) ? new DOMImplementation() : implementation);
    this.nodeType = Node.DOCUMENT_NODE;
  }
}
