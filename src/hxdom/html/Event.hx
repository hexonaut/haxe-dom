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

#if (js && !use_vdom)
typedef Event = js.html.Event;
#else
class Event {
	
	public static inline var AT_TARGET:Int = 2;
	
	public static inline var BLUR:Int = 8192;
	
	public static inline var BUBBLING_PHASE : Int = 3;
	
	public static inline var CAPTURING_PHASE : Int = 1;
	
	public static inline var CHANGE : Int = 32768;
	
	public static inline var CLICK : Int = 64;
	
	public static inline var DBLCLICK : Int = 128;
	
	public static inline var DRAGDROP : Int = 2048;
	
	public static inline var FOCUS : Int = 4096;
	
	public static inline var KEYDOWN : Int = 256;
	
	public static inline var KEYPRESS : Int = 1024;
	
	public static inline var KEYUP : Int = 512;
	
	public static inline var MOUSEDOWN : Int = 1;
	
	public static inline var MOUSEDRAG : Int = 32;
	
	public static inline var MOUSEMOVE : Int = 16;
	
	public static inline var MOUSEOUT : Int = 8;
	
	public static inline var MOUSEOVER : Int = 4;
	
	public static inline var MOUSEUP : Int = 2;
	
	public static inline var NONE : Int = 0;
	
	public static inline var SELECT : Int = 16384;

	/** A boolean indicating whether the event bubbles up through the DOM or not. */
	public var bubbles(default,null):Bool;

	/** A boolean indicating whether the bubbling of the event has been canceled or not. */
	public var cancelBubble:Bool;

	/** A boolean indicating whether the event is cancelable. */
	public var cancelable(default,null):Bool;

	public var clipboardData(default,null):Clipboard;

	/** A reference to the currently registered target for the event. */
	public var currentTarget(default,null):EventTarget;

	/** Indicates whether or not <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/event.preventDefault">event.preventDefault()</a></code>
 has been called on the event. */
	public var defaultPrevented(default,null):Bool;

	/** Indicates which phase of the event flow is being processed. */
	public var eventPhase(default,null):Int;

	public var returnValue:Bool;

	public var srcElement(default,null):EventTarget;

	/** A reference to the target to which the event was originally dispatched. */
	public var target(default,null):EventTarget;

	/** The time that the event was created. */
	public var timeStamp(default,null):Int;

	/** The name of the event (case-insensitive). */
	public var type(default,null) : String;

	public function new (type:String, canBubble:Bool = true, cancelable:Bool = true):Void {
		initEvent(type, canBubble, cancelable);
	}

	public function initEvent (eventTypeArg:String, canBubbleArg:Bool, cancelableArg:Bool):Void {
		this.type = eventTypeArg;
		this.bubbles = canBubbleArg;
		this.cancelable = cancelableArg;
		defaultPrevented = false;
		cancelBubble = false;
	}

	public function preventDefault ():Void {
		defaultPrevented = true;
	}

	public function stopImmediatePropagation ():Void {
		cancelBubble = true;
	}

	public function stopPropagation ():Void {
		cancelBubble = true;
	}
	
}
#end