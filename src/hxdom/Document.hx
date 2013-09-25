package hxdom;

#if js
typedef Document = js.html.Document;
#else
class Document extends Node {
	
	/** Returns a string containing the URL of the current document. */
	public var URL(default, null):String;

	/** Returns the currently focused element */
	public var activeElement(default, null):Element;

	/** Returns or sets the color of active links in the document body. */
	public var alinkColor:String;

	public var all:HTMLAllCollection;

	/** Returns a list of all of the anchors in the document. */
	public var anchors(default, null):HTMLCollection;

	/** Returns an ordered list of the applets within a document. */
	public var applets(default, null):HTMLCollection;

	/** Gets/sets the background color of the current document. */
	public var bgColor:String;

	/** Returns the BODY node of the current document. Setter throws DOMException. */
	public var body:Element;

	/** Returns the character set being used by the document. */
	public var characterSet(default, null):String;

	public var charset:String;

	/** Indicates whether the document is rendered in Quirks or Strict mode. */
	public var compatMode(default, null):String;

	/** Returns a semicolon-separated list of the cookies for that document or sets a single cookie. Getter throws DOMException. Setter throws DOMException. */
	public var cookie:String;

	public var currentFullScreenElement(default, null):Element;

	public var defaultCharset(default, null):String;

	/** Returns a reference to the window object. */
	public var defaultView(default, null):DOMWindow;

	/** Gets/sets WYSYWIG editing capability of <a title="en/Midas" rel="internal" href="https://developer.mozilla.org/en/Midas">Midas</a>. It can only be used for HTML documents. */
	public var designMode:String;

	/** Gets/sets directionality (rtl/ltr) of the document */
	public var dir:String;

	/** Returns the Document Type Definition (DTD) of the current document. */
	public var doctype(default, null):DocumentType;

	/** Returns the Element that is a direct child of document. For HTML documents, this is normally the HTML element. */
	public var documentElement(default, null):Element;

	/** Returns the document location. */
	public var documentURI(default, null):String;

	/** Returns the domain of the current document. Setter throws DOMException. */
	public var domain:String;

	/** Returns a list of the embedded OBJECTS within the current document. */
	public var embeds(default, null):HTMLCollection;

	/** Gets/sets the foreground color, or text color, of the current document. */
	public var fgColor:String;

	/** Returns a list of the FORM elements within the current document. */
	public var forms(default, null):HTMLCollection;

	public var fullScreenKeyboardInputAllowed(default, null):Bool;

	public var fullscreenElement(default, null):Element;

	public var fullscreenEnabled(default, null):Bool;

	/** Returns the HEAD node of the current document. */
	public var head(default, null):HeadElement;

	/** Gets/sets the height of the current document. */
	public var height(default, null):Int;

	public var hidden(default, null):Bool;

	/** Returns a list of the images in the current document. */
	public var images(default, null):HTMLCollection;

	/** Returns the DOM implementation associated with the current document. */
	public var implementation(default, null):DOMImplementation;

	/** Returns the encoding used when the document was parsed. */
	public var inputEncoding(default, null):String;

	public var isFullScreen(default, null):Bool;

	/** Returns the date on which the document was last modified. */
	public var lastModified(default, null):String;

	/** Gets/sets the color of hyperlinks in the document. */
	public var linkColor:String;

	/** Returns a list of all the hyperlinks in the document. */
	public var links(default, null):HTMLCollection;

	/** Returns the URI of the current document. */
	public var location:Location;

	public var onabort:EventListener;

	public var onbeforecopy:EventListener;

	public var onbeforecut:EventListener;

	public var onbeforepaste:EventListener;

	public var onblur:EventListener;

	public var onchange:EventListener;

	public var onclick:EventListener;

	public var oncontextmenu:EventListener;

	public var oncopy:EventListener;

	public var oncut:EventListener;

	public var ondblclick:EventListener;
	
	public var ondrag:EventListener;

	public var ondragend:EventListener;

	public var ondragenter:EventListener;

	public var ondragleave:EventListener;

	public var ondragover:EventListener;

	public var ondragstart:EventListener;

	public var ondrop:EventListener;

	public var onerror:EventListener;

	public var onfocus:EventListener;

	public var onfullscreenchange:EventListener;

