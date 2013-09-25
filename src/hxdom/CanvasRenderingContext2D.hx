package hxdom;

#if js
typedef CanvasRenderingContext2D = js.html.CanvasRenderingContext2D;
#else
class CanvasRenderingContext2D extends CanvasRenderingContext {
	
	public var backingStorePixelRatio(default, null):Float;

	/** Color or style to use inside shapes. Default <code>#000</code> (black). */
	public var fillStyle:Dynamic;

	/** Default value <code>10px sans-serif</code>. */
	public var font:String;

	/** Alpha value that is applied to shapes and images before they are composited onto the canvas. Default <code>1.0</code> (opaque). */
	public var globalAlpha:Float;

	/** With <code>globalAplpha</code> applied this sets how shapes and images are drawn onto the existing bitmap. Possible values: <ul> <li><code>source-atop</code></li> <li><code>source-in</code></li> <li><code>source-out</code></li> <li><code>source-over</code> (default)</li> <li><code>destination-atop</code></li> <li><code>destination-in</code></li> <li><code>destination-out</code></li> <li><code>destination-over</code></li> <li><code>lighter</code></li> <li><code>xor</code></li> </ul> */
	public var globalCompositeOperation:String;

	public var imageSmoothingEnabled:Bool;

	/** Type of endings on the end of lines. Possible values: <code>butt</code> (default), <code>round</code>, <code>square</code> */
	public var lineCap:String;

	public var lineDash:Array<Dynamic>;

	public var lineDashOffset:Float;

	/** Defines the type of corners where two lines meet. Possible values: <code>round</code>, <code>bevel</code>, <code>miter</code> (default) */
	public var lineJoin:String;

	/** Width of lines. Default <code>1.0</code> */
	public var lineWidth:Float;

	/** Default <code>10</code>. */
	public var miterLimit:Float;

	/** Specifies the blurring effect. Default <code>0</code> */
	public var shadowBlur:Float;

	/** Color of the shadow. Default fully-transparent black. */
	public var shadowColor:String;

	/** Horizontal distance the shadow will be offset. Default 0. */
	public var shadowOffsetX:Float;

	/** Vertical distance the shadow will be offset. Default 0. */
	public var shadowOffsetY:Float;

	/** Color or style to use for the lines around shapes. Default <code>#000</code> (black). */
	public var strokeStyle:Dynamic;

	/** Possible values: <code>start</code> (default), <code>end</code>, <code>left</code>, <code>right</code> or <code>center</code>. */
	public var textAlign:String;

	public var textBaseline:String;

	public function arc (x:Float, y:Float, radius:Float, startAngle:Float, endAngle:Float, anticlockwise:Bool ):Void {
		
	}

	public function arcTo (x1:Float, y1:Float, x2:Float, y2:Float, radius:Float ):Void {
		
	}

	public function beginPath ():Void {
		
	}

	public function bezierCurveTo (cp1x:Float, cp1y:Float, cp2x:Float, cp2y:Float, x:Float, y:Float ):Void {
		
	}

	public function clearRect (x:Float, y:Float, width:Float, height:Float ):Void {
		
	}

	public function clearShadow ():Void {
		
	}

	public function clip ():Void {
		
	}

	public function closePath ():Void {
		
	}

	/** Throws DOMException. */
	@:overload( function( imagedata:ImageData ) :ImageData {
		
	} )
	public function createImageData (sw:Float, sh:Float ):ImageData {
		
	}

	public function createLinearGradient (x0:Float, y0:Float, x1:Float, y1:Float ):CanvasGradient {
		
	}

	/** <div id="section_31"><span id="Parameters_10"></span><h6 class="editable">Parameters</h6>
<dl> <dt><code>image</code></dt> <dd>A DOM <code><a rel="custom" href="https://developer.mozilla.org/en/DOM/element">element</a></code>
 to use as the source image for the pattern. This can be any element, although typically you'll use an <code><a rel="internal" href="https://developer.mozilla.org/Article_not_found?uri=en/DOM/Image" class="new">Image</a></code>
 or <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/canvas">&lt;canvas&gt;</a></code>
.</dd> <dt><code>repetition</code></dt> <dd>?</dd>
</dl>
</div><div id="section_32"><span id="Return_value_3"></span><h6 class="editable">Return value</h6>
<p>A new DOM canvas pattern object for use in pattern-based operations.</p>
</div><div id="section_33"><span id="Exceptions_thrown"></span><h6 class="editable">Exceptions thrown</h6>
<dl> <dt><code>NS_ERROR_DOM_INVALID_STATE_ERR</code> 
<span title="(Firefox 10.0 / Thunderbird 10.0)
">Requires Gecko 10.0</span>
</dt> <dd>The specified <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/canvas">&lt;canvas&gt;</a></code>
 element for the <code>image</code> parameter is zero-sized (that is, one or both of its dimensions are 0 pixels).</dd>
</dl>
</div> Throws DOMException. */
	@:overload( function( canvas:CanvasElement, repetitionType:String ) :CanvasPattern {} )
	public function createPattern (image:ImageElement, repetitionType:String ):CanvasPattern {
		
	}

