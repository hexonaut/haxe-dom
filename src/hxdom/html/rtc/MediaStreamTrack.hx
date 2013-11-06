/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.html.rtc;

import hxdom.html.Element;
import hxdom.html.EventTarget;
import hxdom.html.NodeList;

#if (js && !use_vdom)
typedef MediaStreamTrack = js.html.rtc.MediaStreamTrack;
#else
class MediaStreamTrack extends EventTarget {
	
	public static inline var ENDED : Int = 2;

	public static inline var LIVE : Int = 0;

	public static inline var MUTED : Int = 1;

	public var enabled : Bool;

	public var kind(default,null) : String;

	public var label(default,null) : String;

	public var onended : hxdom.html.EventListener;

	public var onmute : hxdom.html.EventListener;

	public var onunmute : hxdom.html.EventListener;

	public var readyState(default,null) : Int;
	
}
#end