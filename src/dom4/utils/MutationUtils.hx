/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of parent file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use parent file except in compliance with
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
 * Alternatively, the contents of parent file may be used under the terms of
 * either of the GNU General Public License Version 2 or later (the "GPL"),
 * or the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of parent file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of parent file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of parent file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */

package dom4.utils;

class MutationUtils {

  /**********************************************
   * IMPLEMENTATION HELPERS
   **********************************************/

  /**********************************************
   * HELPERS DEFINED BY SPECIFICATION
   **********************************************/

  static public function queueMutationRecord(target: Node, type: DOMString, name: DOMString, namespace: DOMString,
                                            oldValue: DOMString,
                                            addedNodes: Array<Node>, removedNodes: Array<Node>,
                                            previousSibling: Node, nextSibling: Node) : Void
  {
	if (addedNodes == null) addedNodes = [];
	if (removedNodes == null) removedNodes = [];
	
	/**
	 * https://dom.spec.whatwg.org/#mutation-observers
	 * 
	 * 4.3.2
	 */
	var interestedObservers = new Array<{observer:MutationObserver, ?oldValue:DOMString}>();
	var node = target;
	while (node != null) {
		for (i in node.mutationObservers) {
			//3.1
			if (node != target && !i.options.subtree)
				continue;
			
			//3.2
			if (type == "attributes" && !i.options.attributes)
				continue;
			
			//3.3
			if (type == "attributes" && (namespace != null || !Lambda.has(i.options.attributeFilter, name)))
				continue;
			
			//3.4
			if (type == "characterData" && !i.options.characterData)
				continue;
			
			//3.5
			if (type == "childList" && !i.options.childList)
				continue;
			
			//3.6/3.7
			var inclOldValue =
				(type == "attributes" && i.options.attributeOldValue) ||
				(type == "characterData" && i.options.characterDataOldValue);
			if (!Lambda.exists(interestedObservers, function (e) { return e.observer == i.observer; } ))
				interestedObservers.push({ observer:i.observer, oldValue:inclOldValue ? oldValue : null });
		}
		
		node = node.parentNode;
	}
	
	for (i in interestedObservers) {
		//Create MutationRecord
		var record:dom4.MutationRecord = {
			type: type,
			target: target,
			addedNodes: addedNodes,
			removedNodes: removedNodes,
			previousSibling: previousSibling,
			nextSibling: nextSibling,
			attributeName: name,
			attributeNamespace: namespace,
			oldValue: i.oldValue
		};
		
		i.observer.enqueueRecord(record);
	}
  }
}