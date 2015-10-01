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

typedef MutationObserverInit = {
	
	/**
	 * Set to true if additions and removals of the target node's child elements (including text nodes) are to be observed.
	 */
	?childList:Bool,
	
	/**
	 * Set to true if mutations to target's attributes are to be observed.
	 */
	?attributes:Bool,
	
	/**
	 * Set to true if mutations to target's data are to be observed.
	 */
	?characterData:Bool,
	
	/**
	 * Set to true if mutations to not just target, but also target's descendants are to be observed.
	 */
	?subtree:Bool,
	
	/**
	 * Set to true if attributes is set to true and target's attribute value before the mutation needs to be recorded.
	 */
	?attributeOldValue:Bool,
	
	/**
	 * Set to true if characterData is set to true and target's data before the mutation needs to be recorded.
	 */
	?characterDataOldValue:Bool,
	
	/**
	 * Set to an array of attribute local names (without namespace) if not all attribute mutations need to be observed.
	 */
	?attributeFilter:Array<String>
	
};

class MutationObserver {
	
	/**
	 * https://dom.spec.whatwg.org/#mutation-observers
	 */
	
	var callback:Array<MutationRecord> -> MutationObserver -> Void;
	var nodes:Array<Node>;
	var records:Array<MutationRecord>;
	
	public function new (callback:Array<MutationRecord> -> MutationObserver -> Void) {
		this.callback = callback;
		this.nodes = [];
		this.records = [];
	}
	
	public function observe (target:Node, options:MutationObserverInit):Void {
		if (options.childList == null) options.childList = false;
		if (options.subtree == null) options.subtree = false;
		
		//1.
		if (options.attributes == null && (options.attributeFilter != null || options.attributeOldValue != null))
			options.attributes = true;
		
		//2.
		if (options.characterData == null && options.characterDataOldValue != null)
			options.characterData = true;
		
		//3.
		if (options.attributes != true && options.childList != true && options.characterData != true)
			throw (new DOMException("TypeError"));
		
		//4.
		if (options.attributeOldValue == true && options.attributes == false)
			throw (new DOMException("TypeError"));
		
		//5.
		if (options.attributeFilter != null && options.attributes == false)
			throw (new DOMException("TypeError"));
		
		//6.
		if (options.characterDataOldValue == true && options.characterData == false)
			throw (new DOMException("TypeError"));
		
		for (i in target.mutationObservers) {
			if (i.observer == this) {
				//Already exists on node
				i.options = options;
				return;
			}
		}
		
		//Add to node observers
		target.mutationObservers.push( { observer:this, options:options } );
		nodes.push(target);
	}
	
	public function disconnect ():Void {
		for (i in nodes) {
			for (o in 0 ... i.mutationObservers.length) {
				if (i.mutationObservers[o].observer == this) {
					i.mutationObservers.splice(o, 1);
					
					break;
				}
			}
		}
		this.nodes = [];
		this.records = [];
	}
	
	public function takeRecords ():Array<MutationRecord> {
		var _records = this.records;
		this.records = [];
		return _records;
	}
	
	@:allow(dom4.utils.MutationUtils)
	function enqueueRecord (record:MutationRecord):Void {
		//Just fire off the event right away because there is no event loop
		callback([record], this);
	}
	
}