	public var onfullscreenerror:EventListener;

	public var oninput:EventListener;

	public var oninvalid:EventListener;

	public var onkeydown:EventListener;

	public var onkeypress:EventListener;

	public var onkeyup:EventListener;

	public var onload:EventListener;

	public var onmousedown:EventListener;

	public var onmousemove:EventListener;

	public var onmouseout:EventListener;

	public var onmouseover:EventListener;

	public var onmouseup:EventListener;

	public var onmousewheel:EventListener;

	public var onpaste:EventListener;

	public var onpointerlockchange:EventListener;

	public var onpointerlockerror:EventListener;

	/** <dl><dd>Returns the event handling code for the <code>readystatechange</code> event.</dd>
</dl>
<div class="geckoVersionNote"> <p>
</p><div class="geckoVersionHeading">Gecko 9.0 note<div>(Firefox 9.0 / Thunderbird 9.0 / SeaMonkey 2.6)
</div></div>
<p></p> <p>Starting in Gecko 9.0 (Firefox 9.0 / Thunderbird 9.0 / SeaMonkey 2.6)
, you can now use the syntax <code>if ("onabort" in document)</code> to determine whether or not a given event handler property exists. This is because event handler interfaces have been updated to be proper web IDL interfaces. See <a title="en/DOM/DOM event handlers" rel="internal" href="https://developer.mozilla.org/en/DOM/DOM_event_handlers">DOM event handlers</a> for details.</p>
</div> */
	public var onreadystatechange:EventListener;

	public var onreset:EventListener;

	public var onscroll:EventListener;

	public var onsearch:EventListener;

	public var onselect:EventListener;

	public var onselectionchange:EventListener;

	public var onselectstart:EventListener;

	public var onsubmit:EventListener;

	public var ontouchcancel:EventListener;

	public var ontouchend:EventListener;

	public var ontouchmove:EventListener;

	public var ontouchstart:EventListener;

	/** Returns a list of the available plugins. */
	public var plugins(default, null):HTMLCollection;

	public var pointerLockElement(default, null):Element;

	public var preferredStylesheetSet(default, null):String;

	/** Returns loading status of the document */
	public var readyState(default, null):String;

	/** Returns the URI of the page that linked to this page. */
	public var referrer(default, null):String;

	/** Returns all the <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/script">&lt;script&gt;</a></code>
 elements on the document. */
	public var scripts(default, null):HTMLCollection;

	public var selectedStylesheetSet:String;

	/** Returns a list of the stylesheet objects on the current document. */
	public var styleSheets(default, null):StyleSheetList;

	/** Returns the title of the current document. */
	public var title:String;

	public var visibilityState(default, null):String;

	/** Gets/sets the color of visited hyperlinks. */
	public var vlinkColor:String;

	/** Returns the width of the current document. */
	public var width(default, null):Int;

	/** Returns the encoding as determined by the XML declaration.<br> <div class="note">Firefox 10 and later don't implement it anymore.</div> */
	public var xmlEncoding(default, null):String;

	/** Returns <code>true</code> if the XML declaration specifies the document is standalone (<em>e.g.,</em> An external part of the DTD affects the document's content), else <code>false</code>. Setter throws DOMException. */
	public var xmlStandalone:Bool;

	/** Returns the version number as specified in the XML declaration or <code>"1.0"</code> if the declaration is absent. Setter throws DOMException. */
	public var xmlVersion:String;
	
	public function new () {
		
	}

	public function adoptNode (source:Node):Node {
		
	}

	public function cancelFullScreen ():Void {
		
	}

	public function captureEvents ():Void {
		
	}

	public function caretRangeFromPoint (x:Int, y:Int):Range {
		
	}

	public function clear ():Void {
		
	}

	public function close ():Void {
		
	}

	public function createAttribute (name:String):Attr {
		
	}

	public function createAttributeNS (?namespaceURI:String, ?qualifiedName:String):Attr {
		
	}

	public function createCDATASection (data:String):CDATASection {
		
	}

	public function createComment (data:String):Comment {
		
	}

	public function createDocumentFragment ():DocumentFragment {
		
	}

	public function createElement (?tagName:String):Element {
		
	}

	public function createElementNS (?namespaceURI:String, ?qualifiedName:String):Element {
		
	}

