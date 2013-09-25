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
		
	}

	public function flipY ():Matrix {
		
	}

	public function inverse ():Matrix {
		
	}

	public function multiply (secondMatrix:Matrix):Matrix {
		
	}

	public function rotate (angle:Float):Matrix {
		
	}

	public function rotateFromVector (x:Float, y:Float):Matrix {
		
	}

	public function scale (scaleFactor:Float):Matrix {
		
	}

	public function scaleNonUniform (scaleFactorX:Float, scaleFactorY:Float):Matrix {
		
	}

	public function skewX (angle:Float):Matrix {
		
	}

	public function skewY (angle:Float):Matrix {
		
	}

	public function translate (x:Float, y:Float):Matrix {
		
	}
	
}
#end