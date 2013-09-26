package hxdom.html;

#if js
typedef DOMWindow = js.html.DOMWindow;
#else
class DOMWindow extends EventTarget {
	
	public static inline var PERSISTENT:Int = 1;

	public static inline var TEMPORARY:Int = 0;

	/** An <code><a rel="custom" href="https://developer.mozilla.org/en/nsIDOMOfflineResourceList">nsIDOMOfflineResourceList</a></code>
 object providing access to the offline resources for the window. */
	public var applicationCache(default, null):DOMApplicationCache;

	public var clientInformation(default, null):Navigator;

	/** <dd>This property indicates whether the current window is closed or not.</dd> <dt><a title="en/Components_object" rel="internal" href="https://developer.mozilla.org/en/Components_object">window.Components</a></dt> <dd>The entry point to many <a title="en/XPCOM" rel="internal" href="https://developer.mozilla.org/en/XPCOM">XPCOM</a> features. Some properties, e.g. <a title="en/Components.classes" rel="internal" href="https://developer.mozilla.org/en/Components.classes">classes</a>, are only available to sufficiently privileged code.</dd> */
	public var closed(default, null):Bool;

	public var console(default, null):Console;

	/** Returns the browser crypto object. */
	public var crypto(default, null):Crypto;

	/** Gets/sets the status bar text for the given window. */
	public var defaultStatus:String;

	public var defaultstatus:String;

	public var devicePixelRatio(default, null):Float;

	/** Returns a reference to the document that the window contains. */
	public var document(default, null):Document;

	public var event(default, null):Event;

	/** Returns the element in which the window is embedded, or null if the window is not embedded. */
	public var frameElement(default, null):Element;

	/** Returns an array of the subframes in the current window. */
	public var frames(default, null):DOMWindow;

	/** Returns a reference to the history object. */
	public var history(default, null):History;

	public var indexedDB(default, null):hxdom.html.idb.Factory;

	/** Gets the height of the content area of the browser window including, if rendered, the horizontal scrollbar. */
	public var innerHeight(default, null):Int;

	/** Gets the width of the content area of the browser window including, if rendered, the vertical scrollbar. */
	public var innerWidth(default, null):Int;

	/** Returns the number of frames in the window. See also <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/window.frames">window.frames</a></code>
. */
	public var length(default, null):Int;

	/** Returns a reference to the local storage object used to store data that may only be accessed by the origin that created it. Getter throws DOMException. */
	public var localStorage(default, null):Storage;

	/** Gets/sets the location, or current URL, of the window object. */
	public var location:Location;

	/** Returns the locationbar object, whose visibility can be toggled in the window. */
	public var locationbar(default, null):BarInfo;

	/** Returns the menubar object, whose visibility can be toggled in the window. */
	public var menubar(default, null):BarInfo;

	/** Gets/sets the name of the window. */
	public var name:String;

	/** Returns a reference to the navigator object. */
	public var navigator(default, null):Navigator;

	public var notifications(default, null):NotificationCenter;

	public var offscreenBuffering(default, null):Bool;

	/** An event handler property for abort events on the window. */
	public var onabort:EventListener;

	public var onanimationend:EventListener;

	public var onanimationiteration:EventListener;

	public var onanimationstart:EventListener;

	/** An event handler property for before-unload events on the window. */
	public var onbeforeunload:EventListener;

	/** An event handler property for blur events on the window. */
	public var onblur:EventListener;

	public var oncanplay:EventListener;

	public var oncanplaythrough:EventListener;

	/** An event handler property for change events on the window. */
	public var onchange:EventListener;

	/** An event handler property for click events on the window. */
	public var onclick:EventListener;

	/** An event handler property for right-click events on the window. */
	public var oncontextmenu:EventListener;

	public var ondblclick:EventListener;

	public var ondevicemotion:EventListener;

	public var ondeviceorientation:EventListener;

	public var ondrag:EventListener;

	public var ondragend:EventListener;

	public var ondragenter:EventListener;

	public var ondragleave:EventListener;

	public var ondragover:EventListener;

	public var ondragstart:EventListener;

	public var ondrop:EventListener;

	public var ondurationchange:EventListener;

	public var onemptied:EventListener;

	public var onended:EventListener;

	/** An event handler property for errors raised on the window. */
	public var onerror:EventListener;

	/** An event handler property for focus events on the window. */
	public var onfocus:EventListener;

	/** An event handler property for hash change events on the window; called when the part of the URL after the hash mark ("#") changes. */
	public var onhashchange:EventListener;

	public var oninput:EventListener;

	public var oninvalid:EventListener;

	/** An event handler property for keydown events on the window. */
	public var onkeydown:EventListener;

