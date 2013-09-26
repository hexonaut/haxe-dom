package hxdom;

#if js
typedef AudioElement = js.html.AudioElement;
#else
class AudioElement extends MediaElement {
	
	public function new () {
		
	}
	
}
#end