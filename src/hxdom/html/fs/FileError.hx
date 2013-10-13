/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.html.fs;

import hxdom.html.Element;
import hxdom.html.NodeList;

#if js
typedef FileError = js.html.fs.FileError;
#else
class FileError {
	
	/** The file operation was aborted, probably due to a call to the <code>FileReader</code> <code>abort()</code>&nbsp;method. */
	public static inline var ABORT_ERR : Int = 3;

	/** The file data cannot be accurately represented in a data URL. */
	public static inline var ENCODING_ERR : Int = 5;

	public static inline var INVALID_MODIFICATION_ERR : Int = 9;

	public static inline var INVALID_STATE_ERR : Int = 7;

	/** File not found. */
	public static inline var NOT_FOUND_ERR : Int = 1;

	/** File could not be read. */
	public static inline var NOT_READABLE_ERR : Int = 4;

	public static inline var NO_MODIFICATION_ALLOWED_ERR : Int = 6;

	public static inline var PATH_EXISTS_ERR : Int = 12;

	public static inline var QUOTA_EXCEEDED_ERR : Int = 10;

	/** The file could not be accessed for security reasons. */
	public static inline var SECURITY_ERR : Int = 2;

	public static inline var SYNTAX_ERR : Int = 8;

	public static inline var TYPE_MISMATCH_ERR : Int = 11;

	/** The <a title="en/nsIDOMFileError#Error codes" rel="internal" href="https://developer.mozilla.org/en/nsIDOMFileError#Error_codes">error code</a>. */
	public var code(default,null) : Int;
	
}
#end