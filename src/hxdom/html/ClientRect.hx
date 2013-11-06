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
typedef ClientRect = js.html.ClientRect;
#else
class ClientRect {
	
	/** Y-coordinate, relative to the viewport origin, of the bottom of the rectangle box. <strong>Read only.</strong> */
	public var bottom(default, null):Float;

	/** Height of the rectangle box (This is identical to <code>bottom</code> minus <code>top</code>). <strong>Read only.</strong> */
	public var height(default, null):Float;

	/** X-coordinate, relative to the viewport origin, of the left of the rectangle box. <strong>Read only.</strong> */
	public var left(default, null):Float;

	/** X-coordinate, relative to the viewport origin, of the right of the rectangle box. <strong>Read only.</strong> */
	public var right(default, null):Float;

	/** Y-coordinate, relative to the viewport origin, of the top of the rectangle box. <strong>Read only.</strong> */
	public var top(default, null):Float;

	/** Width of the rectangle box (This is identical to <code>right</code> minus <code>left</code>). <strong>Read only.</strong> 
<span title="(Firefox 3.5 / Thunderbird 3.0 / SeaMonkey 2.0)
">Requires Gecko 1.9.1</span> */
	public var width(default, null):Float;
	
}
#end