	public function createEntityReference (name:String):EntityReference {
		
	}

	public function createEvent (eventType:String):Event {
		
	}

	public function createExpression (expression:String, resolver:XPathNSResolver):XPathExpression {
		
	}

	public function createNSResolver (nodeResolver:Node):XPathNSResolver {
		
	}

	public function createNodeIterator (root:Node, whatToShow:Int, filter:NodeFilter, expandEntityReferences:Bool):NodeIterator {
		
	}

	public function createProcessingInstruction (target:String, data:String):ProcessingInstruction {
		
	}

	public function createRange():Range {
		
	}

	public function createTextNode (data:String):Text {
		
	}

	public function createTouch (window:DOMWindow, target:EventTarget, identifier:Int, pageX:Int, pageY:Int, screenX:Int, screenY:Int, radiusX:Int, radiusY:Int, rotationAngle:Float, force:Float):Touch {
		
	}

	public function createTouchList():TouchList {
		
	}

	public function createTreeWalker (root:Node, whatToShow:Int, filter:NodeFilter, expandEntityReferences:Bool):TreeWalker {
		
	}

	public function elementFromPoint (x:Int, y:Int):Element {
		
	}

	public function evaluate (expression:String, contextNode:Node, resolver:XPathNSResolver, type:Int, inResult:XPathResult):XPathResult {
		
	}

	public function execCommand (command:String, userInterface:Bool, ?value:String):Bool {
		
	}

	public function exitFullscreen():Void {
		
	}

	public function exitPointerLock():Void {
		
	}

	public function getCSSCanvasContext (contextId:String, name:String, width:Int, height:Int):CanvasRenderingContext {
		
	}

	public function getElementById (elementId:String):Element {
		
	}

	public function getElementsByClassName (tagname:String):NodeList {
		
	}

	public function getElementsByName (elementName:String):NodeList {
		
	}

	public function getElementsByTagName (tagname:String):NodeList {
		
	}

	public function getElementsByTagNameNS (?namespaceURI:String, localName:String):NodeList {
		
	}

	public function getOverrideStyle (element:Element, pseudoElement:String):CSSStyleDeclaration {
		
	}

	public function getSelection ():DOMSelection {
		
	}

	public function hasFocus ():Bool {
		
	}

	public function importNode (importedNode:Node, ?deep:Bool):Node {
		
	}

	public function open():Void;

	public function queryCommandEnabled (command:String):Bool {
		
	}

	public function queryCommandIndeterm (command:String):Bool {
		
	}

	public function queryCommandState (command:String):Bool {
		
	}

	public function queryCommandSupported (command:String):Bool {
		
	}

	public function queryCommandValue (command:String):String {
		
	}

	public function querySelector (selectors:String):Element {
		
	}

	public function querySelectorAll (selectors:String):NodeList {
		
	}

	public function releaseEvents ():Void {
		
	}

	public function write (text:String):Void {
		
	}

	public function writeln (text:String):Void {
		
	}

