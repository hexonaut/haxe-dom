package hxdom.html.svg;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
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