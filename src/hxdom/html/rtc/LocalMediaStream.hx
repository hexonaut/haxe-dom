package hxdom.rtc;

import hxdom.Element;
import hxdom.NodeList;

#if js
typedef LocalMediaStream = js.html.rtc.LocalMediaStream;
#else
class LocalMediaStream extends MediaStream {
	
	public function stop() : Void {
		
	}
	
}
#end