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

class DocumentFragment extends Node
                       implements ParentNode
                       implements NonParentElementNode {

  /*
   * https://dom.spec.whatwg.org/#interface-documentfragment
   */

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
    return ParentNodeImpl.querySelector(this, selectors);
  }
  public function querySelectorAll(selectors: DOMString): NodeList
  {
    return ParentNodeImpl.querySelectorAll(this, selectors);
  }

  public function new() {
    super();
    this.nodeType = Node.DOCUMENT_FRAGMENT_NODE;
  }
}
