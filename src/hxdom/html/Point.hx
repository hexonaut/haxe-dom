package hxdom;

#if js
typedef Point = js.html.Point;
#else
class Point {
	
	public var x : Float;

	public var y : Float;

	/** <p>Creates a new <code>Point</code> object.</p>
<pre>let p = new Point(x, y);
</pre>
<p>The new point, <code>p</code>, has the specified X&nbsp;and Y&nbsp;coordinates.</p> */
	public function new( ?arg0 : Dynamic, ?arg1 : Dynamic ) {
		
	}
	
}
#end