package hxdom;

#if js
typedef CanvasElement = js.html.CanvasElement;
#else
class CanvasElement extends Element {
	
	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/canvas#attr-height">height</a></code>
 HTML attribute, specifying the height of the coordinate space in CSS pixels. */
	public var height:Int;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/canvas#attr-width">width</a></code>
 HTML attribute, specifying the width of the coordinate space in CSS pixels. */
	public var width:Int;

	function getContext (contextId:String):Dynamic {
		
	}

	function toDataURL (?type:String):String {
		
	}

	/** A typed shortcut for <code>getContext("2d")</code>. */
	public inline function getContext2d ():CanvasRenderingContext2D { return cast getContext("2d"); }

	public inline function getContextWebGL (?attribs:hxdom.webgl.ContextAttributes):hxdom.webgl.RenderingContext {
		return CanvasUtil.getContextWebGL(this, attribs);
	}
	
}

private class CanvasUtil {
	public static function getContextWebGL (canvas:CanvasElement, attribs:Dynamic) {
		for (name in ["webgl", "experimental-webgl"]) {
			var ctx = (untyped canvas).getContext(name, attribs);
			if (ctx != null) return ctx;
		}
		return null;
	}
}
#end