	/** An event handler property for keypress events on the window. */
	public var onkeypress:EventListener;

	/** An event handler property for keyup events on the window. */
	public var onkeyup:EventListener;

	/** An event handler property for window loading. */
	public var onload:EventListener;

	public var onloadeddata:EventListener;

	public var onloadedmetadata:EventListener;

	public var onloadstart:EventListener;

	public var onmessage:EventListener;

	/** An event handler property for mousedown events on the window. */
	public var onmousedown:EventListener;

	/** An event handler property for mousemove events on the window. */
	public var onmousemove:EventListener;

	/** An event handler property for mouseout events on the window. */
	public var onmouseout:EventListener;

	/** An event handler property for mouseover events on the window. */
	public var onmouseover:EventListener;

	/** An event handler property for mouseup events on the window. */
	public var onmouseup:EventListener;

	public var onmousewheel:EventListener;

	public var onoffline:EventListener;

	public var ononline:EventListener;

	/** An event handler property for pagehide events on the window. */
	public var onpagehide:EventListener;

	/** An event handler property for pageshow events on the window. */
	public var onpageshow:EventListener;

	public var onpause:EventListener;

	public var onplay:EventListener;

	public var onplaying:EventListener;

	/** An event handler property for popstate events, which are fired when navigating to a session history entry representing a state object. */
	public var onpopstate:EventListener;

	public var onprogress:EventListener;

	public var onratechange:EventListener;

	/** An event handler property for reset events on the window. */
	public var onreset:EventListener;

	/** An event handler property for window resizing. */
	public var onresize:EventListener;

	/** An event handler property for window scrolling. */
	public var onscroll:EventListener;

	public var onsearch:EventListener;

	public var onseeked:EventListener;

	public var onseeking:EventListener;

	/** An event handler property for window selection. */
	public var onselect:EventListener;

	public var onstalled:EventListener;

	public var onstorage:EventListener;

	/** An event handler property for submits on window forms. */
	public var onsubmit:EventListener;

	public var onsuspend:EventListener;

	public var ontimeupdate:EventListener;

	public var ontouchcancel:EventListener;

	public var ontouchend:EventListener;

	public var ontouchmove:EventListener;

	public var ontouchstart:EventListener;

	public var ontransitionend:EventListener;

	/** An event handler property for unload events on the window. */
	public var onunload:EventListener;

	public var onvolumechange:EventListener;

	public var onwaiting:EventListener;

	/** Returns a reference to the window that opened this current window. */
	public var opener(default, null):DOMWindow;

	/** Gets the height of the outside of the browser window. */
	public var outerHeight(default, null):Int;

	/** Gets the width of the outside of the browser window. */
	public var outerWidth(default, null):Int;

	public var pagePopupController(default, null):PagePopupController;

	/** An alias for <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/window.scrollX">window.scrollX</a></code>
. */
	public var pageXOffset(default, null):Int;

	/** An alias for <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/window.scrollY">window.scrollY</a></code> */
	public var pageYOffset(default, null):Int;

	/** Returns a reference to the parent of the current window or subframe. */
	public var parent(default, null):DOMWindow;

	public var performance(default, null):Performance;

	/** Returns the personalbar object, whose visibility can be toggled in the window. */
	public var personalbar(default, null):BarInfo;

	/** Returns a reference to the screen object associated with the window. */
	public var screen(default, null):Screen;

	public var screenLeft(default, null):Int;

	public var screenTop(default, null):Int;

	/** Returns the horizontal distance of the left border of the user's browser from the left side of the screen. */
	public var screenX(default, null):Int;

	/** Returns the vertical distance of the top border of the user's browser from the top side of the screen. */
	public var screenY(default, null):Int;

	/** Returns the number of pixels that the document has already been scrolled horizontally. */
	public var scrollX(default, null):Int;

	/** Returns the number of pixels that the document has already been scrolled vertically. */
	public var scrollY(default, null):Int;

	/** Returns the scrollbars object, whose visibility can be toggled in the window. */
	public var scrollbars(default, null):BarInfo;

	/** Returns an object reference to the window object itself. */
	public var self(default, null):DOMWindow;

	/** A storage object for storing data within a single page session. Getter throws DOMException. */
	public var sessionStorage(default, null):Storage;

	/** Gets/sets the text in the statusbar at the bottom of the browser. */
	public var status:String;

	/** Returns the statusbar object, whose visibility can be toggled in the window. */
	public var statusbar(default, null):BarInfo;

	public var storageInfo(default, null):StorageInfo;

	public var styleMedia(default, null):StyleMedia;

	/** Returns the toolbar object, whose visibility can be toggled in the window. */
	public var toolbar(default, null):BarInfo;

