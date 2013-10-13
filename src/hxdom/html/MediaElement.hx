/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.html;

#if js
typedef MediaElement = js.html.MediaElement;
#else
class MediaElement extends Element {
	
	/** Data is available for the current playback position, but not enough to actually play more than one frame. */
	public static inline var HAVE_CURRENT_DATA:Int = 2;

	/** Enough data is available—and the download rate is high enough—that the media can be played through to the end without interruption. */
	public static inline var HAVE_ENOUGH_DATA:Int = 4;

	/** Data for the current playback position as well as for at least a little bit of time into the future is available (in other words, at least two frames of video, for example). */
	public static inline var HAVE_FUTURE_DATA:Int = 3;

	/** Enough of the media resource has been retrieved that the metadata attributes are initialized.&nbsp; Seeking will no longer raise an exception. */
	public static inline var HAVE_METADATA:Int = 1;

	/** No information is available about the media resource. */
	public static inline var HAVE_NOTHING:Int = 0;

	public static inline var NETWORK_EMPTY:Int = 0;

	public static inline var NETWORK_IDLE:Int = 1;

	public static inline var NETWORK_LOADING:Int = 2;

	public static inline var NETWORK_NO_SOURCE:Int = 3;

	public var audioDecodedByteCount(default, null):Int;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/video#attr-autoplay">autoplay</a></code>
 HTML&nbsp;attribute, indicating whether to begin playing as soon as enough media is available. */
	public var autoplay:Bool;

	/** The ranges of the media source that the browser has buffered, if any. */
	public var buffered(default, null):TimeRanges;

	public var closedCaptionsVisible:Bool;

	public var controller:MediaController;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/video#attr-controls">controls</a></code>
 HTML attribute, indicating whether user interface items for controlling the resource should be displayed. */
	public var controls:Bool;

	/** The absolute URL of the chosen media resource (if, for example, the server selects a media file based on the resolution of the user's display), or an empty string if the <code>networkState</code> is <code>EMPTY</code>. */
	public var currentSrc(default, null):String;

	/** The current playback time, in seconds.&nbsp; Setting this value seeks the media to the new time. Setter throws DOMException. */
	public var currentTime:Float;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/video#attr-muted">muted</a></code>
 HTML attribute, indicating whether the media element's audio output should be muted by default. Changing the value dynamically will not unmute the audio (it only controls the default state). */
	public var defaultMuted:Bool;

	/** The default playback rate for the media.&nbsp; The Ogg backend does not support this.&nbsp; 1.0 is "normal speed," values lower than 1.0 make the media play slower than normal, higher values make it play faster.&nbsp; The value 0.0 is invalid and throws a <code>NOT_SUPPORTED_ERR</code>&nbsp;exception. */
	public var defaultPlaybackRate:Float;

	/** The length of the media in seconds, or zero if no media data is available.&nbsp; If the media data is available but the length is unknown, this value is <code>NaN</code>.&nbsp; If the media is streamed and has no predefined length, the value is <code>Inf</code>. */
	public var duration(default, null):Float;

	/** Indicates whether the media element has ended playback. */
	public var ended(default, null):Bool;

	/** The media error object for the most recent error, or null if there has not been an error. */
	public var error(default, null):MediaError;

	public var hasClosedCaptions(default, null):Bool;

	public var initialTime(default, null):Float;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/video#attr-loop">loop</a></code>
 HTML&nbsp;attribute, indicating whether the media element should start over when it reaches the end. */
	public var loop:Bool;

	public var mediaGroup:String;

	/** <code>true</code> if the audio is muted, and <code>false</code> otherwise. */
	public var muted:Bool;

