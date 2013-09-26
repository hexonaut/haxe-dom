package hxdom.svg;

import hxdom.Element;
import hxdom.NodeList;

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