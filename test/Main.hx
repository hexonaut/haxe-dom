package ;

import hxdom.Browser;

/**
 * Testing for hxdom.
 * 
 * @author Sam MacPherson
 */

class Main {
	
	static function main () {
		var div = Browser.document.createDivElement();
		trace(div);
	}
	
}