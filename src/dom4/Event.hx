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
 * https://dom.spec.whatwg.org/#concept-event
 */

class Event {

  public var stopPropagationFlag: Bool;
  public var stopImmediatePropagationFlag: Bool;
  public var canceledFlag: Bool;
  public var initializedFlag: Bool;
  public var dispatchFlag: Bool;
  
  public var type(default, null): DOMString;
  public var target(default, null): EventTarget;
  public var currentTarget(default, null): EventTarget;
      public function set_currentTarget(v: EventTarget): EventTarget
      {
        this.currentTarget = v;
        return v;
      }

  public var NONE = 0;
  public var CAPTURING_PHASE = 1;
  public var AT_TARGET = 2;
  public var BUBBLING_PHASE = 3;
  public var eventPhase(default, null): UInt;

  /*
   * https://dom.spec.whatwg.org/#dom-event-stoppropagation
   */
  public function stopPropagation(): Void
  {
    this.stopPropagationFlag = true;
  }

  /*
   * https://dom.spec.whatwg.org/#dom-event-stopimmediatepropagation
   */
  public function stopImmediatePropagation(): Void
  {
    this.stopPropagationFlag = true;
    this.stopImmediatePropagationFlag = true;
  }
  

  public var bubbles(default, null): Bool;
  public var cancelable(default, null): Bool;

  /*
   * https://dom.spec.whatwg.org/#dom-event-preventdefault
   */
  public function preventDefault(): Void
  {
    if (this.cancelable)
      this.canceledFlag = true;
  }
  public var defaultPrevented(get, null): Bool;
      private function get_defaultPrevented(): Bool
      {
        return this.canceledFlag;
      }

  public var isTrusted(default, null): Bool;
      public function set_isTrusted(v: Bool): Bool
      {
        this.isTrusted = v;
        return v;
      }
  public var timeStamp(default, null): DOMTimeStamp;

  public function initEvent(type: DOMString, bubbles: Bool, cancelable: Bool): Void
  {
    if (this.dispatchFlag)
      return;
    this.type = type;
    this.bubbles = bubbles;
    this.cancelable = cancelable;

    this.stopPropagationFlag = false;
    this.stopImmediatePropagationFlag = false;
    this.canceledFlag = false;
    this.initializedFlag = true;
    this.dispatchFlag = false;

    this.isTrusted = false;
    this.target = null;

    this.timeStamp =  Math.floor((Date.now()).getTime());
  }

  /*
   * https://dom.spec.whatwg.org/#concept-event-dispatch
   */
  static public function dispatch(event: Event, target: EventTarget, ?targetOverride: EventTarget = null): Bool
  {
    // STEP 2
    event.dispatchFlag = true;
    // STEP 3
    if (targetOverride != null)
      event.target = targetOverride;
    else
      event.target = target;
    // STEP 4
    var ancestors: Array<Node> = [];
    var node = cast(event.target, Node);
    while (node != null) {
      ancestors.push(node);
      node = node.parentNode;
    }
    // STEP 5
    event.eventPhase = event.CAPTURING_PHASE;
    // STEP 6
    var i = ancestors.length - 1;
    while (i > 0) {
      if (!event.stopPropagationFlag)
        ancestors[i]._invokeListeners(event);
      i--;
    }
    // STEP 7
    event.eventPhase = event.AT_TARGET;
    // STEP8
    if (!event.stopPropagationFlag)
      cast(event.target, Node)._invokeListeners(event);

    // STEP 9
    if (event.bubbles) {
      // STEP 9.2
      event.eventPhase = event.BUBBLING_PHASE;
      i = 1;
      // STEP 9.3
      while (i < ancestors.length) {
        if (!event.stopPropagationFlag)
          ancestors[i]._invokeListeners(event);
        i++;
      }
    }
    // STEP 10
    event.dispatchFlag = false;
    event.eventPhase = event.NONE;
    event.currentTarget = null;

    return !event.canceledFlag;
  }

  public function new(type: DOMString, ?bubbles: Bool = false, ?cancelable: Bool = false)
  {
    this.type = type;
    this.bubbles = bubbles;
    this.cancelable = cancelable;

    this.stopPropagationFlag = false;
    this.stopImmediatePropagationFlag = false;
    this.canceledFlag = false;
    this.initializedFlag = true;
    this.dispatchFlag = false;

    this.isTrusted = false;
    this.target = null;

    this.timeStamp = Math.floor((Date.now()).getTime());
  }
}
