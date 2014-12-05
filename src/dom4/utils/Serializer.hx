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
 
package dom4.utils;

using StringTools;

class Serializer
{
  private var wrap: Bool = false;
  private var maxColumns: UInt = 80;
  private var indentation: Bool = false;

  private var NOT_WHITESPACE_ONLY_EREG = new EReg("[^ \t\r\n]", "g");
  private var TRIM_LEADING_TRAILING_CRS_EREG = new EReg("^[\r\n \t]*([^\r\n]*)[\r\n \t]*$", "");
  private var COALESCE_WHITESPACES_EREG = new EReg("[ \t\r\n]+", "g");

  private function addString(node:Node, str: String, toBeAdded: String, indent: String): String
  {
    // should we add a trailing return?
    var addedCR = (str.fastCodeAt(str.length - 1) == '\n'.code);

    if (this.indentation) {
      switch (node.nodeType) {
        case Node.DOCUMENT_TYPE_NODE:
          // do not pretty-print or wrap
          str += toBeAdded;
        case Node.TEXT_NODE:
          if (node.parentNode != null
              && node.parentNode.nodeType == Node.ELEMENT_NODE
              && (node.parentNode.nodeName == "STYLE"
                  || node.parentNode.nodeName == "SCRIPT"
                  || node.parentNode.nodeName == "PRE")) {
            // special case, do NOT wrap or pretty-print
            str += StringTools.htmlEscape(toBeAdded);
          }
          else { // just the regular text in a rgular element
            if (!this.NOT_WHITESPACE_ONLY_EREG.match(toBeAdded)) {
              // only whitespace, do nothing
              return str;
            }
            // alone in its parent element ?
            if (node.parentNode != null
                && ((node.parentNode.nodeType == Node.ELEMENT_NODE
                     && cast(node.parentNode, Element).firstElementChild != null)
                    || node.parentNode.nodeType != Node.ELEMENT_NODE)) {
              // no, not alone
              if (!addedCR)
                str += "\n";
              str += indent;
            }

            if (this.wrap) {
              toBeAdded = this.COALESCE_WHITESPACES_EREG.replace(toBeAdded, " ");
              while (toBeAdded.length != 0) {
                var lastCR = str.lastIndexOf("\n");
                var length = str.length - lastCR;
                if (length + toBeAdded.length > this.maxColumns) {
                  var lastSpace = toBeAdded.lastIndexOf(" ", this.maxColumns - length);
                  str += StringTools.trim(toBeAdded.substr(0, lastSpace)) + "\n" + indent;
                  toBeAdded = toBeAdded.substring(lastSpace + 1);
                  addedCR = true;
                }
                else {
                  str += StringTools.trim(StringTools.htmlEscape(toBeAdded));
                  toBeAdded = "";
                }
              }
            }
            else
              str += StringTools.trim(StringTools.htmlEscape(toBeAdded));
          }
        case Node.ELEMENT_NODE:
          // that's for attribute pretty-printing
          if (this.wrap) {
            var lastCR = str.lastIndexOf("\n");
            var length = str.length - lastCR;
            if (!addedCR && length + toBeAdded.length > this.maxColumns) {
              str += "\n";
              addedCR = true;
            }
          }
          if (!addedCR)
            str += "\n";
          str += indent + toBeAdded;
      }
    }
    else {
      // raw mode
      str += StringTools.htmlEscape(toBeAdded);
    }

    return str;
  }

  public function serializeToString(document: Document): String
  {
    var str = "";
    var node: Node = document;
    var indent = "";

    while (true) {
      var toBeAdded = "";
      switch (node.nodeType) {

        case Node.DOCUMENT_TYPE_NODE:
          var dt = cast(node, DocumentType);
          toBeAdded += "<!DOCTYPE " + dt.name;
          if (dt.publicId != "")
            toBeAdded += " PUBLIC \"" + dt.publicId + "\"";
          if (dt.systemId != "")
            toBeAdded += " SYSTEM \"" + dt.systemId + "\"";
          toBeAdded += ">";

        case Node.TEXT_NODE:
          toBeAdded = cast(node, Text).data;

        case Node.COMMENT_NODE:
          toBeAdded += "<!--" + cast(node, Comment).data + "-->";

        case Node.PROCESSING_INSTRUCTION_NODE:
          var pi = cast(node, ProcessingInstruction);
          toBeAdded += "<?" + pi.target + " " + pi.data + "?>";

        case Node.ELEMENT_NODE:
          var prefix = cast(node, Element).prefix;
          if (node.parentNode != null
              && node.parentNode.nodeType == Node.ELEMENT_NODE
              && prefix == cast(node.parentNode, Element).prefix)
            prefix = "";
          toBeAdded = "<";
          toBeAdded += ((prefix != "") ? prefix + ":" : "") + cast(node, Element).localName;
          var elt = cast(node, Element);
          var l = toBeAdded.length + 1;
          for (i in 0...elt.attributes.length) {
            var attr = elt.attributes.item(i);
            var attrStr = " " + ((attr.prefix != "" && attr.prefix != null) ? attr.prefix + ":" : "") + attr.name + "=\"" + StringTools.htmlEscape(attr.value, true) + "\"";
            if (i != 0 && this.wrap && attrStr.length + toBeAdded.length > this.maxColumns) {
              toBeAdded += "\n";
              for (j in 0...l + (this.indentation ? indent.length : 0))
                toBeAdded += " ";
            }
            toBeAdded += attrStr;
          }
          if (node.firstChild == null) {
            toBeAdded += " />";
          }
          else
           toBeAdded += ">";
      }

      str = this.addString(node, str, toBeAdded, indent);

      if (null != node.firstChild) {
        node = node.firstChild;
        if (this.indentation
            && node.parentNode.nodeType == Node.ELEMENT_NODE) {
          indent += "  ";
        }
      }
      else if (null != node.nextSibling)
        node = node.nextSibling;
      else if (null == node.parentNode)
        break;
      else {
        while (null == node.nextSibling
               && null != node.parentNode
               && node.parentNode.nodeType == Node.ELEMENT_NODE) {
          node = node.parentNode;
          if (this.indentation) {
            indent = indent.substr(2);
            if (cast(node, Element).firstElementChild != null)
              str += "\n" + indent;
          }
          var prefix = cast(node, Element).prefix;
          str += "</" + ((prefix != "") ? prefix + ":" : "") + cast(node, Element).localName + ">";
        }
        node = node.nextSibling;
        if (null == node)
          break;
      }
    }
    return str;
  }

  public function enableWrapping(?maxColumns: UInt = 80): Void
  {
    this.wrap = true;
    this.maxColumns = maxColumns;
  }

  public function enableIndentation(): Void
  {
    this.indentation = true;
  }

  public function reset(): Void
  {
    this.wrap = false;
    this.indentation = false;
  }

  public function new() {}
}
