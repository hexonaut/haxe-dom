package hxdom.svg;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef TransformList = js.html.svg.TransformList;
#else
class TransformList {
	
	public var numberOfItems(default,null):Int;

	public function appendItem (item:Transform):Transform {
		
	}

	public function clear ():Void {
		
	}

	public function consolidate ():Transform {
		
	}

	public function createSVGTransformFromMatrix (matrix:Matrix):Transform {
		
	}

	public function getItem (index:Int):Transform {
		
	}

	public function initialize (item:Transform):Transform {
		
	}

	public function insertItemBefore (item:Transform, index:Int):Transform {
		
	}

	public function removeItem (index:Int):Transform {
		
	}

	public function replaceItem (item:Transform, index:Int):Transform {
		
	}
	
}
#end