/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.html.svg;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if (js && !use_vdom)
typedef PreserveAspectRatio = js.html.svg.PreserveAspectRatio;
#else
class PreserveAspectRatio {
	
	/** Corresponds to value <code>meet</code> for attribute 
<code><a rel="custom" href="https://developer.mozilla.org/en/SVG/Attribute/preserveAspectRatio">preserveAspectRatio</a></code>. */
	public static inline var SVG_MEETORSLICE_MEET:Int = 1;

	/** Corresponds to value <code>slice</code> for attribute 
<code><a rel="custom" href="https://developer.mozilla.org/en/SVG/Attribute/preserveAspectRatio">preserveAspectRatio</a></code>. */
	public static inline var SVG_MEETORSLICE_SLICE:Int = 2;

	/** The enumeration was set to a value that is not one of predefined types. It is invalid to attempt to define a new value of this type or to attempt to switch an existing value to this type. */
	public static inline var SVG_MEETORSLICE_UNKNOWN:Int = 0;

	/** Corresponds to value <code>none</code> for attribute 
<code><a rel="custom" href="https://developer.mozilla.org/en/SVG/Attribute/preserveAspectRatio">preserveAspectRatio</a></code>. */
	public static inline var SVG_PRESERVEASPECTRATIO_NONE:Int = 1;

	/** The enumeration was set to a value that is not one of predefined types. It is invalid to attempt to define a new value of this type or to attempt to switch an existing value to this type. */
	public static inline var SVG_PRESERVEASPECTRATIO_UNKNOWN:Int = 0;

	/** Corresponds to value <code>xMaxYMax</code> for attribute 
<code><a rel="custom" href="https://developer.mozilla.org/en/SVG/Attribute/preserveAspectRatio">preserveAspectRatio</a></code>. */
	public static inline var SVG_PRESERVEASPECTRATIO_XMAXYMAX:Int = 10;

	/** Corresponds to value <code>xMaxYMid</code> for attribute 
<code><a rel="custom" href="https://developer.mozilla.org/en/SVG/Attribute/preserveAspectRatio">preserveAspectRatio</a></code>. */
	public static inline var SVG_PRESERVEASPECTRATIO_XMAXYMID:Int = 7;

	/** Corresponds to value <code>xMaxYMin</code> for attribute 
<code><a rel="custom" href="https://developer.mozilla.org/en/SVG/Attribute/preserveAspectRatio">preserveAspectRatio</a></code>. */
	public static inline var SVG_PRESERVEASPECTRATIO_XMAXYMIN:Int = 4;

	/** Corresponds to value <code>xMidYMax</code> for attribute 
<code><a rel="custom" href="https://developer.mozilla.org/en/SVG/Attribute/preserveAspectRatio">preserveAspectRatio</a></code>. */
	public static inline var SVG_PRESERVEASPECTRATIO_XMIDYMAX:Int = 9;

	/** Corresponds to value <code>xMidYMid</code> for attribute 
<code><a rel="custom" href="https://developer.mozilla.org/en/SVG/Attribute/preserveAspectRatio">preserveAspectRatio</a></code>. */
	public static inline var SVG_PRESERVEASPECTRATIO_XMIDYMID:Int = 6;

	/** Corresponds to value <code>xMidYMin</code> for attribute 
<code><a rel="custom" href="https://developer.mozilla.org/en/SVG/Attribute/preserveAspectRatio">preserveAspectRatio</a></code>. */
	public static inline var SVG_PRESERVEASPECTRATIO_XMIDYMIN:Int = 3;

	/** Corresponds to value <code>xMinYMax</code> for attribute 
<code><a rel="custom" href="https://developer.mozilla.org/en/SVG/Attribute/preserveAspectRatio">preserveAspectRatio</a></code>. */
	public static inline var SVG_PRESERVEASPECTRATIO_XMINYMAX:Int = 8;

	/** Corresponds to value <code>xMinYMid</code> for attribute 
<code><a rel="custom" href="https://developer.mozilla.org/en/SVG/Attribute/preserveAspectRatio">preserveAspectRatio</a></code>. */
	public static inline var SVG_PRESERVEASPECTRATIO_XMINYMID:Int = 5;

	/** Corresponds to value <code>xMinYMin</code> for attribute 
<code><a rel="custom" href="https://developer.mozilla.org/en/SVG/Attribute/preserveAspectRatio">preserveAspectRatio</a></code>. */
	public static inline var SVG_PRESERVEASPECTRATIO_XMINYMIN:Int = 2;

	/** The type of the alignment value as specified by one of the SVG_PRESERVEASPECTRATIO_* constants defined on this interface. Setter throws DOMException. */
	public var align:Int;

	/** The type of the meet-or-slice value as specified by one of the SVG_MEETORSLICE_* constants defined on this interface. Setter throws DOMException. */
	public var meetOrSlice:Int;
	
}
#end