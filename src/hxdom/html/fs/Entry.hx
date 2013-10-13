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
typedef Entry = js.html.fs.Entry;
#else
class Entry {
	
	/** The file system on which the entry resides. */
	public var filesystem(default,null) : FileSystem;

	public var fullPath(default,null) : String;

	/** The entry is a directory. */
	public var isDirectory(default,null) : Bool;

	/** The entry is a file. */
	public var isFile(default,null) : Bool;

	/** The name of the entry, excluding the path leading to it. */
	public var name(default,null) : String;

	public function copyTo( parent : DirectoryEntry, ?name : String, ?successCallback : EntryCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}

	public function getMetadata( successCallback : MetadataCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}

	public function getParent( ?successCallback : EntryCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}

	public function moveTo( parent : DirectoryEntry, ?name : String, ?successCallback : EntryCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}

	public function remove( successCallback : hxdom.html.VoidCallback, ?errorCallback : ErrorCallback ) : Void {
		
	}

	public function toURL() : String {
		return null;
	}
	
}
#end