	public function createRadialGradient (x0:Float, y0:Float, r0:Float, x1:Float, y1:Float, r1:Float ):CanvasGradient {
		
	}

	/** <p>Draws the specified image. This method is available in multiple formats, providing a great deal of flexibility in its use.</p>

<div id="section_41"><span id="Parameters_13"></span><h6 class="editable">Parameters</h6>
<dl> <dt><code>image</code></dt> <dd>An element to draw into the context; the specification permits any image element (that is, <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/img">&lt;img&gt;</a></code>
, <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/canvas">&lt;canvas&gt;</a></code>
, and <code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/video">&lt;video&gt;</a></code>
). Some browsers, including Firefox, let you use any arbitrary element.</dd> <dt><code>dx</code></dt> <dd>The X coordinate in the destination canvas at which to place the top-left corner of the source <code>image</code>.</dd> <dt><code>dy</code></dt> <dd>The Y coordinate in the destination canvas at which to place the top-left corner of the source <code>image</code>.</dd> <dt><code>dw</code></dt> <dd>The width to draw the <code>image</code> in the destination canvas. This allows scaling of the drawn image. If not specified, the image is not scaled in width when drawn.</dd> <dt><code>dh</code></dt> <dd>The height to draw the <code>image</code> in the destination canvas. This allows scaling of the drawn image. If not specified, the image is not scaled in height when drawn.</dd> <dt><code>sx</code></dt> <dd>The X coordinate of the top left corner of the sub-rectangle of the source image to draw into the destination context.</dd> <dt><code>sy</code></dt> <dd>The Y coordinate of the top left corner of the sub-rectangle of the source image to draw into the destination context.</dd> <dt><code>sw</code></dt> <dd>The width of the sub-rectangle of the source image to draw into the destination context. If not specified, the entire rectangle from the coordinates specified by <code>sx</code> and <code>sy</code> to the bottom-right corner of the image is used. If you specify a negative value, the image is flipped horizontally when drawn.</dd> <dt><code>sh</code></dt> <dd>The height of the sub-rectangle of the source image to draw into the destination context. If you specify a negative value, the image is flipped vertically when drawn.</dd>
</dl>
<p>The diagram below illustrates the meanings of the various parameters.</p>
<p><img alt="drawImage.png" class="internal default" src="https://developer.mozilla.org/@api/deki/files/5494/=drawImage.png"></p>
</div><div id="section_42"><span id="Exceptions_thrown_2"></span><h6 class="editable">Exceptions thrown</h6>
<dl> <dt><code>INDEX_SIZE_ERR</code></dt> <dd>If the canvas or source rectangle width or height is zero.</dd> <dt><code>INVALID_STATE_ERR</code></dt> <dd>The image has no image data.</dd> <dt><code>TYPE_MISMATCH_ERR</code></dt> <dd>The specified source element isn't supported. This is not thrown by Firefox, since any element may be used as a source image.</dd>
</dl>
</div><div id="section_43"><span id="Compatibility_notes"></span><h6 class="editable">Compatibility notes</h6>
<ul> <li>Prior to Gecko 7.0 (Firefox 7.0 / Thunderbird 7.0 / SeaMonkey 2.4)
, Firefox threw an exception if any of the coordinate values was non-finite or zero. As per the specification, this no longer happens.</li> <li>Support for flipping the image by using negative values for <code>sw</code> and <code>sh</code> was added in Gecko 5.0 (Firefox 5.0 / Thunderbird 5.0 / SeaMonkey 2.2)
.</li> <li>Gecko 9.0 (Firefox 9.0 / Thunderbird 9.0 / SeaMonkey 2.6)
 now correctly supports CORS for drawing images across domains without <a title="en/CORS_Enabled_Image#What_is_a_.22tainted.22_canvas.3F" rel="internal" href="https://developer.mozilla.org/en/CORS_Enabled_Image#What_is_a_.22tainted.22_canvas.3F">tainting the canvas</a>.</li>
</ul>
</div> Throws DOMException. */
	@:overload( function( image:ImageElement, x:Float, y:Float ) :Void {} )
	@:overload( function( image:ImageElement, x:Float, y:Float, width:Float, height:Float ) :Void {} )
	@:overload( function( image:ImageElement, sx:Float, sy:Float, sw:Float, sh:Float, dx:Float, dy:Float, dw:Float, dh:Float ) :Void {} )
	@:overload( function( canvas:CanvasElement, x:Float, y:Float ) :Void {} )
	@:overload( function( canvas:CanvasElement, x:Float, y:Float, width:Float, height:Float ) :Void {} )
	@:overload( function( canvas:CanvasElement, sx:Float, sy:Float, sw:Float, sh:Float, dx:Float, dy:Float, dw:Float, dh:Float ) :Void {} )
	@:overload( function( video:VideoElement, x:Float, y:Float ) :Void {} )
	@:overload( function( video:VideoElement, x:Float, y:Float, width:Float, height:Float ) :Void {
		
	} )
	public function drawImage (video:VideoElement, sx:Float, sy:Float, sw:Float, sh:Float, dx:Float, dy:Float, dw:Float, dh:Float ):Void {
		
	}