	/** <p>The current state of fetching the media over the network.</p> <table class="standard-table"> <tbody> <tr> <td class="header">Constant</td> <td class="header">Value</td> <td class="header">Description</td> </tr> <tr> <td><code>EMPTY</code></td> <td>0</td> <td>There is no data yet.&nbsp; The <code>readyState</code> is also <code>HAVE_NOTHING</code>.</td> </tr> <tr> <td><code>LOADING</code></td> <td>1</td> <td>The media is loading.</td> </tr> <tr> <td><code>LOADED_METADATA</code></td> <td>2</td> <td>The media's metadata has been loaded.</td> </tr> <tr> <td><code>LOADED_FIRST_FRAME</code></td> <td>3</td> <td>The media's first frame has been loaded.</td> </tr> <tr> <td><code>LOADED</code></td> <td>4</td> <td>The media has been fully loaded.</td> </tr> </tbody> </table> */
	public var networkState(default, null):Int;

	public var onkeyadded:EventListener;

	public var onkeyerror:EventListener;

	public var onkeymessage:EventListener;

	public var onneedkey:EventListener;

	/** Indicates whether the media element is paused. */
	public var paused(default, null):Bool;

	/** The current rate at which the media is being played back. This is used to implement user controls for fast forward, slow motion, and so forth. The normal playback rate is multiplied by this value to obtain the current rate, so a value of 1.0 indicates normal speed.&nbsp; Not supported by the Ogg backend. */
	public var playbackRate:Float;

	/** The ranges of the media source that the browser has played, if any. */
	public var played(default, null):TimeRanges;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/video#attr-preload">preload</a></code>
 HTML attribute, indicating what data should be preloaded at page-load time, if any. */
	public var preload:String;

	public var preservesPitch:Bool;

	/** <p>The readiness state of the media:</p> <table class="standard-table"> <tbody> <tr> <td class="header">Constant</td> <td class="header">Value</td> <td class="header">Description</td> </tr> <tr> <td><code>HAVE_NOTHING</code></td> <td>0</td> <td>No information is available about the media resource.</td> </tr> <tr> <td><code>HAVE_METADATA</code></td> <td>1</td> <td>Enough of the media resource has been retrieved that the metadata attributes are initialized.&nbsp; Seeking will no longer raise an exception.</td> </tr> <tr> <td><code>HAVE_CURRENT_DATA</code></td> <td>2</td> <td>Data is available for the current playback position, but not enough to actually play more than one frame.</td> </tr> <tr> <td><code>HAVE_FUTURE_DATA</code></td> <td>3</td> <td>Data for the current playback position as well as for at least a little bit of time into the future is available (in other words, at least two frames of video, for example).</td> </tr> <tr> <td><code>HAVE_ENOUGH_DATA</code></td> <td>4</td> <td>Enough data is available—and the download rate is high enough—that the media can be played through to the end without interruption.</td> </tr> </tbody> </table> */
	public var readyState(default, null):Int;

	/** The time ranges that the user is able to seek to, if any. */
	public var seekable(default, null):TimeRanges;

	/** Indicates whether the media is in the process of seeking to a new position. */
	public var seeking(default, null):Bool;

	/** Reflects the 

<code><a rel="custom" href="https://developer.mozilla.org/en/HTML/Element/video#attr-src">src</a></code>
 HTML attribute, containing the URL of a media resource to use. */
	public var src:String;

	/** The earliest possible position in the media, in seconds. */
	public var startTime(default, null):Float;

	public var textTracks(default, null):TextTrackList;

	public var videoDecodedByteCount(default, null):Int;

	/** The audio volume, from 0.0 (silent) to 1.0 (loudest). Setter throws DOMException. */
	public var volume:Float;

	public function addKey (keySystem:String, key:Uint8Array, ?initData:Uint8Array, sessionId:String):Void {
		
	}

	public function addTextTrack (kind:String, ?label:String, ?language:String):TextTrack {
		return null;
	}

	public function canPlayType (type:String, ?keySystem:String):String {
		return null;
	}

	public function cancelKeyRequest (keySystem:String, sessionId:String):Void {
		
	}

	public function generateKeyRequest (keySystem:String, ?initData:Uint8Array):Void {
		
	}

	public function load ():Void {
		
	}

	public function pause ():Void {
		
	}

	public function play ():Void {
		
	}
	
}
#end