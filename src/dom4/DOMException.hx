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

class DOMException {

  private static inline var INDEX_SIZE_ERR = 1;
  private static inline var HIERARCHY_REQUEST_ERR = 3;
  private static inline var WRONG_DOCUMENT_ERR = 4;
  private static inline var INVALID_CHARACTER_ERR = 5;
  private static inline var NO_MODIFICATION_ALLOWED_ERR = 7;
  private static inline var NOT_FOUND_ERR = 8;
  private static inline var NOT_SUPPORTED_ERR = 9;
  private static inline var INUSE_ATTRIBUTE_ERR = 10;
  private static inline var INVALID_STATE_ERR = 11;
  private static inline var SYNTAX_ERR = 12;
  private static inline var INVALID_MODIFICATION_ERR = 13;
  private static inline var NAMESPACE_ERR = 14;
  private static inline var INVALID_ACCESS_ERR = 15;
  private static inline var SECURITY_ERR = 18;
  private static inline var NETWORK_ERR = 19;
  private static inline var ABORT_ERR = 20;
  private static inline var URL_MISMATCH_ERR = 21;
  private static inline var QUOTA_EXCEEDED_ERR = 22;
  private static inline var TIMEOUT_ERR = 23;
  private static inline var INVALID_NODE_TYPE_ERR = 24;
  private static inline var DATA_CLONE_ERR = 25;

  private var ErrorNamesTable: Array<Array<Dynamic>> = [
    ["IndexSizeError", "The index is not in the allowed range.", INDEX_SIZE_ERR],
    ["HierarchyRequestError", "The operation would yield an incorrect node tree.",  HIERARCHY_REQUEST_ERR],
    ["WrongDocumentError", "The object is in the wrong document.", WRONG_DOCUMENT_ERR],
    ["InvalidCharacterError", "The string contains invalid characters.",  INVALID_CHARACTER_ERR ],
    ["NoModificationAllowedError", "The object can not be modified.",  NO_MODIFICATION_ALLOWED_ERR ],
    ["NotFoundError", "The object can not be found here.",  NOT_FOUND_ERR],
    ["NotSupportedError", "The operation is not supported.",  NOT_SUPPORTED_ERR],
    ["InUseAttributeError", "The attribute is in use.", INUSE_ATTRIBUTE_ERR],
    ["InvalidStateError", "The object is in an invalid state.", INVALID_STATE_ERR],
    ["SyntaxError", "The string did not match the expected pattern.", SYNTAX_ERR],
    ["InvalidModificationError", "The object can not be modified in this way.",  INVALID_MODIFICATION_ERR ],
    ["NamespaceError", "The operation is not allowed by Namespaces in XML.",  NAMESPACE_ERR ],
    ["InvalidAccessError", "The object does not support the operation or argument.", INVALID_ACCESS_ERR],
    ["SecurityError", "The operation is insecure.", SECURITY_ERR],
    ["NetworkError", "A network error occurred.",  NETWORK_ERR],
    ["AbortError", "The operation was aborted.", ABORT_ERR],
    ["URLMismatchError", "The given URL does not match another URL.",  URL_MISMATCH_ERR ],
    ["QuotaExceededError", "The quota has been exceeded.", QUOTA_EXCEEDED_ERR],
    ["TimeoutError", "The operation timed out.", TIMEOUT_ERR],
    ["InvalidNodeTypeError", "The supplied node is incorrect or has an incorrect ancestor for this operation.",  INVALID_NODE_TYPE_ERR],
    ["DataCloneError", "The object can not be cloned.",  DATA_CLONE_ERR ],
    ["EncodingError", "The encoding operation (either encoded or decoding) failed.", -1],
    ["NotReadableError", "The I/O read operation failed.", -1],
    ["UnknownError", "The operation failed for an unknown transient reason (e.g. out of memory).", -1],
    ["ConstraintError", "A mutation operation in a transaction failed because a constraint was not satisfied.", -1],
    ["DataError", "Provided data is inadequate.", -1],
    ["TransactionInactiveError", "A request was placed against a transaction which is currently not active, or which is finished.", -1],
    ["ReadOnlyError", "The mutating operation was attempted in a \"readonly\" transaction.", -1],
    ["VersionError", "An attempt was made to open a database using a lower version than the existing version.", -1],
    ["OperationError", "The operation failed for an operation-specific reason.", -1]
  ];

  public var name: DOMString;
  public var description: DOMString;
  public var code: Int;

  public function toString(): DOMString
  {
    var str = this.name;
    if (this.code != -1)
      str += " (" + this.code + ")";
    if (this.description != "")
      str += ": " + description;
    return str;
  }

  public function new(name: DOMString) {
    this.name = name;
    this.description = "";
    this.code = -1;

    for (exception in this.ErrorNamesTable)
      if (exception[0] == name) {
        this.description = exception[1];
        this.code = exception[2];
        return;
      }
  }
}

