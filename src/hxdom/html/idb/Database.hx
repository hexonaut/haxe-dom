/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom.html.idb;

import hxdom.html.Element;
import hxdom.html.EventTarget;
import hxdom.html.NodeList;

#if js
typedef Database = js.html.idb.Database;
#else
class Database extends EventTarget {
	
	/** Name of the connected database. */
	public var name(default,null) : String;

	/** A list of the names of the <a title="en/IndexedDB#gloss object store" rel="internal" href="https://developer.mozilla.org/en/IndexedDB#gloss_object_store">object stores</a> currently in the connected database. */
	public var objectStoreNames(default,null) : hxdom.html.DOMStringList;

	public var onabort : hxdom.html.EventListener;

	public var onerror : hxdom.html.EventListener;

	public var onversionchange : hxdom.html.EventListener;

	/** The version of the connected database. When a database is first created, this attribute is the empty string. */
	public var version(default,null) : Any;

	public function close() : Void {
		
	}

	public function createObjectStore( name : String, ?options : Dynamic ) : ObjectStore {
		return null;
	}

	public function deleteObjectStore( name : String ) : Void {
		
	}

	public function setVersion( version : String ) : VersionChangeRequest {
		return null;
	}

	/** <p>Immediately returns an <a title="en/IndexedDB/IDBTransaction" rel="internal" href="https://developer.mozilla.org/en/IndexedDB/IDBTransaction">IDBTransaction</a> object, and starts a transaction in a separate thread. &nbsp;The method returns a transaction object (<a title="en/IndexedDB/IDBTransaction" rel="internal" href="https://developer.mozilla.org/en/IndexedDB/IDBTransaction"><code>IDBTransaction</code></a>) containing the <a title="en/IndexedDB/IDBTransaction#objectStore()" rel="internal" href="https://developer.mozilla.org/en/IndexedDB/IDBTransaction#objectStore()">objectStore()</a> method, which you can use to access your object store.&nbsp;</p>

<div id="section_22"><span id="Parameters_4"></span><h5 class="editable">Parameters</h5>
<dl> <dt>storeNames</dt> <dd>The names of object stores and indexes that are in the scope of the new transaction. Specify only the object stores that you need to access.</dd> <dt>mode</dt> <dd><em>Optional</em>. The types of access that can be performed in the transaction. Transactions are opened in one of three modes: <code>READ_ONLY</code>, <code>READ_WRITE</code>, and <code>VERSION_CHANGE</code>. If you don't provide the parameter, the default access mode is <code>READ_ONLY</code>. To avoid slowing things down, don't open a <code>READ_WRITE</code> transaction, unless you actually need to write into the database.</dd>
</dl>
</div><div id="section_23"><span id="Sample_code"></span><h5 class="editable">Sample code</h5>
<p>To start a transaction with the following scope, you can use the code snippets in the table. As noted earlier:</p>
<ul> <li>Add prefixes to the methods in WebKit browsers, (that is, instead of <code>IDBTransaction.READ_ONLY</code>, use <code>webkitIDBTransaction.READ_ONLY</code>).</li> <li>The default mode is <code>READ_ONLY</code>, so you don't really have to specify it. Of course, if you need to write into the object store, you can open the transaction in the <code>READ_WRITE</code> mode.</li>
</ul>
<table class="standard-table"> <thead> <tr> <th scope="col" width="185">Scope</th> <th scope="col" width="1018">Code</th> </tr> <tr> <td>Single object store</td> <td> <p><code>var transaction = db.transaction(['my-store-name'], IDBTransaction.READ_ONLY); </code></p> <p>Alternatively:</p> <p><code>var transaction = db.transaction('my-store-name', IDBTransaction.READ_ONLY);</code></p> </td> </tr> <tr> <td>Multiple object stores</td> <td><code>var transaction = db.transaction(['my-store-name', 'my-store-name2'], IDBTransaction.READ_ONLY);</code></td> </tr> <tr> <td>All object stores</td> <td> <p><code>var transaction = db.transaction(db.objectStoreNames, IDBTransaction.READ_ONLY);</code></p> <p>You cannot pass an empty array into the storeNames parameter, such as in the following: <code>var transaction = db.transaction([], IDBTransaction.READ_ONLY);.</code></p> <div class="warning"><strong>Warning:</strong>&nbsp; Accessing all obejct stores under the <code>READ_WRITE</code> mode means that you can run only that transaction. You cannot have writing transactions with overlapping scopes.</div> </td> </tr> </thead> <tbody> </tbody>
</table>
</div><div id="section_24"><span id="Returns_4"></span><h5 class="editable">Returns</h5>
<dl> <dt><code><a title="en/IndexedDB/IDBTransaction" rel="internal" href="https://developer.mozilla.org/en/IndexedDB/IDBVersionChangeRequest">IDBTransaction</a></code></dt> <dd>The transaction object.</dd>
</dl>
</div><div id="section_25"><span id="Exceptions_3"></span><h5 class="editable">Exceptions</h5>
<p>This method can raise an <a title="en/IndexedDB/IDBDatabaseException" rel="internal" href="https://developer.mozilla.org/en/IndexedDB/IDBDatabaseException">IDBDatabaseException</a> with the following codes:</p>
<table class="standard-table"> <thead> <tr> <th scope="col" width="131">Exception</th> <th scope="col" width="698">Description</th> </tr> </thead> <tbody> <tr> <td><code><a title="en/IndexedDB/DatabaseException#NOT ALLOWED ERR" rel="internal" href="https://developer.mozilla.org/en/IndexedDB/IDBDatabaseException#NOT_ALLOWED_ERR">NOT_ALLOWED_ERR</a></code></td> <td>The error is thrown for one of two reasons: <ul> <li>The <code>close()</code> method has been called on this IDBDatabase instance.</li> <li>The object store has been deleted or removed.</li> </ul> </td> </tr> <tr> <td><code><a title="en/IndexedDB/IDBDatabaseException#NOT FOUND ERR" rel="internal" href="https://developer.mozilla.org/en/IndexedDB/IDBDatabaseException#NOT_FOUND_ERR">NOT_FOUND_ERR</a></code></td> <td>One of the object stores doesn't exist in the connected database.</td> </tr> </tbody>
</table>
</div> Throws DatabaseException. */
	@:overload( function( storeNames : hxdom.html.DOMStringList, mode : String ) :Transaction {} )
	@:overload( function( storeNames : Array<String>, mode : String ) :Transaction {} )
	public function transaction( storeName : String, mode : String ) : Transaction {
		return null;
	}
	
}
#end