	/** A typed shortcut for <code>createElement("td")</code>. */
	public inline function createTableCellElement():TableCellElement { return cast createElement("td"); }
	/** A typed shortcut for <code>createElement("hr")</code>. */
	public inline function createHRElement():HRElement { return cast createElement("hr"); }
	/** A typed shortcut for <code>createElement("marquee")</code>. */
	public inline function createMarqueeElement():MarqueeElement { return cast createElement("marquee"); }
	/** A typed shortcut for <code>createElement("basefont")</code>. */
	public inline function createBaseFontElement():BaseFontElement { return cast createElement("basefont"); }
	/** A typed shortcut for <code>createElement("select")</code>. */
	public inline function createSelectElement():SelectElement { return cast createElement("select"); }
	/** A typed shortcut for <code>createElement("map")</code>. */
	public inline function createMapElement():MapElement { return cast createElement("map"); }
	/** A typed shortcut for <code>createElement("form")</code>. */
	public inline function createFormElement():FormElement { return cast createElement("form"); }
	/** A typed shortcut for <code>createElement("option")</code>. */
	public inline function createOptionElement():OptionElement { return cast createElement("option"); }
	/** A typed shortcut for <code>createElement("label")</code>. */
	public inline function createLabelElement():LabelElement { return cast createElement("label"); }
	/** A typed shortcut for <code>createElement("meta")</code>. */
	public inline function createMetaElement():MetaElement { return cast createElement("meta"); }
	/** A typed shortcut for <code>createElement("img")</code>. */
	public inline function createImageElement():ImageElement { return cast createElement("img"); }
	/** A typed shortcut for <code>createElement("dl")</code>. */
	public inline function createDListElement():DListElement { return cast createElement("dl"); }
	/** A typed shortcut for <code>createElement("frame")</code>. */
	public inline function createFrameElement():FrameElement { return cast createElement("frame"); }
	/** A typed shortcut for <code>createElement("mod")</code>. */
	public inline function createModElement():ModElement { return cast createElement("mod"); }
	/** A typed shortcut for <code>createElement("ul")</code>. */
	public inline function createUListElement():UListElement { return cast createElement("ul"); }
	/** A typed shortcut for <code>createElement("output")</code>. */
	public inline function createOutputElement():OutputElement { return cast createElement("output"); }
	/** A typed shortcut for <code>createElement("ol")</code>. */
	public inline function createOListElement():OListElement { return cast createElement("ol"); }
	/** A typed shortcut for <code>createElement("shadow")</code>. */
	public inline function createShadowElement():ShadowElement { return cast createElement("shadow"); }
	/** A typed shortcut for <code>createElement("li")</code>. */
	public inline function createLIElement():LIElement { return cast createElement("li"); }
	/** A typed shortcut for <code>createElement("datalist")</code>. */
	public inline function createDataListElement():DataListElement { return cast createElement("datalist"); }
	/** A typed shortcut for <code>createElement("param")</code>. */
	public inline function createParamElement():ParamElement { return cast createElement("param"); }
	/** A typed shortcut for <code>createElement("font")</code>. */
	public inline function createFontElement():FontElement { return cast createElement("font"); }
	/** A typed shortcut for <code>createElement("track")</code>. */
	public inline function createTrackElement():TrackElement { return cast createElement("track"); }
	/** A typed shortcut for <code>createElement("applet")</code>. */
	public inline function createAppletElement():AppletElement { return cast createElement("applet"); }
	/** A typed shortcut for <code>createElement("area")</code>. */
	public inline function createAreaElement():AreaElement { return cast createElement("area"); }
	/** A typed shortcut for <code>createElement("link")</code>. */
	public inline function createLinkElement():LinkElement { return cast createElement("link"); }
	/** A typed shortcut for <code>createElement("div")</code>. */
	public inline function createDivElement():DivElement { return cast createElement("div"); }
	/** A typed shortcut for <code>createElement("title")</code>. */
	public inline function createTitleElement():TitleElement { return cast createElement("title"); }
	/** A typed shortcut for <code>createElement("style")</code>. */
	public inline function createStyleElement():StyleElement { return cast createElement("style"); }
	/** A typed shortcut for <code>createElement("progress")</code>. */
	public inline function createProgressElement():ProgressElement { return cast createElement("progress"); }
	/** A typed shortcut for <code>createElement("button")</code>. */
	public inline function createButtonElement():ButtonElement { return cast createElement("button"); }
	/** A typed shortcut for <code>createElement("fieldset")</code>. */
	public inline function createFieldSetElement():FieldSetElement { return cast createElement("fieldset"); }
	/** A typed shortcut for <code>createElement("a")</code>. */
	public inline function createAnchorElement():AnchorElement { return cast createElement("a"); }
	/** A typed shortcut for <code>createElement("iframe")</code>. */
	public inline function createIFrameElement():IFrameElement { return cast createElement("iframe"); }
	/** A typed shortcut for <code>createElement("span")</code>. */
	public inline function createSpanElement():SpanElement { return cast createElement("span"); }
	/** A typed shortcut for <code>createElement("details")</code>. */
	public inline function createDetailsElement():DetailsElement { return cast createElement("details"); }
	/** A typed shortcut for <code>createElement("body")</code>. */
	public inline function createBodyElement():BodyElement { return cast createElement("body"); }
	/** A typed shortcut for <code>createElement("input")</code>. */
	public inline function createInputElement():InputElement { return cast createElement("input"); }
	/** A typed shortcut for <code>createElement("embed")</code>. */
	public inline function createEmbedElement():EmbedElement { return cast createElement("embed"); }
	/** A typed shortcut for <code>createElement("meter")</code>. */
	public inline function createMeterElement():MeterElement { return cast createElement("meter"); }
	/** A typed shortcut for <code>createElement("pre")</code>. */
	public inline function createPreElement():PreElement { return cast createElement("pre"); }
	/** A typed shortcut for <code>createElement("thead")</code>. */
	public inline function createTableSectionElement():TableSectionElement { return cast createElement("thead"); }
	/** A typed shortcut for <code>createElement("head")</code>. */
	public inline function createHeadElement():HeadElement { return cast createElement("head"); }
	/** A typed shortcut for <code>createElement("base")</code>. */
	public inline function createBaseElement():BaseElement { return cast createElement("base"); }
	/** A typed shortcut for <code>createElement("optgroup")</code>. */
	public inline function createOptGroupElement():OptGroupElement { return cast createElement("optgroup"); }
	/** A typed shortcut for <code>createElement("quote")</code>. */
	public inline function createQuoteElement():QuoteElement { return cast createElement("quote"); }
	/** A typed shortcut for <code>createElement("audio")</code>. */
	public inline function createAudioElement():AudioElement { return cast createElement("audio"); }
	/** A typed shortcut for <code>createElement("video")</code>. */
	public inline function createVideoElement():VideoElement { return cast createElement("video"); }
	/** A typed shortcut for <code>createElement("legend")</code>. */
	public inline function createLegendElement():LegendElement { return cast createElement("legend"); }
	/** A typed shortcut for <code>createElement("menu")</code>. */
	public inline function createMenuElement():MenuElement { return cast createElement("menu"); }
	/** A typed shortcut for <code>createElement("frameset")</code>. */
	public inline function createFrameSetElement():FrameSetElement { return cast createElement("frameset"); }
	/** A typed shortcut for <code>createElement("canvas")</code>. */
	public inline function createCanvasElement():CanvasElement { return cast createElement("canvas"); }
	/** A typed shortcut for <code>createElement("keygen")</code>. */
	public inline function createKeygenElement():KeygenElement { return cast createElement("keygen"); }
	/** A typed shortcut for <code>createElement("col")</code>. */
	public inline function createTableColElement():TableColElement { return cast createElement("col"); }
	/** A typed shortcut for <code>createElement("dir")</code>. */
	public inline function createDirectoryElement():DirectoryElement { return cast createElement("dir"); }
	/** A typed shortcut for <code>createElement("table")</code>. */
	public inline function createTableElement():TableElement { return cast createElement("table"); }
	/** A typed shortcut for <code>createElement("tr")</code>. */
	public inline function createTableRowElement():TableRowElement { return cast createElement("tr"); }
	/** A typed shortcut for <code>createElement("script")</code>. */
	public inline function createScriptElement():ScriptElement { return cast createElement("script"); }
	/** A typed shortcut for <code>createElement("source")</code>. */
	public inline function createSourceElement():SourceElement { return cast createElement("source"); }
	/** A typed shortcut for <code>createElement("p")</code>. */
	public inline function createParagraphElement():ParagraphElement { return cast createElement("p"); }
	/** A typed shortcut for <code>createElement("content")</code>. */
	public inline function createContentElement():ContentElement { return cast createElement("content"); }
	/** A typed shortcut for <code>createElement("br")</code>. */
	public inline function createBRElement():BRElement { return cast createElement("br"); }
	/** A typed shortcut for <code>createElement("html")</code>. */
	public inline function createHtmlElement():HtmlElement { return cast createElement("html"); }
	/** A typed shortcut for <code>createElement("textarea")</code>. */
	public inline function createTextAreaElement():TextAreaElement { return cast createElement("textarea"); }
	/** A typed shortcut for <code>createElement("media")</code>. */
	public inline function createMediaElement():MediaElement { return cast createElement("media"); }
	/** A typed shortcut for <code>createElement("object")</code>. */
	public inline function createObjectElement():ObjectElement { return cast createElement("object"); }
	/** A typed shortcut for <code>createElement("caption")</code>. */
	public inline function createTableCaptionElement():TableCaptionElement { return cast createElement("caption"); }
	
}
#end