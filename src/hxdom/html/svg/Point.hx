package hxdom.html.svg;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef Point = js.html.svg.Point;
#else
class Point {
	
	public var x:Float;

	public var y:Float;

	public function matrixTransform (matrix:Matrix):Point {
		return null;
	}
	
}
#end