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
typedef Screen = js.html.Screen;
#else
class Screen {
	
	/** Specifies the height of the screen, in pixels, minus permanent or semipermanent user interface features displayed by the operating system, such as the Taskbar on Windows. */
	public var availHeight(default,null) : Int;

	/** Returns the first available pixel available from the left side of the screen. */
	public var availLeft(default,null) : Int;

	/** Specifies the y-coordinate of the first pixel that is not allocated to permanent or semipermanent user interface features. */
	public var availTop(default,null) : Int;

	/** Returns the amount of horizontal space in pixels available to the window. */
	public var availWidth(default,null) : Int;

	/** Returns the color depth of the screen. */
	public var colorDepth(default,null) : Int;

	/** Returns the height of the screen in pixels. */
	public var height(default,null) : Int;

	/** Gets the bit depth of the screen. */
	public var pixelDepth(default,null) : Int;

	/** Returns the width of the screen. */
	public var width(default,null) : Int;
	
}
#end