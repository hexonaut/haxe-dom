package hxdom;

import hxdom.html.BodyElement;
import hxdom.html.HeadElement;
import hxdom.html.HtmlElement;
import hxdom.html.ScriptElement;
import hxdom.macro.DOM;

/**
 * Various thin wrappers for common elements that usually don't require customization.
 * 
 * @author Sam MacPherson
 */

class Text extends hxdom.html.Text implements DOM {

	public function new (txt:String) {
		this.data = txt;
	}
	
}

class EHtml extends HtmlElement implements DOM {

	public function new () {
	}
	
}

class EHead extends HeadElement implements DOM {

	public function new () {
	}
	
}

class EBody extends BodyElement implements DOM {

	public function new () {
	}
	
}

class EScript extends ScriptElement implements DOM {

	public function new () {
	}
	
}