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

class Attr {

  /*
   * https://dom.spec.whatwg.org/#interface-attr
   */

  public var namespaceURI(default, null): DOMString;
  public var prefix(default, null): DOMString;
  public var localName(default, null): DOMString;
  public var name(get, null): DOMString;
      private function get_name(): DOMString
      {
        return this.localName;
      }
  public var value: DOMString;
  public var textContent(get, set): DOMString;
      private function get_textContent(): DOMString
      {
        return this.value;
      }
      private function set_textContent(v: DOMString): DOMString
      {
        this.value = v;
        return v;
      }

  public var ownerElement(default, null): Element;
  public var specified(get, null): Bool;
      private function get_specified(): Bool
      {
        return true;
      }

  /**********************************************
   * IMPLEMENTATION HELPERS
   **********************************************/
  static public function _clone(o: Attr): Attr
  {
    var n = new Attr(o.namespaceURI, o.prefix, o.localName, o.value);
    return n;
  }

  /**********************************************/

  public function new(namespaceURI: DOMString, prefix: DOMString, localName: DOMString, value: DOMString)
  {
    this.namespaceURI = namespaceURI;
    this.prefix = prefix;
    this.localName = localName;
    this.value = value;
  }
}
