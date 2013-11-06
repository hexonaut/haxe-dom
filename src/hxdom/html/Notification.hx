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
typedef Notification = js.html.Notification;
#else
class Notification extends EventTarget {
	
	public var dir : String;

	/** &nbsp;A function to call when the notification is clicked. */
	public var onclick : EventListener;

	/** &nbsp;A function to call when the notification is dismissed. */
	public var onclose : EventListener;

	public var ondisplay : EventListener;

	public var onerror : EventListener;

	public var onshow : EventListener;

	public var permission(default,null) : String;

	public var replaceId : String;

	public var tag : String;

	public function new( title : String, options : Dynamic ) {
		
	}
	
	public function cancel() : Void {
		
	}

	public function close() : Void {
		
	}

	public static function requestPermission( callback_ : NotificationPermissionCallback ) : Void {
		
	}
	
	public function show() : Void {
		
	}
	
}
#end