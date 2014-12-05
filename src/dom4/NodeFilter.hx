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

/*
 * https://dom.spec.whatwg.org/#interface-nodefilter
 */

// Constants for acceptNode()
enum NodeFilterResponse {
  FILTER_ACCEPT;
  FILTER_REJECT;
  FILTER_SKIP;
}

// Constants for whatToShow
enum WhatToShowFlag {
  SHOW_ALL;
  SHOW_ELEMENT;
  SHOW_ATTRIBUTE;
  SHOW_TEXT;
  SHOW_CDATA_SECTION;
  SHOW_ENTITY_REFERENCE;
  SHOW_ENTITY;
  SHOW_PROCESSING_INSTRUCTION;
  SHOW_COMMENT;
  SHOW_DOCUMENT;
  SHOW_DOCUMENT_TYPE;
  SHOW_DOCUMENT_FRAGMENT;
  SHOW_NOTATION;
}

class FlagsWithAllState<T:EnumValue>
{
    var i:Int;

    public function new(?i=0)
    {
        this.i = i;
    }

    public inline function has( v : T ) : Bool {
        return i & (1 << ((Type.enumIndex(v) > 1) ? Type.enumIndex(v) - 1 : 0xFFFFFFFF)) != 0;
    }

    public inline function set( v : T ) : Void {
        i |= 1 << ((Type.enumIndex(v) > 1) ? Type.enumIndex(v) - 1 : 0xFFFFFFFF);
    }

    public inline function unset( v : T ) : Void {
        i &= 0xFFFFFFFF - (1 << ((Type.enumIndex(v) > 1) ? Type.enumIndex(v) - 1 : 0xFFFFFFFF));
    }

    public inline static function ofInt<T:EnumValue>( i : Int ) : FlagsWithAllState<T> {
        return new FlagsWithAllState<T>(i);
    }

    public inline function toInt() : Int {
        return i;
    }
}

interface NodeFilter {

  public function acceptNode(node: Node): NodeFilterResponse;
}
