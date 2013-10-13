/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.html;

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
		return null;
	}

	function toDataURL (?type:String):String {
		return null;
	}

	/** A typed shortcut for <code>getContext("2d")</code>. */
	public inline function getContext2d ():CanvasRenderingContext2D { return cast getContext("2d"); }

	public inline function getContextWebGL (?attribs:hxdom.html.webgl.ContextAttributes):hxdom.html.webgl.RenderingContext {
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