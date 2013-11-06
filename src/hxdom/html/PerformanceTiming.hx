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
typedef PerformanceTiming = js.html.PerformanceTiming;
#else
class PerformanceTiming {
	
	public var connectEnd(default,null) : Int;

	public var connectStart(default,null) : Int;

	public var domComplete(default,null) : Int;

	public var domContentLoadedEventEnd(default,null) : Int;

	public var domContentLoadedEventStart(default,null) : Int;

	public var domInteractive(default,null) : Int;

	public var domLoading(default,null) : Int;

	public var domainLookupEnd(default,null) : Int;

	public var domainLookupStart(default,null) : Int;

	public var fetchStart(default,null) : Int;

	public var loadEventEnd(default,null) : Int;

	public var loadEventStart(default,null) : Int;

	public var navigationStart(default,null) : Int;

	public var redirectEnd(default,null) : Int;

	public var redirectStart(default,null) : Int;

	public var requestStart(default,null) : Int;

	public var responseEnd(default,null) : Int;

	public var responseStart(default,null) : Int;

	public var secureConnectionStart(default,null) : Int;

	public var unloadEventEnd(default,null) : Int;

	public var unloadEventStart(default,null) : Int;
	
}
#end