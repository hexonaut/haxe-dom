package hxdom;

#if js
typedef NodeFilter = js.html.NodeFilter;
#else
class NodeFilter {
	
	/** Value returned by the <code><a rel="internal" href="https://developer.mozilla.org/Article_not_found?uri=en/DOM/NodeFilter.acceptNode" class="new">NodeFilter.acceptNode()</a></code>
 method when a node should be accepted. */
	public static inline var FILTER_ACCEPT:Int = 1;

	/** Value to be returned by the <code><a rel="internal" href="https://developer.mozilla.org/Article_not_found?uri=en/DOM/NodeFilter.acceptNode" class="new">NodeFilter.acceptNode()</a></code>
 method when a node should be rejected. The children of rejected nodes are not visited by the <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/NodeIterator">NodeIterator</a></code>
 or <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/TreeWalker">TreeWalker</a></code>
 object; this value is treated as "skip this node and all its children". */
	public static inline var FILTER_REJECT:Int = 2;

	/** Value to be returned by <code><a rel="internal" href="https://developer.mozilla.org/Article_not_found?uri=en/DOM/NodeFilter.acceptNode" class="new">NodeFilter.acceptNode()</a></code>
 for nodes to be skipped by the <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/NodeIterator">NodeIterator</a></code>
 or <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/TreeWalker">TreeWalker</a></code>
 object. The children of skipped nodes are still considered. This is treated as "skip this node but not its children". */
	public static inline var FILTER_SKIP:Int = 3;

	/** Shows all nodes. */
	public static inline var SHOW_ALL:Int = 0xFFFFFFFF;

	/** Shows attribute <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Attr">Attr</a></code>
 nodes. This is meaningful only when creating a <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/NodeIterator">NodeIterator</a></code>
 or <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/TreeWalker">TreeWalker</a></code>
 with an <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Attr">Attr</a></code>
 node as its root; in this case, it means that the attribute node will appear in the first position of the iteration or traversal. Since attributes are never children of other nodes, they do not appear when traversing over the document tree. */
	public static inline var SHOW_ATTRIBUTE:Int = 0x00000002;

	/** Shows <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/CDATASection">CDATASection</a></code>
&nbsp;nodes. */
	public static inline var SHOW_CDATA_SECTION:Int = 0x00000008;

	/** Shows <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Comment">Comment</a></code>
&nbsp;nodes. */
	public static inline var SHOW_COMMENT:Int = 0x00000080;

	/** Shows <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Document">Document</a></code>
&nbsp;nodes. */
	public static inline var SHOW_DOCUMENT:Int = 0x00000100;

	/** Shows <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/DocumentFragment">DocumentFragment</a></code>
&nbsp;nodes. */
	public static inline var SHOW_DOCUMENT_FRAGMENT:Int = 0x00000400;

	/** Shows <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/DocumentType">DocumentType</a></code>
&nbsp;nodes. */
	public static inline var SHOW_DOCUMENT_TYPE:Int = 0x00000200;

	/** Shows <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Element">Element</a></code>
&nbsp;nodes. */
	public static inline var SHOW_ELEMENT:Int = 0x00000001;

	/** Shows <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Entity">Entity</a></code>
&nbsp;nodes. This is meaningful only when creating a <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/NodeIterator">NodeIterator</a></code>
 or <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/TreeWalker">TreeWalker</a></code>
 with an <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Entity">Entity</a></code>
 node as its root; in this case, it means that the <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Entity">Entity</a></code>
 node will appear in the first position of the traversal. Since entities are not part of the document tree, they do not appear when traversing over the document tree. */
	public static inline var SHOW_ENTITY:Int = 0x00000020;

	/** Shows <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/EntityReference">EntityReference</a></code>
&nbsp;nodes. */
	public static inline var SHOW_ENTITY_REFERENCE:Int = 0x00000010;

	/** Shows <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Notation">Notation</a></code>
 nodes. This is meaningful only when creating a <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/NodeIterator">NodeIterator</a></code>
 or <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/TreeWalker">TreeWalker</a></code>
 with a <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Notation">Notation</a></code>
 node as its root; in this case, it means that the <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Notation">Notation</a></code>
 node will appear in the first position of the traversal. Since entities are not part of the document tree, they do not appear when traversing over the document tree. */
	public static inline var SHOW_NOTATION:Int = 0x00000800;

	/** Shows <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/ProcessingInstruction">ProcessingInstruction</a></code>
&nbsp;nodes. */
	public static inline var SHOW_PROCESSING_INSTRUCTION:Int = 0x00000040;

	/** Shows <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/Text">Text</a></code>
&nbsp;nodes. */
	public static inline var SHOW_TEXT:Int = 0x00000004;

	public function acceptNode (n:Node):Int {
		return null;
	}
	
}
#end