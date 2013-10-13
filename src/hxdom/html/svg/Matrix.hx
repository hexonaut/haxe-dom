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

#if js
typedef Matrix = js.html.svg.Matrix;
#else
class Matrix {
	
	public var a:Float;

	public var b:Float;

	public var c:Float;

	public var d:Float;

	public var e:Float;

	public var f:Float;

	public function flipX ():Matrix {
		return null;
	}

	public function flipY ():Matrix {
		return null;
	}

	public function inverse ():Matrix {
		return null;
	}

	public function multiply (secondMatrix:Matrix):Matrix {
		return null;
	}

	public function rotate (angle:Float):Matrix {
		return null;
	}

	public function rotateFromVector (x:Float, y:Float):Matrix {
		return null;
	}

	public function scale (scaleFactor:Float):Matrix {
		return null;
	}

	public function scaleNonUniform (scaleFactorX:Float, scaleFactorY:Float):Matrix {
		return null;
	}

	public function skewX (angle:Float):Matrix {
		return null;
	}

	public function skewY (angle:Float):Matrix {
		return null;
	}

	public function translate (x:Float, y:Float):Matrix {
		return null;
	}
	
}
#end