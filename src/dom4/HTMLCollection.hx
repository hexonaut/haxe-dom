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

class HTMLCollection implements ArrayAccess<Element> {

  /*
   * https://dom.spec.whatwg.org/#interface-htmlcollection
   */

  private var elements: Array<Element>;
  public var _elements(get, null): Array<Element>;
      private function get__elements(): Array<Element> {
        return this.elements;
      }

  /*
   * https://dom.spec.whatwg.org/#dom-htmlcollection-length
   */
  public var length(get, null): UInt;
      private function get_length(): UInt
      {
        return this.elements.length;
      }

  /*
   * https://dom.spec.whatwg.org/#dom-htmlcollection-item
   */
  public function item(index: UInt): Element
  {
    return (index >= this.length) ? null : this.elements[index];
  }

  /*
   * https://dom.spec.whatwg.org/#dom-htmlcollection-nameditem
   * 
   */
  public function namedItem(name: DOMString): Element
  {
    var matching = this.elements.filter(function(f) {
      return (f.getAttribute("id") == name || f.getAttribute("name") == name);
    });
    if (matching.length != 0)
      return matching[0];
    return null;
  }

  @:arrayAccess public inline function __get(key:UInt) return this.item(key);

  public function new(?collection: Array<Element>)
  {
    this.elements = (collection != null) ? collection : (new Array());
  }
}