	/** <dd>Returns a reference to the topmost window in the window hierarchy. This property is read only.</dd> <dt><code><a rel="custom" href="https://developer.mozilla.org/en/DOM/window.URL">window.URL</a></code>
 
<span title="(Firefox 4 / Thunderbird 3.3 / SeaMonkey 2.1)
">Requires Gecko 2.0</span>
</dt> <dd>A DOM&nbsp;URL&nbsp;object, which provides the <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/window.URL.createObjectURL">window.URL.createObjectURL()</a></code>
 and <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/window.URL.revokeObjectURL">window.URL.revokeObjectURL()</a></code>
 methods.</dd> */
	public var top(default, null):DOMWindow;

	/** <dd>Returns a reference to the current window.</dd> <dt>window[0], window[1], etc.</dt> <dd>Returns a reference to the <code>window</code> object in the frames. See <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/window.frames">window.frames</a></code>
 for more details.</dd> */
	public var window(default, null):DOMWindow;

	public function alert (message:String):Void {
		
	}

	public function atob( ?string:String ):String {
		return null;
	}

	public function blur ():Void {
		
	}

	public function btoa (?string:String):String {
		return null;
	}

	@:overload( function (id:Int):Void {})
	public function cancelAnimationFrame (id:Int):Void {
		
	}

	public function cancelRequestAnimationFrame (id:Int):Void {
		
	}

	public function captureEvents ():Void {
		
	}

	public function clearInterval (handle:Int):Void {
		
	}

	public function clearTimeout (handle:Int):Void {
		
	}

	public function close ():Void {
		
	}

	public function confirm (message:String):Bool {
		return null;
	}

	public function convertPointFromNodeToPage (node:Node, p:Point):Point {
		return null;
	}

	public function convertPointFromPageToNode (node:Node, p:Point):Point {
		return null;
	}

	public function find (string:String, caseSensitive:Bool, backwards:Bool, wrap:Bool, wholeWord:Bool, searchInFrames:Bool, showDialog:Bool):Bool {
		return null;
	}

	public function focus ():Void {
		
	}

	public function getComputedStyle (element:Element, ?pseudoElement:String):CSSStyleDeclaration {
		return null;
	}

	public function getMatchedCSSRules (element:Element, ?pseudoElement:String):CSSRuleList {
		return null;
	}

	public function getSelection ():DOMSelection {
		return null;
	}

	public function matchMedia (query:String):MediaQueryList {
		return null;
	}

	public function moveBy (x:Float, y:Float):Void {
		
	}

	public function moveTo (x:Float, y:Float):Void {
		
	}

	public function open (url:String, name:String, ?options:String):DOMWindow {
		return null;
	}

	public function openDatabase (name:String, version:String, displayName:String, estimatedSize:Int, ?creationCallback:hxdom.html.sql.DatabaseCallback):hxdom.html.sql.Database {
		return null;
	}

	/** Provides a secure means for one window to send a string of data to another window, which need not be within the same domain as the first, in a secure manner. Throws DOMException. */
	@:overload( function (message:Dynamic, targetOrigin:String):Void {})
	public function postMessage(message:Dynamic, targetOrigin:String, messagePorts:Array<Dynamic>):Void {
		
	}

	public function print ():Void {
		
	}

	public function prompt (message:String, ?defaultValue:String):String {
		return null;
	}

	public function releaseEvents ():Void {
		
	}

	@:overload(function (callback_:RequestAnimationFrameCallback):Int {})
	public function requestAnimationFrame (callback_:RequestAnimationFrameCallback):Int {
		return null;
	}

	public function requestFileSystem (type:Int, size:Int, successCallback:hxdom.html.fs.FileSystemCallback, ?errorCallback:hxdom.html.fs.ErrorCallback):Void {
		
	}

	public function resizeBy (x:Float, y:Float):Void {
		
	}

	public function resizeTo (width:Float, height:Float):Void {
		
	}

	public function resolveLocalFileSystemURL (url:String, successCallback:hxdom.html.fs.EntryCallback, ?errorCallback:hxdom.html.fs.ErrorCallback):Void {
		
	}

	public function scroll (x:Int, y:Int):Void {
		
	}

	public function scrollBy (x:Int, y:Int):Void {
		
	}

	public function scrollTo (x:Int, y:Int):Void {
		
	}

	public function setInterval (handler:Void->Void, timeout:Int):Int {
		return null;
	}

	public function setTimeout (handler:Void->Void, timeout:Int):Int {
		return null;
	}

	public function showModalDialog (url:String, ?dialogArgs:Dynamic, ?featureArgs:String):Dynamic {
		return null;
	}

	public function stop ():Void {
		
	}
	
}
#end