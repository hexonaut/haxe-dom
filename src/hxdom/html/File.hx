package hxdom.html;

#if js
typedef File = js.html.File;
#else
class File extends Blob {
	
	public var lastModifiedDate(default,null) : Date;

	/** The name of the file referenced by the <code>File</code> object. <strong>Read only.</strong> 
<span title="(Firefox 3.6 / Thunderbird 3.1 / Fennec 1.0)
">Requires Gecko 1.9.2</span> */
	public var name(default,null) : String;

	public var relativePath(default,null) : String;
	
}
#end