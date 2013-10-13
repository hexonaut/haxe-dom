/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.html.idb;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef KeyRange = js.html.idb.KeyRange;
#else
class KeyRange {
	
	public var lower(default,null) : Key;

	public var lowerOpen(default,null) : Bool;

	public var upper(default,null) : Key;

	/** Returns false if the upper-bound value is included in the key range. */
	public var upperOpen(default,null) : Bool;

	public static function bound( lower : Key, upper : Key, ?lowerOpen : Bool, ?upperOpen : Bool ) : KeyRange {
		return null;
	}

	public static function lowerBound( bound : Key, ?open : Bool ) : KeyRange {
		return null;
	}

	public static function only( value : Key ) : KeyRange {
		return null;
	}

	public static function upperBound( bound : Key, ?open : Bool ) : KeyRange {
		return null;
	}
	
}
#end