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
typedef Location = js.html.Location;
#else
class Location {
	
	public var ancestorOrigins(default, null):DOMStringList;

	/** the part of the URL that follows the # symbol, including the # symbol.<br> You can listen for the <a title="en/DOM/window.onhashchange" rel="internal" href="https://developer.mozilla.org/en/DOM/window.onhashchange">hashchange event</a> to get notified of changes to the hash in supporting browsers. */
	public var hash:String;

	/** the host name and port number. */
	public var host:String;

	/** the host name (without the port number or square brackets). */
	public var hostname:String;

	/** the entire URL. */
	public var href:String;

	public var origin(default,null):String;

	/** the path (relative to the host). */
	public var pathname:String;

	/** the port number of the URL. */
	public var port:String;

	/** the protocol of the URL. */
	public var protocol:String;

	/** the part of the URL that follows the&nbsp;? symbol, including the&nbsp;? symbol. */
	public var search:String;

	public function assign (url:String):Void {
		
	}

	public function reload ():Void {
		
	}

	public function replace ( url:String ):Void {
		
	}

	public function toString ():String {
		return null;
	}
	
}
#end