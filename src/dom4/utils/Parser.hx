/*
 * Copyright (C)2005-2012 Haxe Foundation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
package dom4.utils;

using StringTools;

/* poor'man enum : reduce code size + a bit faster since inlined */
extern private class S {
  public static inline var IGNORE_SPACES   = 0;
  public static inline var BEGIN           = 1;
  public static inline var BEGIN_NODE      = 2;
  public static inline var TAG_NAME        = 3;
  public static inline var BODY            = 4;
  public static inline var ATTRIB_NAME     = 5;
  public static inline var EQUALS          = 6;
  public static inline var ATTVAL_BEGIN    = 7;
  public static inline var ATTRIB_VAL      = 8;
  public static inline var CHILDS          = 9;
  public static inline var CLOSE           = 10;
  public static inline var WAIT_END        = 11;
  public static inline var WAIT_END_RET    = 12;
  public static inline var PCDATA          = 13;
  public static inline var PI_TARGET       = 14;
  public static inline var PI_DATA         = 15;
  public static inline var COMMENT         = 16;
  public static inline var DOCTYPE         = 17;
  public static inline var CDATA           = 18;
  public static inline var ESCAPE          = 19;
}

class Parser
{
  private var contentSink: ContentSink;
  private var NOT_WHITESPACE_ONLY_EREG = new EReg("[^ \t\r\n]", "g");

  var document: Document;

  var elementPrefix = "";
  var elementName = "";
  var attributesArray: Array<Array<DOMString>>= [];

  static var escapes = {
    var h = new haxe.ds.StringMap();
    h.set("lt", "<");
    h.set("gt", ">");
    h.set("amp", "&");
    h.set("quot", '"');
    h.set("apos", "'");
    h.set("nbsp", String.fromCharCode(160));
    h;
  }

  public function parse(str:String)
  {
    document = new Document();
    doParse(str, 0, cast(document, Node));
    return document;
  }

  public function doFinalizeElement(element: Element): Void
  {
    this.contentSink.finalizeElement(element);
  }

  public function doCreateElement(parent: Node): Node
  {
    if (parent == null
        || this.elementName == ""
        || this.elementName == null)
      return parent;
    var namespace = null;
    // first, validate the element prefix if we have to
    if (this.elementPrefix != "") {
      var namespaceDef = this.attributesArray.filter(function(n) {
        return (n[0] == "xmlns" && n[1] == this.elementPrefix);
      });
      if (namespaceDef.length == 1) {
        namespace = namespaceDef[0][2];
      }
      else { // no luck, look for the prefix on the ancestors
        namespace = cast(parent, Node)._locateNamespace(this.elementPrefix);
      }
      if (namespace == null || namespace == "") // unresolved prefix, this is an error
        throw (new DOMException("NamespaceError"));
    }
    else {
      if (parent.nodeType == Node.ELEMENT_NODE)
        namespace = cast(parent, Element).namespaceURI;
      else {
        // case of the root element if the context document is known as a HTML document
        if (document.doctype != null && document.doctype.name == "html")
          namespace = Namespaces.HTML_NAMESPACE;
      }
    }

    var xml = this.contentSink.createElement(document, namespace,
                  ((namespace == Namespaces.HTML_NAMESPACE)
                   ? this.elementName.toLowerCase()
                   : this.elementName));
    parent.appendChild(xml);
    // we can't rely on prefix/namespace validation here because
    // the xmlns attributes are possibly not here yet...
    if (this.elementPrefix != "")
      cast(xml, Element)._setPrefix(this.elementPrefix);

    // don't forget the attributes
    for (attribute in this.attributesArray) {
      var prefix = attribute[0];
      var name   = attribute[1];
      var value  = attribute[2];
      if (prefix == "") {
        xml.setAttribute(name, value);
        if (name == "xmlns") {
          if (this.elementPrefix != "")
            throw (new DOMException("NamespaceError"));
          cast(xml, Element)._setNamespaceURI(value);
        }
      }
      else {
        var namespace = cast(xml, Node)._locateNamespace(prefix);
        xml.setAttributeNS(namespace, (prefix != "" ? prefix + ":" : "") + name, value);
      }
    }
    this.contentSink.postCreateElement(xml);

    this.elementName = null;
    return xml;
  }

