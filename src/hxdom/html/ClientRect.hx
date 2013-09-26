package hxdom;

#if js
typedef ClientRect = js.html.ClientRect;
#else
class ClientRect {
	
	/** Y-coordinate, relative to the viewport origin, of the bottom of the rectangle box. <strong>Read only.</strong> */
	public var bottom(default, null):Float;

	/** Height of the rectangle box (This is identical to <code>bottom</code> minus <code>top</code>). <strong>Read only.</strong> */
	public var height(default, null):Float;

	/** X-coordinate, relative to the viewport origin, of the left of the rectangle box. <strong>Read only.</strong> */
	public var left(default, null):Float;

	/** X-coordinate, relative to the viewport origin, of the right of the rectangle box. <strong>Read only.</strong> */
	public var right(default, null):Float;

	/** Y-coordinate, relative to the viewport origin, of the top of the rectangle box. <strong>Read only.</strong> */
	public var top(default, null):Float;

	/** Width of the rectangle box (This is identical to <code>right</code> minus <code>left</code>). <strong>Read only.</strong> 
<span title="(Firefox 3.5 / Thunderbird 3.0 / SeaMonkey 2.0)
">Requires Gecko 1.9.1</span> */
	public var width(default, null):Float;
	
}
#end