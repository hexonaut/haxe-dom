package ;

import haxe.Serializer;
import haxe.Timer;
import hxdom.Attr;
import hxdom.HTMLSerializer;
import hxdom.js.Boot;
import hxdom.Elements;
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
		#else
		var domElem = DivSubclass.create(EDiv.create()).classes("class1").classes("class2").attr(id, "asdf").addText("Testing");
		domElem.listenToSomeEvent();
		var body = EBody.create().add(domElem);
		var html = EHtml.create().add(EHead.create().add(EScript.create().attr(src, "shiv.js").attr(defer, true)).add(EScript.create().attr(src, "haxedom.js").attr(defer, true))).add(body);
		
		for (i in 0 ... 100) {
			body.add(EDiv.create().attr(id, "id" + i).add(new EAnchor().classes("link-profile").addText("PROFILE " + i)));
		}
		
		var numRuns = 1000;
		
		var mark = Timer.stamp();
		for (i in 0 ... numRuns) {
			HTMLSerializer.run(html);
		}
		trace("HTMLSerializer: " + (Timer.stamp() - mark) * 1000 / numRuns);
		
		Serializer.USE_CACHE = true;
		mark = Timer.stamp();
		for (i in 0 ... numRuns) {
			Serializer.run(html);
		}
		trace("Serializer: " + (Timer.stamp() - mark) * 1000 / numRuns);
		#end
	}
	
}