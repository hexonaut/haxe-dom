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
typedef DOMCoreException = js.html.DOMCoreException;
#else
class DOMCoreException {
	
	public static inline var ABORT_ERR : Int = 20;

	public static inline var DATA_CLONE_ERR : Int = 25;

	public static inline var DOMSTRING_SIZE_ERR : Int = 2;

	public static inline var HIERARCHY_REQUEST_ERR : Int = 3;

	public static inline var INDEX_SIZE_ERR : Int = 1;

	public static inline var INUSE_ATTRIBUTE_ERR : Int = 10;

	public static inline var INVALID_ACCESS_ERR : Int = 15;

	public static inline var INVALID_CHARACTER_ERR : Int = 5;

	public static inline var INVALID_MODIFICATION_ERR : Int = 13;

	public static inline var INVALID_NODE_TYPE_ERR : Int = 24;

	public static inline var INVALID_STATE_ERR : Int = 11;

	public static inline var NAMESPACE_ERR : Int = 14;

	public static inline var NETWORK_ERR : Int = 19;

	public static inline var NOT_FOUND_ERR : Int = 8;

	public static inline var NOT_SUPPORTED_ERR : Int = 9;

	public static inline var NO_DATA_ALLOWED_ERR : Int = 6;

	public static inline var NO_MODIFICATION_ALLOWED_ERR : Int = 7;

	public static inline var QUOTA_EXCEEDED_ERR : Int = 22;

	public static inline var SECURITY_ERR : Int = 18;

	public static inline var SYNTAX_ERR : Int = 12;

	public static inline var TIMEOUT_ERR : Int = 23;

	public static inline var TYPE_MISMATCH_ERR : Int = 17;

	public static inline var URL_MISMATCH_ERR : Int = 21;

	public static inline var VALIDATION_ERR : Int = 16;

	public static inline var WRONG_DOCUMENT_ERR : Int = 4;

	public var code(default,null) : Int;

	public var message(default,null) : String;

	public var name(default,null) : String;

	public function toString() : String {
		return null;
	}
	
}
#end