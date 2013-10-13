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
typedef AppletElement = js.html.AppletElement;
#else
class AppletElement extends Element {
	
	/** This attribute is used to position the applet on the page relative to content that might flow around it. The HTML 4.01 specification defines values of bottom, left, middle, right, and top, whereas Microsoft and Netscape also might support <strong>absbottom</strong>, <strong>absmiddle</strong>, <strong>baseline</strong>, <strong>center</strong>, and <strong>texttop</strong>. */
	public var align:String;

	/** This attribute causes a descriptive text alternate to be displayed on browsers that do not support Java. Page designers should also remember that content enclosed within the <code>&lt;applet&gt;</code> element may also be rendered as alternative text. */
	public var alt:String;

	/** This attribute refers to an archived or compressed version of the applet and its associated class files, which might help reduce download time. */
	public var archive:String;

	/** This attribute specifies the URL of the applet's class file to be loaded and executed. Applet filenames are identified by a .class filename extension. The URL specified by code might be relative to the <code>codebase</code> attribute. */
	public var code:String;

	public var codeBase:String;

	/** This attribute specifies the height, in pixels, that the applet needs. */
	public var height:String;

	/** This attribute specifies additional horizontal space, in pixels, to be reserved on either side of the applet. */
	public var hspace:String;

	/** This attribute assigns a name to the applet so that it can be identified by other resources; particularly scripts. */
	public var name:String;

	/** This attribute specifies the URL of a serialized representation of an applet. */
	public var object:String;

	/** This attribute specifies additional vertical space, in pixels, to be reserved above and below the applet. */
	public var vspace:String;

	/** This attribute specifies in pixels the width that the applet needs. */
	public var width:String;
	
}
#end