  private function doParse(str:String, p:Int = 0, ?parent:Node):Int
  {
    var xml:Node = null;
    var state = S.BEGIN;
    var next = S.BEGIN;
    var aname = null;
    var start = 0;
    var nsubs = 0;
    var nbrackets = 0;
    var c = str.fastCodeAt(p);
    var buf = new StringBuf();

    while (!StringTools.isEof(c))
    {
      switch(state)
      {
        case S.IGNORE_SPACES:
          switch(c)
          {
            case
              '\n'.code,
              '\r'.code,
              '\t'.code,
              ' '.code:
            default:
              state = next;
              continue;
          }
        case S.BEGIN:
          switch(c)
          {
            case '<'.code:
              state = S.IGNORE_SPACES;
              next = S.BEGIN_NODE;
            default:
              start = p;
              state = S.PCDATA;
              continue;
          }
        case S.PCDATA:
          if (c == '<'.code)
          {
            var toStore = buf.toString() + str.substr(start, p - start);
            if (parent.nodeType == Node.ELEMENT_NODE) {
              var child = document.createTextNode(toStore);
              parent.appendChild(child);
            }
            else if (this.NOT_WHITESPACE_ONLY_EREG.match(toStore))
              throw (new DOMException("HierarchyRequestError"));
            buf = new StringBuf();
            nsubs++;
            state = S.IGNORE_SPACES;
            next = S.BEGIN_NODE;
          }
          else if (c == '&'.code) {
            buf.addSub(str, start, p - start);
            state = S.ESCAPE;
            next = S.PCDATA;
            start = p + 1;
          }
        case S.CDATA:
          if (c == ']'.code && str.fastCodeAt(p + 1) == ']'.code && str.fastCodeAt(p + 2) == '>'.code)
          {
            var child = document.createTextNode(str.substr(start, p - start));
            parent.appendChild(child);
            nsubs++;
            p += 2;
            state = S.BEGIN;
          }
        case S.BEGIN_NODE:
          switch(c)
          {
            case '!'.code:
              if (str.fastCodeAt(p + 1) == '['.code)
              {
                p += 2;
                if (str.substr(p, 6).toUpperCase() != "CDATA[")
                  throw("Expected <![CDATA[");
                p += 5;
                state = S.CDATA;
                start = p + 1;
              }
              else if (str.fastCodeAt(p + 1) == 'D'.code || str.fastCodeAt(p + 1) == 'd'.code)
              {
                if(str.substr(p + 2, 6).toUpperCase() != "OCTYPE")
                  throw("Expected <!DOCTYPE");
                p += 8;
                state = S.DOCTYPE;
                start = p + 1;
              }
              else if( str.fastCodeAt(p + 1) != '-'.code || str.fastCodeAt(p + 2) != '-'.code )
                throw("Expected <!--");
              else
              {
                p += 2;
                state = S.COMMENT;
                start = p + 1;
              }
            case '?'.code:
              state = S.PI_TARGET;
              start = p;
            case '/'.code:
              if( parent == null )
                throw("Expected node name");
              start = p + 1;
              state = S.IGNORE_SPACES;
              next = S.CLOSE;
            default:
              state = S.TAG_NAME;
              start = p;
              continue;
          }
        case S.TAG_NAME:
          if (!isValidChar(c))
          {
            this.elementName = "";
            this.elementPrefix = "";
            if( p == start )
              throw("Expected node name");
            var name = str.substr(start, p - start);
            var match = Namespaces.PREFIXED_NAME_EREG.match(name);
            if ( match ) {
              this.attributesArray = [];
              if (null == Namespaces.PREFIXED_NAME_EREG.matched(3)) {
                this.elementName = name;
              }
              else {
                this.elementName   = Namespaces.PREFIXED_NAME_EREG.matched(3);
                this.elementPrefix = Namespaces.PREFIXED_NAME_EREG.matched(1);
              }
            }
            else
              throw (new DOMException("InvalidCharacterError"));
            // parent.appendChild(xml);
            state = S.IGNORE_SPACES;
            next = S.BODY;
            continue;
          }
        case S.BODY:
          switch(c)
          {
            case '/'.code:
              state = S.WAIT_END;
              nsubs++;
            case '>'.code:
              xml = doCreateElement(parent);
              state = S.CHILDS;
              nsubs++;
            default:
              state = S.ATTRIB_NAME;
              start = p;
              continue;
          }
        case S.ATTRIB_NAME:
          if (!isValidChar(c))
          {
            var tmp;
            if( start == p )
              throw("Expected attribute name");
            tmp = str.substr(start,p-start);
            aname = tmp;
            /*if( cast(xml, Element).hasAttribute(aname) )
              throw("Duplicate attribute");*/
            state = S.IGNORE_SPACES;
            next = S.EQUALS;
            continue;
          }
        case S.EQUALS:
          switch(c)
          {
            case '='.code:
              state = S.IGNORE_SPACES;
              next = S.ATTVAL_BEGIN;
            default:
              throw("Expected =");
          }
        case S.ATTVAL_BEGIN:
          switch(c)
          {
            case '"'.code, '\''.code:
              state = S.ATTRIB_VAL;
              start = p;
            default:
              throw("Expected \"");
          }
        case S.ATTRIB_VAL:
          if (c == str.fastCodeAt(start))
          {
            var val = str.substr(start+1,p-start-1);
            var match = Namespaces.PREFIXED_NAME_EREG.match(aname);
            if ( match ) {
              if (null == Namespaces.PREFIXED_NAME_EREG.matched(3)) {
                this.attributesArray.push(["", aname, val]);
              }
              else {
                this.attributesArray.push([Namespaces.PREFIXED_NAME_EREG.matched(1), Namespaces.PREFIXED_NAME_EREG.matched(3), val]);
              }
            }
            else
              throw (new DOMException("InvalidCharacterError"));

            state = S.IGNORE_SPACES;
            next = S.BODY;
          }
        case S.CHILDS:
          p = doParse(str, p, xml);
          start = p;
          state = S.BEGIN;
        case S.WAIT_END:
          switch(c)
          {
            case '>'.code:
              xml = doCreateElement(parent);
              doFinalizeElement(cast(xml, Element));
              state = S.BEGIN;
            default :
              throw("Expected >");
          }
        case S.WAIT_END_RET:
          switch(c)
          {
            case '>'.code:
              xml = doCreateElement(parent);
              if (this.elementName == "" || this.elementName == null)
                doFinalizeElement(cast(parent, Element));
              if( nsubs == 0 && parent.nodeType == Node.ELEMENT_NODE)
                parent.appendChild(document.createTextNode(""));
              return p;
            default :
              throw("Expected >");
          }
        case S.CLOSE:
          if (!isValidChar(c))
          {
            if( start == p )
              throw("Expected node name");

            var v = str.substr(start,p - start);
            var match = Namespaces.PREFIXED_NAME_EREG.match(v);
            if ( match ) {
              if (null == Namespaces.PREFIXED_NAME_EREG.matched(3)) {
                // no prefix found
                if (v != cast(parent, Element).localName) {
                  throw (new DOMException("Expected </" +parent.nodeName + ">"));
                }
              }
              else {
                var prefix = Namespaces.PREFIXED_NAME_EREG.matched(1);
                var nmsp = cast(parent, Node)._locateNamespace(prefix);
                if (nmsp != cast(parent, Element).namespaceURI)
                  throw (new DOMException("Expected </" +parent.nodeName + ">"));
              }
            }
            else
              throw (new DOMException("InvalidCharacterError"));

            state = S.IGNORE_SPACES;
            next = S.WAIT_END_RET;
            continue;
          }
        case S.COMMENT:
          if (c == '-'.code && str.fastCodeAt(p +1) == '-'.code && str.fastCodeAt(p + 2) == '>'.code)
          {
            parent.appendChild(document.createComment(str.substr(start, p - start)));
            p += 2;
            state = S.BEGIN;
          }
        case S.DOCTYPE:
          if(c == '['.code)
            nbrackets++;
          else if(c == ']'.code)
            nbrackets--;
          else if (c == '>'.code && nbrackets == 0)
          {
            parent.appendChild(document.implementation.createDocumentType(str.substr(start, p - start), "", ""));
            state = S.BEGIN;
          }
        case S.PI_TARGET:
          if (!isValidChar(c))
          {
            p++;
            aname = str.substr(start + 1, p - start - 2);
            start = p - 1;
            state = S.IGNORE_SPACES;
            next = S.PI_DATA;
          }
        case S.PI_DATA:
          if (c == '?'.code && str.fastCodeAt(p + 1) == '>'.code)
          {
            p++;
            var str = str.substr(start + 1, p - start - 2);
            parent.appendChild(document.createProcessingInstruction(aname, str));
            state = S.BEGIN;
          }
        case S.ESCAPE:
          if (c == ';'.code)
          {
            var s = str.substr(start, p - start);
            if (s.fastCodeAt(0) == '#'.code) {
              var i = s.fastCodeAt(1) == 'x'.code
                ? Std.parseInt("0" +s.substr(1, s.length - 1))
                : Std.parseInt(s.substr(1, s.length - 1));
              buf.add(String.fromCharCode(i));
            } else if (!escapes.exists(s))
              buf.add('&$s;');
            else
              buf.add(escapes.get(s));
            start = p + 1;
            state = next;
          }
      }
      c = str.fastCodeAt(++p);
    }

    if (state == S.BEGIN)
    {
      start = p;
      state = S.PCDATA;
    }

    if (state == S.PCDATA)
    {
      if (p != start || nsubs == 0) {
        parent.appendChild(document.createTextNode(buf.toString() + str.substr(start, p - start)));
      }
      return p;
    }

    throw (new DOMException("Unexpected end error"));
  }

  static inline function isValidChar(c) {
    return (c >= 'a'.code && c <= 'z'.code) || (c >= 'A'.code && c <= 'Z'.code) || (c >= '0'.code && c <= '9'.code) || c == ':'.code || c == '.'.code || c == '_'.code || c == '-'.code;
  }

  public function new(contentSink: ContentSink) {
    this.contentSink = contentSink;
  }
}