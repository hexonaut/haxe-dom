package ;

import hxdom.html.Text;
import hxdom.HTMLSerializer;
import hxdom.js.Boot;
import hxdom.Wrappers;
import DivSubclass;

using hxdom.DomTools;

/**
 * Testing for hxdom.
 * 
 * @author Sam MacPherson
 */

class Main {
	
	static function main () {
		#if js
		var html = Boot.init();
		
		var domElem = DivSubclass.create(1, 1);
		trace(domElem);
		//domElem.text("JS Element!");
		//html.childNodes[1].appendChild(domElem);
		#else
		HTMLSerializer.USE_CACHE = true;
		
		var domElem = DivSubclass.create(1, 1).classes("class1").classes("class2").ident("asdf").text("Testing");
		domElem.listenToSomeEvent();
		var html = EHtml.create().add(EHead.create().add(EScript.create().source("haxedom.js"))).add(EBody.create().add(domElem));
		trace(HTMLSerializer.run(html));
		#end
	}
	
}