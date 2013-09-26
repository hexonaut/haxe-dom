package hxdom;

#if js
typedef VideoElement = js.html.VideoElement;
#else
class VideoElement extends MediaElement {
	
	public var decodedFrameCount(default, null):Int;

	public var displayingFullscreen(default, null):Bool;

	public var droppedFrameCount(default, null):Int;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/video#attr-height">height</a></code>
 HTML attribute, which specifies the height of the display area, in CSS pixels. */
	public var height:Int;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/video#attr-poster">poster</a></code>
 HTML&nbsp;attribute, which specifies an image to show while no video data is available. */
	public var poster:String;

	public var supportsFullscreen(default, null):Bool;

	/** The intrinsic height of the resource in CSS pixels, taking into account the dimensions, aspect ratio, clean aperture, resolution, and so forth, as defined for the format used by the resource. If the element's ready state is HAVE_NOTHING, the value is 0. */
	public var videoHeight(default, null):Int;

	/** The intrinsic width of the resource in CSS pixels, taking into account the dimensions, aspect ratio, clean aperture, resolution, and so forth, as defined for the format used by the resource. If the element's ready state is HAVE_NOTHING, the value is 0. */
	public var videoWidth(default, null):Int;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/video#attr-width">width</a></code>
&nbsp;HTML&nbsp;attribute, which specifies the width of the display area, in CSS pixels. */
	public var width:Int;

	public function enterFullScreen ():Void {
		
	}

	public function enterFullscreen ():Void {
		
	}

	public function exitFullScreen ():Void {
		
	}

	public function exitFullscreen ():Void {
		
	}
	
}
#end