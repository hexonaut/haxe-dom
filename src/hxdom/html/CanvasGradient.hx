package hxdom.html;

#if js
typedef CanvasGradient = js.html.CanvasGradient;
#else
class CanvasGradient {
	
	public function addColorStop( offset : Float, color : String ) : Void {
		
	}
	
}
#end