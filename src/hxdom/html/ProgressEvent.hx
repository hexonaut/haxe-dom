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
typedef ProgressEvent = js.html.ProgressEvent;
#else
class ProgressEvent extends Event {
        /** Specifies whether or not the total size of the transfer is known. <strong>Read only.</strong> */
        var lengthComputable(default,null) : Bool;

        /** The number of bytes transferred since the beginning of the operation. This doesn't include headers and other overhead, but only the content itself. <strong>Read only.</strong> */
        var loaded(default,null) : Int;

        /** The total number of bytes of content that will be transferred during the operation. If the total size is unknown, this value is zero. <strong>Read only.</strong> */
        var total(default,null) : Int;

        function new( type : String, canBubble : Bool = true, cancelable : Bool = true ) {
			super(type, canBubble, cancelable);
		}

}
#end