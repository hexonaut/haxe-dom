package hxdom.html.rtc;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef LocalMediaStream = js.html.rtc.LocalMediaStream;
#else
class LocalMediaStream extends MediaStream {
	
	public function stop() : Void {
		
	}
	
}
#end