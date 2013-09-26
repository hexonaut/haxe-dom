package hxdom;

#if js
typedef Crypto = js.html.Crypto;
#else
class Crypto {
	
	public function getRandomValues( array : ArrayBufferView ) : Void {
		
	}
	
}
#end