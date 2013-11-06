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
typedef TransformList = js.html.svg.TransformList;
#else
class TransformList {
	
	public var numberOfItems(default,null):Int;

	public function appendItem (item:Transform):Transform {
		return null;
	}

	public function clear ():Void {
		
	}

	public function consolidate ():Transform {
		return null;
	}

	public function createSVGTransformFromMatrix (matrix:Matrix):Transform {
		return null;
	}

	public function getItem (index:Int):Transform {
		return null;
	}

	public function initialize (item:Transform):Transform {
		return null;
	}

	public function insertItemBefore (item:Transform, index:Int):Transform {
		return null;
	}

	public function removeItem (index:Int):Transform {
		return null;
	}

	public function replaceItem (item:Transform, index:Int):Transform {
		return null;
	}
	
}
#end