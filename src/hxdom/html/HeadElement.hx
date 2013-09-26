package hxdom.html;

#if js
typedef HeadElement = js.html.HeadElement;
#else
class HeadElement extends Element {
	
	/** The URIs of one or more metadata profiles (white space separated). 

<span class="deprecatedInlineTemplate" title="(Firefox 4 / Thunderbird 3.3 / SeaMonkey 2.1)
">Deprecated since Gecko 2.0</span>

 

<span title="(Firefox 7.0 / Thunderbird 7.0 / SeaMonkey 2.4)
">Obsolete since Gecko 7.0</span> */
	public var profile:String;
	
}
#end