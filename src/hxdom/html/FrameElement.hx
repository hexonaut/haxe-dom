package hxdom.html;

#if js
typedef FrameElement = js.html.FrameElement;
#else
class FrameElement extends Element {
	
	public var contentDocument(default, null):Document;

	public var contentWindow(default, null):DOMWindow;

	public var frameBorder:String;

	public var height(default,null):Int;

	public var location:String;

	public var longDesc:String;

	public var marginHeight:String;

	public var marginWidth:String;

	/** This attribute is used to labeling frames. Without labeling all links will open in the frame that they are in. */
	public var name:String;

	public var noResize:Bool;

	/** This attribute defines existence of scrollbar. If this attribute is not used, browser put a scrollbar when necessary. There are two choices; "yes" for showing a scrollbar even when it is not necessary and "no" for do not showing a scrollbar even when it is necessary. */
	public var scrolling:String;

	/** This attribute is specify document which will be displayed by frame. */
	public var src:String;

	public var width(default, null):Int;

	public function getSVGDocument ():hxdom.html.svg.Document {
		return null;
	}
	
}
#end