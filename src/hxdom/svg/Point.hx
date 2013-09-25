package hxdom.svg;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef Point = js.html.svg.Point;
#else
class Point {
	
	public var x:Float;

	public var y:Float;

	public function matrixTransform (matrix:Matrix):Point {
		
	}
	
}
#end