	public function drawImageFromRect (image:ImageElement, ?sx:Float, ?sy:Float, ?sw:Float, ?sh:Float, ?dx:Float, ?dy:Float, ?dw:Float, ?dh:Float, ?compositeOperation:String ):Void {
		
	}

	public function fill ():Void {
		
	}

	public function fillRect (x:Float, y:Float, width:Float, height:Float ):Void {
		
	}

	public function fillText (text:String, x:Float, y:Float, ?maxWidth:Float ):Void {
		
	}

	public function getImageData (sx:Float, sy:Float, sw:Float, sh:Float ):ImageData {
		
	}

	public function getImageDataHD (sx:Float, sy:Float, sw:Float, sh:Float ):ImageData {
		
	}

	public function getLineDash ():Array<Float> {
		
	}

	public function isPointInPath (x:Float, y:Float ):Bool {
		
	}

	public function lineTo (x:Float, y:Float ):Void {
		
	}

	public function measureText (text:String ):TextMetrics {
		
	}

	public function moveTo (x:Float, y:Float ):Void {
		
	}

	/** <h6 class="editable">Compatibility notes</h6>
<ul> <li>Starting in Gecko 10.0 (Firefox 10.0 / Thunderbird 10.0)
, non-finite values to any of these parameters causes the call to putImageData() to be silently ignored, rather than throwing an exception.</li>
</ul> Throws DOMException. */
	@:overload( function( imagedata:ImageData, dx:Float, dy:Float ) :Void {
		
	} )
	public function putImageData (imagedata:ImageData, dx:Float, dy:Float, dirtyX:Float, dirtyY:Float, dirtyWidth:Float, dirtyHeight:Float ):Void {
		
	}

	/** Throws DOMException. */
	@:overload( function( imagedata:ImageData, dx:Float, dy:Float ) :Void {
		
	} )
	public function putImageDataHD (imagedata:ImageData, dx:Float, dy:Float, dirtyX:Float, dirtyY:Float, dirtyWidth:Float, dirtyHeight:Float ):Void {
		
	}

	public function quadraticCurveTo (cpx:Float, cpy:Float, x:Float, y:Float ):Void {
		
	}

	public function rect (x:Float, y:Float, width:Float, height:Float ):Void {
		
	}

	public function restore ():Void {
		
	}

	public function rotate (angle:Float ):Void {
		
	}

	public function save ():Void {
		
	}

	public function scale (sx:Float, sy:Float ):Void {
		
	}

	public function setAlpha (alpha:Float ):Void {
		
	}

	public function setCompositeOperation (compositeOperation:String ):Void {
		
	}

	@:overload( function( color:String, ?alpha:Float ) :Void {} )
	@:overload( function( grayLevel:Float, ?alpha:Float ) :Void {} )
	@:overload( function( r:Float, g:Float, b:Float, a:Float ) :Void {} )
	public function setFillColor (c:Float, m:Float, y:Float, k:Float, a:Float ):Void {
		
	}

	public function setLineCap (cap:String ):Void {
		
	}

	public function setLineDash (dash:Array<Float> ):Void {
		
	}

	public function setLineJoin (join:String ):Void {
		
	}

	public function setLineWidth (width:Float ):Void {
		
	}

	public function setMiterLimit (limit:Float ):Void {
		
	}

	@:overload( function( width:Float, height:Float, blur:Float, ?color:String, ?alpha:Float ) :Void {} )
	@:overload( function( width:Float, height:Float, blur:Float, grayLevel:Float, ?alpha:Float ) :Void {} )
	@:overload( function( width:Float, height:Float, blur:Float, r:Float, g:Float, b:Float, a:Float ) :Void {} )
	public function setShadow (width:Float, height:Float, blur:Float, c:Float, m:Float, y:Float, k:Float, a:Float ):Void {
		
	}

	@:overload( function( color:String, ?alpha:Float ) :Void {} )
	@:overload( function( grayLevel:Float, ?alpha:Float ) :Void {} )
	@:overload( function( r:Float, g:Float, b:Float, a:Float ) :Void {} )
	public function setStrokeColor (c:Float, m:Float, y:Float, k:Float, a:Float ):Void {
		
	}

	public function setTransform (m11:Float, m12:Float, m21:Float, m22:Float, dx:Float, dy:Float ):Void {
		
	}

	public function stroke ():Void {
		
	}

	public function strokeRect (x:Float, y:Float, width:Float, height:Float, ?lineWidth:Float ):Void {
		
	}

	public function strokeText (text:String, x:Float, y:Float, ?maxWidth:Float ):Void {
		
	}

	public function transform (m11:Float, m12:Float, m21:Float, m22:Float, dx:Float, dy:Float ):Void {
		
	}

	public function translate (tx:Float, ty:Float ):Void {
		
	}
	
}
#end