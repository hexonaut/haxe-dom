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
import dom4.utils.Namespaces;

class Element extends Node
              implements ParentNode
              implements NonDocumentTypeChildNode
              implements ChildNode {

  /*
   * https://dom.spec.whatwg.org/#interface-element
   */

  /*
   * https://dom.spec.whatwg.org/#dom-element-namespaceuri
   */
  public var namespaceURI(default, null): DOMString;

  /*
   * https://dom.spec.whatwg.org/#dom-element-prefix
   */
  public var prefix(default, null): DOMString;

  /*
   * https://dom.spec.whatwg.org/#dom-element-localname
   */
  public var localName(default, null): DOMString;

  /*
   * https://dom.spec.whatwg.org/#dom-element-tagname
   */
  public var tagName(get, null): DOMString;
      private function get_tagName(): DOMString
      {
        var qualifiedName = this.localName;
        if (this.prefix != "")
          qualifiedName = this.prefix + ":" + this.localName;
        if (this.namespaceURI == Namespaces.HTML_NAMESPACE
            && this.ownerDocument.documentElement != null
            && this.ownerDocument.documentElement.localName.toLowerCase() == "html")
          qualifiedName = qualifiedName.toUpperCase();
        return qualifiedName;
      }

  /*
   * https://dom.spec.whatwg.org/#dom-element-id
   */
  public var id(get, set): DOMString;
      private function get_id(): DOMString
      {
        if (this.hasAttribute("id"))
          return this.getAttribute("id");
        return "";
      }
      private function set_id(v: DOMString): DOMString
      {
        this.setAttribute("id", v);
        return v;
      }

  /*
   * https://dom.spec.whatwg.org/#dom-element-classname
   */
  public var className: DOMString;
      private function get_className(): DOMString
      {
        return this.classList.toString();
      }
      private function set_className(v: DOMString): DOMString
      {
        this.classList = new DOMTokenList(v, this, "class");
        return this.classList.toString();
      }

  /*
   * https://dom.spec.whatwg.org/#dom-element-classlist
   */
  public var classList(get, null): DOMTokenList;
      private function get_classList(): DOMTokenList
      {
        return (new DOMTokenList(this.getAttribute("class"),
                                 this,
                                 "class"));
      }

  /*
   * https://dom.spec.whatwg.org/#dom-element-hasattributes
   */
  public function hasAttributes(): Bool
  {
    return (this.attributes.length != 0);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-element-attributes
   */
  public var attributes(default, null): NamedNodeMap;

  /*
   * https://dom.spec.whatwg.org/#dom-element-getattribute
   */
  public function getAttribute(name: DOMString): DOMString
  {
    var matching = this.attributes.getNamedItem(name);
    if (matching == null)
      return null;
    return matching.value;
  }

  /*
   * https://dom.spec.whatwg.org/#dom-element-getattributens
   */
  public function getAttributeNS(?namespace: DOMString, localName: DOMString): DOMString
  {
    var matching = this.attributes.getNamedItemNS(namespace, localName);
    if (matching == null)
      return null;
    return matching.value;
  }

  /* 
   * https://dom.spec.whatwg.org/#dom-element-setattribute
   */
  public function setAttribute(name: DOMString, value: DOMString): Void
  {
    Namespaces._validateQualifiedName(name);

    var matching = this.attributes.getNamedItem(name);
    if (matching != null) {
      matching.value = value;
      return;
    }
    var attr = new Attr(null, null, name, value);
    this.attributes.setNamedItem(attr);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-element-setattributens
   */
  public function setAttributeNS(?namespace: DOMString, name: DOMString, value:DOMString): Void
  {
    var v = Namespaces._validateAndExtract(namespace, name);

    var attr = new Attr(v.namespace, v.prefix, v.localName, value);
    this.attributes.setNamedItem(attr);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-element-removeattribute
   */
  public function removeAttribute(name: DOMString): Void
  {
    this.attributes.removeNamedItem(name);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-element-removeattributens
   */
  public function removeAttributeNS(?namespace: DOMString, localName: DOMString): Void
  {
    this.attributes.removeNamedItemNS(namespace, localName);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-element-hasattribute
   */
  public function hasAttribute(name: DOMString): Bool
  {
    return (null != this.attributes.getNamedItem(name));
  }

  /*
   * https://dom.spec.whatwg.org/#dom-element-hasattributens
   */
  public function hasAttributeNS(?namespace: DOMString, localName: DOMString): Bool
  {
    return (null != this.attributes.getNamedItemNS(namespace, localName));
  }

  /*
   * https://dom.spec.whatwg.org/#dom-element-getattributenode
   */
  public function getAttributeNode(name: DOMString): Attr
  {
    return this.attributes.getNamedItem(name);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-element-getattributenodens
   */
  public function getAttributeNodeNS(?namespace: DOMString, localName: DOMString): Attr
  {
    return this.attributes.getNamedItemNS(namespace, localName);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-element-setattributenode
   */
  public function setAttributeNode(attr: Attr): Attr
  {
    return this.attributes.setNamedItem(attr);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-element-setattributenode
   */
  public function setAttributeNodeNS(attr: Attr): Attr
  {
    return this.attributes.setNamedItemNS(attr);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-element-removeattributenode
   */
  public function removeAttributeNode(attr:Attr): Attr
  {
    return this.attributes.removeAttributeNode(attr);
  }

  public var previousElementSibling(get, null): Element;
      private function get_previousElementSibling(): Element
      {
        return NonDocumentTypeChildNodeImpl.previousElementSibling(this);
      }
  public var nextElementSibling(get, null): Element;
      private function get_nextElementSibling(): Element
      {
        return NonDocumentTypeChildNodeImpl.nextElementSibling(this);
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

  public function query(relativeSelectors: DOMString): Element     {throw (new DOMException("Not yet implemented")); }
  public function queryAll(relativeSelectors: DOMString): Elements {throw (new DOMException("Not yet implemented")); }
  public function querySelector(selectors: DOMString): Element
  {
    return ParentNodeImpl.querySelector(this, selectors);
  }
  public function querySelectorAll(selectors: DOMString): NodeList
  {
    return ParentNodeImpl.querySelectorAll(this, selectors);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-childnode-before
   */
  public function before(nodes: Array<Either<Node, DOMString>>): Void
  {
    if (this.parentNode == null)
      return;
    var node = ParentNodeImpl._mutationMethod(this, nodes);
    this.parentNode.insertBefore(node, this);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-childnode-after
   */
  public function after(nodes: Array<Either<Node, DOMString>>): Void
  {
    if (this.parentNode == null)
      return;
    var node = ParentNodeImpl._mutationMethod(this, nodes);
    this.parentNode.insertBefore(node, this.nextSibling);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-childnode-replace
   */
  public function replace(nodes: Array<Either<Node, DOMString>>): Void
  {
    if (this.parentNode == null)
      return;
    var node = ParentNodeImpl._mutationMethod(this, nodes);
    this.parentNode.replaceChild(node, this);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-childnode-remove
   */
  public function remove(): Void
  {
    if (this.parentNode == null)
      return;
    this.parentNode.removeChild(this);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-element-getelementsbytagname
   */
  public function getElementsByTagName(localName: DOMString): HTMLCollection
  {
    var node = cast(this, Node);
    var sourceNode = node;
    var ns = sourceNode.ownerDocument.documentElement.namespaceURI;
    var rv: Array<Element> = [];
    do {
      if (node.nodeType == Node.ELEMENT_NODE) {
        var elt = cast(node, Element);
        if (localName == "*" // STEP 1
            || (ns == Namespaces.HTML_NAMESPACE // STEP 2
                && ((elt.namespaceURI == Namespaces.HTML_NAMESPACE && localName == elt.localName.toLowerCase())
                    || (elt.namespaceURI != Namespaces.HTML_NAMESPACE && localName == elt.localName)))
            || localName == elt.localName) // STEP 3
        rv.push(cast(node, Element));
      }
      if (node.firstChild != null)
        node = node.firstChild;
      else if (node != sourceNode && node.nextSibling != null)
        node = node.nextSibling;
      else {
        while (node != sourceNode && node.nextSibling == null)
          node = node.parentNode;
        if (node != sourceNode)
          node = node.nextSibling;
      }
    } while (node != sourceNode);
    return new HTMLCollection(rv);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-element-getelementsbytagnamens
   */
  public function getElementsByTagNameNS(?namespace: DOMString, localName: DOMString): HTMLCollection
  {
    var node = cast(this, Node);
    var sourceNode = node;
    var rv: Array<Element> = [];
    do {
      if (node.nodeType == Node.ELEMENT_NODE) {
        var elt = cast(node, Element);
        if ((localName == "*" || elt.localName == localName)
            && (namespace == "*" || elt.namespaceURI == namespace))
          rv.push(elt);
      }
      if (node.firstChild != null)
        node = node.firstChild;
      else if (node != sourceNode && node.nextSibling != null)
        node = node.nextSibling;
      else {
        while (node != sourceNode && node.nextSibling == null)
          node = node.parentNode;
      }
    } while (node != sourceNode);
    return new HTMLCollection(rv);
  }

  /*
   * https://dom.spec.whatwg.org/#dom-element-getelementsbyclassname
   */
  public function getElementsByClassName(classNames: DOMString): HTMLCollection
  {
    var node = cast(this, Node);
    var sourceNode = node;
    var domTokens = new DOMTokenList(classNames);
    // early way out if we can
    if (domTokens.length == 0)
      return new HTMLCollection();

    var rv: Array<Element> = [];
    do {
      if (node.nodeType == Node.ELEMENT_NODE) {
        var elt = cast(node, Element);
        var elementDomTokens = new DOMTokenList(elt.className);
        if (elementDomTokens.supersets(domTokens))
          rv.push(elt);
      }
      if (node.firstChild != null)
        node = node.firstChild;
      else if (node != sourceNode && node.nextSibling != null)
        node = node.nextSibling;
      else {
        while (node != sourceNode && node.nextSibling == null)
          node = node.parentNode;
      }
    } while (node != sourceNode);
    return new HTMLCollection(rv);
  }

  public function _setPrefix(n: DOMString): Void
  {
    this.prefix = n;
  }

  public function _setNamespaceURI(n: DOMString): Void
  {
    this.namespaceURI = n;
  }

  /**********************************************
   * IMPLEMENTATION HELPERS
   **********************************************/
  static public function _clone(eltNode: Node): Element
  {
    var d: Element = cast(eltNode, Element);
    var n = new Element(d.namespaceURI, d.localName, d.prefix);
    n.attributes = NamedNodeMap._clone(d.attributes);
    return n;
  }

  public function new(namespace: DOMString, localName: DOMString, ?prefix: DOMString = "") {
    super();
    this.attributes = new NamedNodeMap();
    this.namespaceURI = namespace;
    this.localName = localName;
    this.prefix = prefix;
    this.nodeType = Node.ELEMENT_NODE;
  }
}
