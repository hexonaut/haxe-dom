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

/*
 * http://www.w3.org/TR/domcore/#interface-domimplementation
 */
class DocumentType extends Node
                   implements ChildNode {

  /*
   * https://dom.spec.whatwg.org/#interface-documenttype
   */

  /*
   * https://dom.spec.whatwg.org/#dom-documenttype-name
   */
  public var name(default, null): DOMString;

  /*
   * https://dom.spec.whatwg.org/#dom-documenttype-publicid
   */
  public var publicId(default, null): DOMString;

  /*
   * https://dom.spec.whatwg.org/#dom-documenttype-systemid
   */
  public var systemId(default, null): DOMString;

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

  public function new(name: DOMString, publicId: DOMString, systemId: DOMString) {
    super();
    this.name = name;
    this.publicId = publicId;
    this.systemId = systemId;
    this.nodeType = Node.DOCUMENT_TYPE_NODE;
  }
}
