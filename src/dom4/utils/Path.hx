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
 * Portions created by the Initial Developer are Copyright (C) 2015
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

package dom4.utils;

class Path {

  inline public static var SLASH     = "/";
  inline public static var BACKSLASH = "\\";

  private var mArray: Array<String> = [];

  /*
   * Attributes
   */
  public var separator(default, null): String;

  public var parent(get, null): Path;
    private function get_parent(): Path {
      var p = this.clone();
      if (p.mArray.length > 0) {
        p.mArray.pop();
        return p;
      }
      return null;
    }

  public var leafName(get, null): String;
    private function get_leafName(): String {
      return (this.mArray.length > 0
              ? this.mArray[this.mArray.length - 1]
              : "");
    }

  public var extension (get, null): String;
    private function get_extension(): String {
      var leafName = this.leafName;
      var periodIndex = leafName.lastIndexOf(".");
      return (-1 != periodIndex
              ? leafName.substr(periodIndex + 1)
              : leafName);
    }

  /*
   * Constructor
   */
  public function new(s: String) {
    var s1 = s.lastIndexOf(Path.SLASH);
    var s2 = s.lastIndexOf(Path.BACKSLASH);
    if (-1 == s1 && -1 == s2) {
      this.mArray = [s];
      return;
    }

    if (s1 == -1 && s2 != -1)
      this.separator = s.charAt(s2);
    else if (s2 == -1 && s1 != -1)
      this.separator = s.charAt(s1);
    else
      throw "Path (constructor): string cannot contain both slash and backslash";

    this.mArray = s.split(this.separator);
  }

  /*
   * Methods
   */
  public function append(s: String): Void {
    var s1 = s.lastIndexOf(Path.SLASH);
    var s2 = s.lastIndexOf(Path.BACKSLASH);
    if (-1 != s1 || -1 != s2)
      throw "Path.append(): string cannot contain a slash or a backslash";
    this.mArray.push(s);
  }

  public function appendRelativePath(s: String): Void {
    var s1 = s.lastIndexOf(Path.SLASH);
    var s2 = s.lastIndexOf(Path.BACKSLASH);
    if (-1 == s1 && -1 == s2) {
      this.mArray.push(s);
      return;
    }

    var separator = "";
    if (s1 == -1 && s2 != -1)
      separator = s.charAt(s2);
    else if (s2 == -1 && s1 != -1)
      separator = s.charAt(s1);
    else
      throw "Path.appendRelativePath(): string cannot contain both slash and backslash";

    this.mArray = this.mArray.concat(s.split(separator));
  }

  public function normalize(): Void {
    /* in Javascript, this would be simpler. But since Array.filter()
     * and Array.map() in Haxe only take a T -> Bool instead of a
     * T, UInt, Array<T> -> Bool, I can't make it that simple.
     * Bummer...
     *
        this.mArray = this.mArray.filter(function(x, index, a) {
          return (x != "." &&
                  x != ".." &&
                  (index >= a.length - 1 || a[index + 1] != ".."));
        });
     */

    var resultArray: Array<String> = [];
    for (i in 0...this.mArray.length) {
      var s = this.mArray[i];
      if (s != "." &&
          s != ".." &&
          (i >= this.mArray.length - 1 || this.mArray[i + 1] != ".."))
        resultArray.push(s);
    }
    this.mArray = resultArray;
  }

  @:to public function toString(): String {
    return this.mArray.join(this.separator);
  }

  @:from static public function fromString(s:String): Path {
    return new Path(s);
  }

  public function clone(): Path {
    return (new Path(this.toString()));
  }

  public function equals(path: Path): Bool {
    if (this.mArray.length != path.mArray.length)
      return false;
   for (i in 0...this.mArray.length) {
      if (this.mArray[i] != path.mArray[i])
        return false;
    }
    return true;
  }

  public function contains(path: Path): Bool {
    while (null != path) {
      path = path.parent;
      if (null != path && this.equals(path))
        return true;
    }
    return false;
  }

  public function makeRelativePath(basePath: Path): String {
    var commonAncestorIndex = 0;
    while (this.mArray[commonAncestorIndex] == basePath.mArray[commonAncestorIndex])
      commonAncestorIndex++;

    var rv = [for (i in 0...basePath.mArray.length - commonAncestorIndex) ".."];

    for (i in commonAncestorIndex...this.mArray.length)
      rv.push(this.mArray[i]);

    return rv.join("/");
  }

  @:arrayAccess public inline function __get(index:UInt) return this.mArray[index];

}
