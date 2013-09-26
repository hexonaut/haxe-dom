package hxdom;

#if js
typedef ImageElement = js.html.ImageElement;
#else
class ImageElement extends Element {
	
	/** Indicates the alignment of the image with respect to the surrounding context. */
	public var align:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/img#attr-alt">alt</a></code>
 HTML attribute, indicating fallback context for the image. */
	public var alt:String;

	/** Width of the border around the image. */
	public var border:String;

	/** True if the browser has fetched the image, and it is in a <a title="en/HTML/Element/Img#Image Format" rel="internal" href="https://developer.mozilla.org/En/HTML/Element/Img#Image_Format">supported image type</a> that was decoded without errors. */
	public var complete(default, null):Bool;

	/** The CORS setting for this image element. See <a title="en/HTML/CORS settings attributes" rel="internal" href="https://developer.mozilla.org/en/HTML/CORS_settings_attributes">CORS&nbsp;settings attributes</a> for details. */
	public var crossOrigin:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/img#attr-height">height</a></code>
 HTML attribute, indicating the rendered height of the image in CSS&nbsp;pixels. */
	public var height:Int;

	/** Space to the left and right of the image. */
	public var hspace:Int;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/img#attr-ismap">ismap</a></code>
 HTML attribute, indicating that the image is part of a server-side image map. */
	public var isMap:Bool;

	/** URI of a long description of the image. */
	public var longDesc:String;

	/** A reference to a low-quality (but faster to load) copy of the image. */
	public var lowsrc:String;

	public var name:String;

	/** Intrinsic height of the image in CSS&nbsp;pixels, if it is available; otherwise, 0. */
	public var naturalHeight(default, null):Int;

	/** Intrinsic width of the image in CSS&nbsp;pixels, if it is available; otherwise, 0. */
	public var naturalWidth(default, null):Int;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element#attr-src">src</a></code>
 HTML attribute, containing the URL of the image. */
	public var src:String;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/img#attr-usemap">usemap</a></code>
 HTML attribute, containing a partial URL of a map element. */
	public var useMap:String;

	/** Space above and below the image. */
	public var vspace:Int;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/img#attr-width">width</a></code>
 HTML attribute, indicating the rendered width of the image in CSS&nbsp;pixels. */
	public var width:Int;

	public var x(default, null):Int;

	public var y(default, null):Int;
	
}
#end