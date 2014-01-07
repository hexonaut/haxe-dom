(function () { "use strict";
var $hxClasses = {},$estr = function() { return js.Boot.__string_rec(this,''); };
function $extend(from, fields) {
	function inherit() {}; inherit.prototype = from; var proto = new inherit();
	for (var name in fields) proto[name] = fields[name];
	if( fields.toString !== Object.prototype.toString ) proto.toString = fields.toString;
	return proto;
}
var HxOverrides = function() { }
$hxClasses["HxOverrides"] = HxOverrides;
HxOverrides.__name__ = ["HxOverrides"];
HxOverrides.dateStr = function(date) {
	var m = date.getMonth() + 1;
	var d = date.getDate();
	var h = date.getHours();
	var mi = date.getMinutes();
	var s = date.getSeconds();
	return date.getFullYear() + "-" + (m < 10?"0" + m:"" + m) + "-" + (d < 10?"0" + d:"" + d) + " " + (h < 10?"0" + h:"" + h) + ":" + (mi < 10?"0" + mi:"" + mi) + ":" + (s < 10?"0" + s:"" + s);
}
HxOverrides.strDate = function(s) {
	switch(s.length) {
	case 8:
		var k = s.split(":");
		var d = new Date();
		d.setTime(0);
		d.setUTCHours(k[0]);
		d.setUTCMinutes(k[1]);
		d.setUTCSeconds(k[2]);
		return d;
	case 10:
		var k = s.split("-");
		return new Date(k[0],k[1] - 1,k[2],0,0,0);
	case 19:
		var k = s.split(" ");
		var y = k[0].split("-");
		var t = k[1].split(":");
		return new Date(y[0],y[1] - 1,y[2],t[0],t[1],t[2]);
	default:
		throw "Invalid date format : " + s;
	}
}
HxOverrides.cca = function(s,index) {
	var x = s.charCodeAt(index);
	if(x != x) return undefined;
	return x;
}
HxOverrides.substr = function(s,pos,len) {
	if(pos != null && pos != 0 && len != null && len < 0) return "";
	if(len == null) len = s.length;
	if(pos < 0) {
		pos = s.length + pos;
		if(pos < 0) pos = 0;
	} else if(len < 0) len = s.length + len - pos;
	return s.substr(pos,len);
}
HxOverrides.iter = function(a) {
	return { cur : 0, arr : a, hasNext : function() {
		return this.cur < this.arr.length;
	}, next : function() {
		return this.arr[this.cur++];
	}};
}
var Lambda = function() { }
$hxClasses["Lambda"] = Lambda;
Lambda.__name__ = ["Lambda"];
Lambda.array = function(it) {
	var a = new Array();
	var $it0 = $iterator(it)();
	while( $it0.hasNext() ) {
		var i = $it0.next();
		a.push(i);
	}
	return a;
}
Lambda.list = function(it) {
	var l = new List();
	var $it0 = $iterator(it)();
	while( $it0.hasNext() ) {
		var i = $it0.next();
		l.add(i);
	}
	return l;
}
Lambda.map = function(it,f) {
	var l = new List();
	var $it0 = $iterator(it)();
	while( $it0.hasNext() ) {
		var x = $it0.next();
		l.add(f(x));
	}
	return l;
}
Lambda.mapi = function(it,f) {
	var l = new List();
	var i = 0;
	var $it0 = $iterator(it)();
	while( $it0.hasNext() ) {
		var x = $it0.next();
		l.add(f(i++,x));
	}
	return l;
}
Lambda.has = function(it,elt) {
	var $it0 = $iterator(it)();
	while( $it0.hasNext() ) {
		var x = $it0.next();
		if(x == elt) return true;
	}
	return false;
}
Lambda.exists = function(it,f) {
	var $it0 = $iterator(it)();
	while( $it0.hasNext() ) {
		var x = $it0.next();
		if(f(x)) return true;
	}
	return false;
}
Lambda.foreach = function(it,f) {
	var $it0 = $iterator(it)();
	while( $it0.hasNext() ) {
		var x = $it0.next();
		if(!f(x)) return false;
	}
	return true;
}
Lambda.iter = function(it,f) {
	var $it0 = $iterator(it)();
	while( $it0.hasNext() ) {
		var x = $it0.next();
		f(x);
	}
}
Lambda.filter = function(it,f) {
	var l = new List();
	var $it0 = $iterator(it)();
	while( $it0.hasNext() ) {
		var x = $it0.next();
		if(f(x)) l.add(x);
	}
	return l;
}
Lambda.fold = function(it,f,first) {
	var $it0 = $iterator(it)();
	while( $it0.hasNext() ) {
		var x = $it0.next();
		first = f(x,first);
	}
	return first;
}
Lambda.count = function(it,pred) {
	var n = 0;
	if(pred == null) {
		var $it0 = $iterator(it)();
		while( $it0.hasNext() ) {
			var _ = $it0.next();
			n++;
		}
	} else {
		var $it1 = $iterator(it)();
		while( $it1.hasNext() ) {
			var x = $it1.next();
			if(pred(x)) n++;
		}
	}
	return n;
}
Lambda.empty = function(it) {
	return !$iterator(it)().hasNext();
}
Lambda.indexOf = function(it,v) {
	var i = 0;
	var $it0 = $iterator(it)();
	while( $it0.hasNext() ) {
		var v2 = $it0.next();
		if(v == v2) return i;
		i++;
	}
	return -1;
}
Lambda.concat = function(a,b) {
	var l = new List();
	var $it0 = $iterator(a)();
	while( $it0.hasNext() ) {
		var x = $it0.next();
		l.add(x);
	}
	var $it1 = $iterator(b)();
	while( $it1.hasNext() ) {
		var x = $it1.next();
		l.add(x);
	}
	return l;
}
var List = function() {
	this.length = 0;
};
$hxClasses["List"] = List;
List.__name__ = ["List"];
List.prototype = {
	iterator: function() {
		return { h : this.h, hasNext : function() {
			return this.h != null;
		}, next : function() {
			if(this.h == null) return null;
			var x = this.h[0];
			this.h = this.h[1];
			return x;
		}};
	}
	,remove: function(v) {
		var prev = null;
		var l = this.h;
		while(l != null) {
			if(l[0] == v) {
				if(prev == null) this.h = l[1]; else prev[1] = l[1];
				if(this.q == l) this.q = prev;
				this.length--;
				return true;
			}
			prev = l;
			l = l[1];
		}
		return false;
	}
	,add: function(item) {
		var x = [item];
		if(this.h == null) this.h = x; else this.q[1] = x;
		this.q = x;
		this.length++;
	}
	,__class__: List
}
var Main = function() { }
$hxClasses["Main"] = Main;
Main.__name__ = ["Main"];
Main.main = function() {
	var app = hxdom.js.Boot.init();
	app.threads.addPost(new Post(app.threads.posts[0].post.user,"Right back at yea John! This time from JS!"));
	app.threads.markTextEnds();
}
Main.staticEventListener = function(e) {
	console.log("Static listener");
}
var hxdom = {}
hxdom.VirtualNode = function(node) {
	this.node = node;
	node.__vdom = this;
	this.id = hxdom.VirtualNode.ID++;
};
$hxClasses["hxdom.VirtualNode"] = hxdom.VirtualNode;
hxdom.VirtualNode.__name__ = ["hxdom","VirtualNode"];
hxdom.VirtualNode.buildElement = function(cls,tagName) {
	var elem = js.Browser.document.createElement(tagName);
	return elem;
}
hxdom.VirtualNode.buildText = function(txt) {
	var text = js.Browser.document.createTextNode(txt);
	return text;
}
hxdom.VirtualNode.__super__ = EventTarget;
hxdom.VirtualNode.prototype = $extend(EventTarget.prototype,{
	dispatchEvent: function(event) {
		return this.node.dispatchEvent(event);
	}
	,removeEventListener: function(type,listener,useCapture) {
		if(useCapture == null) useCapture = false;
		this.node.removeEventListener(type,listener,useCapture);
	}
	,addEventListener: function(type,listener,useCapture) {
		if(useCapture == null) useCapture = false;
		this.node.addEventListener(type,listener,useCapture);
	}
	,iterator: function() {
		return new hxdom._Elements.VirtualNodeIterator(this);
	}
	,replaceChild: function(newChild,oldChild) {
		this.node.replaceChild(newChild.node,oldChild.node);
		return oldChild;
	}
	,removeChild: function(oldChild) {
		this.node.removeChild(oldChild.node);
		return oldChild;
	}
	,insertBefore: function(newChild,refChild) {
		this.node.insertBefore(newChild.node,refChild != null?refChild.node:null);
		return newChild;
	}
	,hasChildNodes: function() {
		return this.node.childNodes.length > 0;
	}
	,contains: function(other) {
		return this.node.contains(other.node);
	}
	,appendChild: function(newChild) {
		this.node.appendChild(newChild.node);
		return newChild;
	}
	,__class__: hxdom.VirtualNode
});
hxdom.VirtualElement = function(element) {
	hxdom.VirtualNode.call(this,element);
};
$hxClasses["hxdom.VirtualElement"] = hxdom.VirtualElement;
hxdom.VirtualElement.__name__ = ["hxdom","VirtualElement"];
hxdom.VirtualElement.__super__ = hxdom.VirtualNode;
hxdom.VirtualElement.prototype = $extend(hxdom.VirtualNode.prototype,{
	__class__: hxdom.VirtualElement
});
hxdom.EHtml = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLHtmlElement,"HTML"));
};
$hxClasses["hxdom.EHtml"] = hxdom.EHtml;
hxdom.EHtml.__name__ = ["hxdom","EHtml"];
hxdom.EHtml.__super__ = hxdom.VirtualElement;
hxdom.EHtml.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EHtml
});
var ForumApp = function() {
	hxdom.EHtml.call(this);
	var user1 = new User(0,"Fred");
	var user2 = new John(1);
	this.head = new hxdom.EHead();
	hxdom.DomTools.add(this.head,hxdom.DomTools.addText(new hxdom.EScript(),"HTMLDetailsElement = HTMLElement;"));
	hxdom.DomTools.add(this.head,hxdom.DomTools.attr(hxdom.DomTools.attr(new hxdom.EScript(),hxdom.Attr.Src,"client.js"),hxdom.Attr.Defer,true));
	this.threads = new ForumThreadView([new Post(user1,"Hi John!"),new Post(user2,"Well hello there Fred.")]);
	this.threads.node.dataset.testingCustomDataAttr = "data'.data.data'.data";
	this.threads.node.style.backgroundColor = "red";
	this.addEventListener("click",Main.staticEventListener);
	this.empty = new hxdom.Text("");
	hxdom.DomTools.add(this,this.head);
	hxdom.DomTools.add(this,this.threads);
	hxdom.DomTools.add(this,this.empty);
	this.threads.fireEvent();
};
$hxClasses["ForumApp"] = ForumApp;
ForumApp.__name__ = ["ForumApp"];
ForumApp.__super__ = hxdom.EHtml;
ForumApp.prototype = $extend(hxdom.EHtml.prototype,{
	__class__: ForumApp
});
hxdom.EBody = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLBodyElement,"BODY"));
};
$hxClasses["hxdom.EBody"] = hxdom.EBody;
hxdom.EBody.__name__ = ["hxdom","EBody"];
hxdom.EBody.__super__ = hxdom.VirtualElement;
hxdom.EBody.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EBody
});
hxdom.js = {}
hxdom.js.ClientOnly = function() { }
$hxClasses["hxdom.js.ClientOnly"] = hxdom.js.ClientOnly;
hxdom.js.ClientOnly.__name__ = ["hxdom","js","ClientOnly"];
var ForumThreadView = function(posts) {
	hxdom.EBody.call(this);
	this.set_posts(posts.map(function(e) {
		return new PostView(e);
	}));
	this.t1 = new hxdom.Text("Testing ");
	this.t2 = new hxdom.Text("inline              text ");
	this.empty = new hxdom.Text("");
	this.t3 = new hxdom.Text("references");
	hxdom.DomTools.add(hxdom.DomTools.add(hxdom.DomTools.add(hxdom.DomTools.add(this,this.t1),this.t2),this.empty),this.t3);
	this.init();
};
$hxClasses["ForumThreadView"] = ForumThreadView;
ForumThreadView.__name__ = ["ForumThreadView"];
ForumThreadView.__interfaces__ = [hxdom.js.ClientOnly];
ForumThreadView.__super__ = hxdom.EBody;
ForumThreadView.prototype = $extend(hxdom.EBody.prototype,{
	__hxdomBoot: function() {
		this.init();
	}
	,fireEvent: function() {
		this.dispatchEvent(new Event("click"));
	}
	,addPost: function(post) {
		hxdom.DomTools.add(this,new PostView(post));
	}
	,set_posts: function(posts) {
		this.posts = posts;
		hxdom.DomTools.clear(this);
		var _g = 0;
		while(_g < posts.length) {
			var i = posts[_g];
			++_g;
			hxdom.DomTools.add(this,i);
		}
		return posts;
	}
	,markTextEnds: function() {
		this.t1.node.data += "|";
		this.t2.node.data += "|";
		this.empty.node.data += "|";
		this.t3.node.data += "|";
	}
	,init: function() {
		console.log("FTV init");
	}
	,__class__: ForumThreadView
});
hxdom.EArticle = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"ARTICLE"));
};
$hxClasses["hxdom.EArticle"] = hxdom.EArticle;
hxdom.EArticle.__name__ = ["hxdom","EArticle"];
hxdom.EArticle.__super__ = hxdom.VirtualElement;
hxdom.EArticle.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EArticle
});
var PostView = function(post) {
	hxdom.EArticle.call(this);
	hxdom.DomTools.classes(this,"post");
	this.set_post(post);
};
$hxClasses["PostView"] = PostView;
PostView.__name__ = ["PostView"];
PostView.__super__ = hxdom.EArticle;
PostView.prototype = $extend(hxdom.EArticle.prototype,{
	onPostChange: function(_) {
		this.set_post(this.post);
	}
	,onClick: function(_) {
		this.post.message += " EVENT!";
		this.post.update();
	}
	,set_post: function(post) {
		if(this.post != null) {
			hxdom.DomTools.clear(this);
			this.post.__addEventListener("change",new hxdom.EventHandler(this,"onPostChange",$bind(this,this.onPostChange)),null);
			this.btn.node.removeEventListener("click",$bind(this,this.onClick));
		}
		this.post = post;
		if(post != null) {
			this.eprofile = new ProfileView(post.user);
			this.emsg = new hxdom.EDiv();
			post.__addEventListener("change",new hxdom.EventHandler(this,"onPostChange",$bind(this,this.onPostChange)),null);
			hxdom.DomTools.add(this,this.eprofile);
			hxdom.DomTools.add(this,hxdom.DomTools.addText(hxdom.DomTools.classes(this.emsg,"post-message"),post.message));
			this.btn = hxdom.DomTools.addText(new hxdom.EButton(),"Click Me!");
			this.btn.addEventListener("click",$bind(this,this.onClick));
			hxdom.DomTools.add(this,this.btn);
		}
		return post;
	}
	,__class__: PostView
});
hxdom.EAside = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"ASIDE"));
};
$hxClasses["hxdom.EAside"] = hxdom.EAside;
hxdom.EAside.__name__ = ["hxdom","EAside"];
hxdom.EAside.__super__ = hxdom.VirtualElement;
hxdom.EAside.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EAside
});
var ProfileView = function(user) {
	hxdom.EAside.call(this);
	hxdom.DomTools.classes(this,"profile");
	this.set_user(user);
};
$hxClasses["ProfileView"] = ProfileView;
ProfileView.__name__ = ["ProfileView"];
ProfileView.__super__ = hxdom.EAside;
ProfileView.prototype = $extend(hxdom.EAside.prototype,{
	set_user: function(user) {
		this.user = user;
		hxdom.DomTools.clear(this);
		if(user != null) hxdom.DomTools.add(this,hxdom.DomTools.addText(hxdom.DomTools.classes(new hxdom.EDiv(),"profile-name"),user.name));
		return user;
	}
	,__class__: ProfileView
});
hxdom.IEventDispatcher = function() { }
$hxClasses["hxdom.IEventDispatcher"] = hxdom.IEventDispatcher;
hxdom.IEventDispatcher.__name__ = ["hxdom","IEventDispatcher"];
hxdom.IEventDispatcher.prototype = {
	__class__: hxdom.IEventDispatcher
}
var User = function(id,name) {
	this.id = id;
	this.name = name;
	this.init();
};
$hxClasses["User"] = User;
User.__name__ = ["User"];
User.__interfaces__ = [hxdom.js.ClientOnly,hxdom.IEventDispatcher];
User.prototype = {
	dispatchEvent: function(event) {
		if(this.__listeners == null) this.__listeners = new haxe.ds.StringMap();
		event.target = this;
		this.__capturePhase(event);
		this.__bubblePhase(event);
		return !event.defaultPrevented;
	}
	,__bubblePhase: function(event) {
		event.currentTarget = node;
		if(!event.cancelable || !event.cancelBubble) this.__callListeners(event,false);
		if(js.Boot.__instanceof(this,Node)) {
			var node = this;
			if(node.parentNode != null && event.bubbles) node.parentNode.__bubblePhase(event);
		}
	}
	,__capturePhase: function(event) {
		event.currentTarget = node;
		if(js.Boot.__instanceof(this,Node)) {
			var node = this;
			if(node.parentNode != null && event.bubbles) node.parentNode.__capturePhase(event);
		}
		if(!event.cancelable || !event.cancelBubble) this.__callListeners(event,true);
	}
	,__callListeners: function(event,capture) {
		if(event.target == this) event.eventPhase = 2; else event.eventPhase = capture?1:3;
		var list = this.__listeners.get(event.type);
		if(list != null) {
			var $it0 = list.iterator();
			while( $it0.hasNext() ) {
				var i = $it0.next();
				if(i.cap == capture) {
					Reflect.field(i.handler.inst,i.handler.func).apply(i.handler.inst,[event]);
					if(Reflect.field(event,"cancelImmediate") == true) break;
				}
			}
		}
	}
	,__removeEventListener: function(type,handler,useCapture) {
		if(useCapture == null) useCapture = false;
		if(this.__listeners == null || !this.__listeners.exists(type)) return;
		var list = this.__listeners.get(type);
		var $it0 = list.iterator();
		while( $it0.hasNext() ) {
			var i = $it0.next();
			if(i.handler.inst == handler.inst && i.handler.func == handler.func && i.cap == useCapture) list.remove(i);
		}
	}
	,__addEventListener: function(type,handler,useCapture) {
		if(useCapture == null) useCapture = false;
		if(this.__listeners == null) this.__listeners = new haxe.ds.StringMap();
		var list = this.__listeners.get(type);
		var obj = { handler : handler, cap : useCapture};
		if(list == null) {
			list = new List();
			list.add(obj);
			this.__listeners.set(type,list);
		} else {
			var $it0 = list.iterator();
			while( $it0.hasNext() ) {
				var i = $it0.next();
				if(i.handler.inst == handler.inst && i.handler.func == handler.func && i.cap == useCapture) return;
			}
			list.add(obj);
		}
	}
	,__hxdomBoot: function() {
		this.init();
	}
	,update: function() {
		this.dispatchEvent(new Event("change"));
	}
	,init: function() {
		js.Browser.window.console.log("Client load init! id = " + this.id + ", name = " + this.name);
	}
	,__class__: User
}
var John = function(id) {
	User.call(this,id,"John");
};
$hxClasses["John"] = John;
John.__name__ = ["John"];
John.__super__ = User;
John.prototype = $extend(User.prototype,{
	__hxdomBoot: function() {
		User.prototype.__hxdomBoot.call(this);
	}
	,__class__: John
});
var Post = function(user,message) {
	this.user = user;
	this.message = message;
};
$hxClasses["Post"] = Post;
Post.__name__ = ["Post"];
Post.__interfaces__ = [hxdom.IEventDispatcher];
Post.prototype = {
	dispatchEvent: function(event) {
		if(this.__listeners == null) this.__listeners = new haxe.ds.StringMap();
		event.target = this;
		this.__capturePhase(event);
		this.__bubblePhase(event);
		return !event.defaultPrevented;
	}
	,__bubblePhase: function(event) {
		event.currentTarget = node;
		if(!event.cancelable || !event.cancelBubble) this.__callListeners(event,false);
		if(js.Boot.__instanceof(this,Node)) {
			var node = this;
			if(node.parentNode != null && event.bubbles) node.parentNode.__bubblePhase(event);
		}
	}
	,__capturePhase: function(event) {
		event.currentTarget = node;
		if(js.Boot.__instanceof(this,Node)) {
			var node = this;
			if(node.parentNode != null && event.bubbles) node.parentNode.__capturePhase(event);
		}
		if(!event.cancelable || !event.cancelBubble) this.__callListeners(event,true);
	}
	,__callListeners: function(event,capture) {
		if(event.target == this) event.eventPhase = 2; else event.eventPhase = capture?1:3;
		var list = this.__listeners.get(event.type);
		if(list != null) {
			var $it0 = list.iterator();
			while( $it0.hasNext() ) {
				var i = $it0.next();
				if(i.cap == capture) {
					Reflect.field(i.handler.inst,i.handler.func).apply(i.handler.inst,[event]);
					if(Reflect.field(event,"cancelImmediate") == true) break;
				}
			}
		}
	}
	,__removeEventListener: function(type,handler,useCapture) {
		if(useCapture == null) useCapture = false;
		if(this.__listeners == null || !this.__listeners.exists(type)) return;
		var list = this.__listeners.get(type);
		var $it0 = list.iterator();
		while( $it0.hasNext() ) {
			var i = $it0.next();
			if(i.handler.inst == handler.inst && i.handler.func == handler.func && i.cap == useCapture) list.remove(i);
		}
	}
	,__addEventListener: function(type,handler,useCapture) {
		if(useCapture == null) useCapture = false;
		if(this.__listeners == null) this.__listeners = new haxe.ds.StringMap();
		var list = this.__listeners.get(type);
		var obj = { handler : handler, cap : useCapture};
		if(list == null) {
			list = new List();
			list.add(obj);
			this.__listeners.set(type,list);
		} else {
			var $it0 = list.iterator();
			while( $it0.hasNext() ) {
				var i = $it0.next();
				if(i.handler.inst == handler.inst && i.handler.func == handler.func && i.cap == useCapture) return;
			}
			list.add(obj);
		}
	}
	,update: function() {
		this.dispatchEvent(new Event("change"));
	}
	,__class__: Post
}
var IMap = function() { }
$hxClasses["IMap"] = IMap;
IMap.__name__ = ["IMap"];
var Reflect = function() { }
$hxClasses["Reflect"] = Reflect;
Reflect.__name__ = ["Reflect"];
Reflect.hasField = function(o,field) {
	return Object.prototype.hasOwnProperty.call(o,field);
}
Reflect.field = function(o,field) {
	var v = null;
	try {
		v = o[field];
	} catch( e ) {
	}
	return v;
}
Reflect.fields = function(o) {
	var a = [];
	if(o != null) {
		var hasOwnProperty = Object.prototype.hasOwnProperty;
		for( var f in o ) {
		if(f != "__id__" && f != "hx__closures__" && hasOwnProperty.call(o,f)) a.push(f);
		}
	}
	return a;
}
Reflect.isFunction = function(f) {
	return typeof(f) == "function" && !(f.__name__ || f.__ename__);
}
Reflect.deleteField = function(o,field) {
	if(!Reflect.hasField(o,field)) return false;
	delete(o[field]);
	return true;
}
var Std = function() { }
$hxClasses["Std"] = Std;
Std.__name__ = ["Std"];
Std.string = function(s) {
	return js.Boot.__string_rec(s,"");
}
Std.parseInt = function(x) {
	var v = parseInt(x,10);
	if(v == 0 && (HxOverrides.cca(x,1) == 120 || HxOverrides.cca(x,1) == 88)) v = parseInt(x);
	if(isNaN(v)) return null;
	return v;
}
Std.parseFloat = function(x) {
	return parseFloat(x);
}
var StringBuf = function() {
	this.b = "";
};
$hxClasses["StringBuf"] = StringBuf;
StringBuf.__name__ = ["StringBuf"];
StringBuf.prototype = {
	__class__: StringBuf
}
var StringTools = function() { }
$hxClasses["StringTools"] = StringTools;
StringTools.__name__ = ["StringTools"];
StringTools.urlEncode = function(s) {
	return encodeURIComponent(s);
}
StringTools.urlDecode = function(s) {
	return decodeURIComponent(s.split("+").join(" "));
}
StringTools.htmlEscape = function(s,quotes) {
	s = s.split("&").join("&amp;").split("<").join("&lt;").split(">").join("&gt;");
	return quotes?s.split("\"").join("&quot;").split("'").join("&#039;"):s;
}
StringTools.startsWith = function(s,start) {
	return s.length >= start.length && HxOverrides.substr(s,0,start.length) == start;
}
StringTools.lpad = function(s,c,l) {
	if(c.length <= 0) return s;
	while(s.length < l) s = c + s;
	return s;
}
var ValueType = $hxClasses["ValueType"] = { __ename__ : ["ValueType"], __constructs__ : ["TNull","TInt","TFloat","TBool","TObject","TFunction","TClass","TEnum","TUnknown"] }
ValueType.TNull = ["TNull",0];
ValueType.TNull.toString = $estr;
ValueType.TNull.__enum__ = ValueType;
ValueType.TInt = ["TInt",1];
ValueType.TInt.toString = $estr;
ValueType.TInt.__enum__ = ValueType;
ValueType.TFloat = ["TFloat",2];
ValueType.TFloat.toString = $estr;
ValueType.TFloat.__enum__ = ValueType;
ValueType.TBool = ["TBool",3];
ValueType.TBool.toString = $estr;
ValueType.TBool.__enum__ = ValueType;
ValueType.TObject = ["TObject",4];
ValueType.TObject.toString = $estr;
ValueType.TObject.__enum__ = ValueType;
ValueType.TFunction = ["TFunction",5];
ValueType.TFunction.toString = $estr;
ValueType.TFunction.__enum__ = ValueType;
ValueType.TClass = function(c) { var $x = ["TClass",6,c]; $x.__enum__ = ValueType; $x.toString = $estr; return $x; }
ValueType.TEnum = function(e) { var $x = ["TEnum",7,e]; $x.__enum__ = ValueType; $x.toString = $estr; return $x; }
ValueType.TUnknown = ["TUnknown",8];
ValueType.TUnknown.toString = $estr;
ValueType.TUnknown.__enum__ = ValueType;
var Type = function() { }
$hxClasses["Type"] = Type;
Type.__name__ = ["Type"];
Type.getClass = function(o) {
	if(o == null) return null;
	return o.__class__;
}
Type.getClassName = function(c) {
	var a = c.__name__;
	return a.join(".");
}
Type.getEnumName = function(e) {
	var a = e.__ename__;
	return a.join(".");
}
Type.resolveClass = function(name) {
	var cl = $hxClasses[name];
	if(cl == null || !cl.__name__) return null;
	return cl;
}
Type.resolveEnum = function(name) {
	var e = $hxClasses[name];
	if(e == null || !e.__ename__) return null;
	return e;
}
Type.createEmptyInstance = function(cl) {
	function empty() {}; empty.prototype = cl.prototype;
	return new empty();
}
Type.createEnum = function(e,constr,params) {
	var f = Reflect.field(e,constr);
	if(f == null) throw "No such constructor " + constr;
	if(Reflect.isFunction(f)) {
		if(params == null) throw "Constructor " + constr + " need parameters";
		return f.apply(e,params);
	}
	if(params != null && params.length != 0) throw "Constructor " + constr + " does not need parameters";
	return f;
}
Type.getEnumConstructs = function(e) {
	var a = e.__constructs__;
	return a.slice();
}
Type["typeof"] = function(v) {
	var _g = typeof(v);
	switch(_g) {
	case "boolean":
		return ValueType.TBool;
	case "string":
		return ValueType.TClass(String);
	case "number":
		if(Math.ceil(v) == v % 2147483648.0) return ValueType.TInt;
		return ValueType.TFloat;
	case "object":
		if(v == null) return ValueType.TNull;
		var e = v.__enum__;
		if(e != null) return ValueType.TEnum(e);
		var c = v.__class__;
		if(c != null) return ValueType.TClass(c);
		return ValueType.TObject;
	case "function":
		if(v.__name__ || v.__ename__) return ValueType.TObject;
		return ValueType.TFunction;
	case "undefined":
		return ValueType.TNull;
	default:
		return ValueType.TUnknown;
	}
}
var haxe = {}
haxe.Serializer = function() {
	this.buf = new StringBuf();
	this.cache = new Array();
	this.useCache = haxe.Serializer.USE_CACHE;
	this.useEnumIndex = haxe.Serializer.USE_ENUM_INDEX;
	this.shash = new haxe.ds.StringMap();
	this.scount = 0;
};
$hxClasses["haxe.Serializer"] = haxe.Serializer;
haxe.Serializer.__name__ = ["haxe","Serializer"];
haxe.Serializer.prototype = {
	serialize: function(v) {
		var _g = Type["typeof"](v);
		var $e = (_g);
		switch( $e[1] ) {
		case 0:
			this.buf.b += "n";
			break;
		case 1:
			if(v == 0) {
				this.buf.b += "z";
				return;
			}
			this.buf.b += "i";
			this.buf.b += Std.string(v);
			break;
		case 2:
			if(Math.isNaN(v)) this.buf.b += "k"; else if(!Math.isFinite(v)) this.buf.b += Std.string(v < 0?"m":"p"); else {
				this.buf.b += "d";
				this.buf.b += Std.string(v);
			}
			break;
		case 3:
			this.buf.b += Std.string(v?"t":"f");
			break;
		case 6:
			var c = $e[2];
			if(c == String) {
				this.serializeString(v);
				return;
			}
			if(this.useCache && this.serializeRef(v)) return;
			switch(c) {
			case Array:
				var ucount = 0;
				this.buf.b += "a";
				var l = v.length;
				var _g1 = 0;
				while(_g1 < l) {
					var i = _g1++;
					if(v[i] == null) ucount++; else {
						if(ucount > 0) {
							if(ucount == 1) this.buf.b += "n"; else {
								this.buf.b += "u";
								this.buf.b += Std.string(ucount);
							}
							ucount = 0;
						}
						this.serialize(v[i]);
					}
				}
				if(ucount > 0) {
					if(ucount == 1) this.buf.b += "n"; else {
						this.buf.b += "u";
						this.buf.b += Std.string(ucount);
					}
				}
				this.buf.b += "h";
				break;
			case List:
				this.buf.b += "l";
				var v1 = v;
				var $it0 = v1.iterator();
				while( $it0.hasNext() ) {
					var i = $it0.next();
					this.serialize(i);
				}
				this.buf.b += "h";
				break;
			case Date:
				var d = v;
				this.buf.b += "v";
				this.buf.b += Std.string(HxOverrides.dateStr(d));
				break;
			case haxe.ds.StringMap:
				this.buf.b += "b";
				var v1 = v;
				var $it1 = v1.keys();
				while( $it1.hasNext() ) {
					var k = $it1.next();
					this.serializeString(k);
					this.serialize(v1.get(k));
				}
				this.buf.b += "h";
				break;
			case haxe.ds.IntMap:
				this.buf.b += "q";
				var v1 = v;
				var $it2 = v1.keys();
				while( $it2.hasNext() ) {
					var k = $it2.next();
					this.buf.b += ":";
					this.buf.b += Std.string(k);
					this.serialize(v1.get(k));
				}
				this.buf.b += "h";
				break;
			case haxe.ds.ObjectMap:
				this.buf.b += "M";
				var v1 = v;
				var $it3 = v1.keys();
				while( $it3.hasNext() ) {
					var k = $it3.next();
					var id = Reflect.field(k,"__id__");
					Reflect.deleteField(k,"__id__");
					this.serialize(k);
					k.__id__ = id;
					this.serialize(v1.h[k.__id__]);
				}
				this.buf.b += "h";
				break;
			case haxe.io.Bytes:
				var v1 = v;
				var i = 0;
				var max = v1.length - 2;
				var charsBuf = new StringBuf();
				var b64 = haxe.Serializer.BASE64;
				while(i < max) {
					var b1 = v1.b[i++];
					var b2 = v1.b[i++];
					var b3 = v1.b[i++];
					charsBuf.b += Std.string(b64.charAt(b1 >> 2));
					charsBuf.b += Std.string(b64.charAt((b1 << 4 | b2 >> 4) & 63));
					charsBuf.b += Std.string(b64.charAt((b2 << 2 | b3 >> 6) & 63));
					charsBuf.b += Std.string(b64.charAt(b3 & 63));
				}
				if(i == max) {
					var b1 = v1.b[i++];
					var b2 = v1.b[i++];
					charsBuf.b += Std.string(b64.charAt(b1 >> 2));
					charsBuf.b += Std.string(b64.charAt((b1 << 4 | b2 >> 4) & 63));
					charsBuf.b += Std.string(b64.charAt(b2 << 2 & 63));
				} else if(i == max + 1) {
					var b1 = v1.b[i++];
					charsBuf.b += Std.string(b64.charAt(b1 >> 2));
					charsBuf.b += Std.string(b64.charAt(b1 << 4 & 63));
				}
				var chars = charsBuf.b;
				this.buf.b += "s";
				this.buf.b += Std.string(chars.length);
				this.buf.b += ":";
				this.buf.b += Std.string(chars);
				break;
			default:
				this.cache.pop();
				if(v.hxSerialize != null) {
					this.buf.b += "C";
					this.serializeString(Type.getClassName(c));
					this.cache.push(v);
					v.hxSerialize(this);
					this.buf.b += "g";
				} else {
					this.buf.b += "c";
					this.serializeString(Type.getClassName(c));
					this.cache.push(v);
					this.serializeFields(v);
				}
			}
			break;
		case 4:
			if(this.useCache && this.serializeRef(v)) return;
			this.buf.b += "o";
			this.serializeFields(v);
			break;
		case 7:
			var e = $e[2];
			if(this.useCache && this.serializeRef(v)) return;
			this.cache.pop();
			this.buf.b += Std.string(this.useEnumIndex?"j":"w");
			this.serializeString(Type.getEnumName(e));
			if(this.useEnumIndex) {
				this.buf.b += ":";
				this.buf.b += Std.string(v[1]);
			} else this.serializeString(v[0]);
			this.buf.b += ":";
			var l = v.length;
			this.buf.b += Std.string(l - 2);
			var _g1 = 2;
			while(_g1 < l) {
				var i = _g1++;
				this.serialize(v[i]);
			}
			this.cache.push(v);
			break;
		case 5:
			throw "Cannot serialize function";
			break;
		default:
			throw "Cannot serialize " + Std.string(v);
		}
	}
	,serializeFields: function(v) {
		var _g = 0, _g1 = Reflect.fields(v);
		while(_g < _g1.length) {
			var f = _g1[_g];
			++_g;
			this.serializeString(f);
			this.serialize(Reflect.field(v,f));
		}
		this.buf.b += "g";
	}
	,serializeRef: function(v) {
		var vt = typeof(v);
		var _g1 = 0, _g = this.cache.length;
		while(_g1 < _g) {
			var i = _g1++;
			var ci = this.cache[i];
			if(typeof(ci) == vt && ci == v) {
				this.buf.b += "r";
				this.buf.b += Std.string(i);
				return true;
			}
		}
		this.cache.push(v);
		return false;
	}
	,serializeString: function(s) {
		var x = this.shash.get(s);
		if(x != null) {
			this.buf.b += "R";
			this.buf.b += Std.string(x);
			return;
		}
		this.shash.set(s,this.scount++);
		this.buf.b += "y";
		s = StringTools.urlEncode(s);
		this.buf.b += Std.string(s.length);
		this.buf.b += ":";
		this.buf.b += Std.string(s);
	}
	,toString: function() {
		return this.buf.b;
	}
	,__class__: haxe.Serializer
}
haxe.Unserializer = function(buf) {
	this.buf = buf;
	this.length = buf.length;
	this.pos = 0;
	this.scache = new Array();
	this.cache = new Array();
	var r = haxe.Unserializer.DEFAULT_RESOLVER;
	if(r == null) {
		r = Type;
		haxe.Unserializer.DEFAULT_RESOLVER = r;
	}
	this.setResolver(r);
};
$hxClasses["haxe.Unserializer"] = haxe.Unserializer;
haxe.Unserializer.__name__ = ["haxe","Unserializer"];
haxe.Unserializer.initCodes = function() {
	var codes = new Array();
	var _g1 = 0, _g = haxe.Unserializer.BASE64.length;
	while(_g1 < _g) {
		var i = _g1++;
		codes[haxe.Unserializer.BASE64.charCodeAt(i)] = i;
	}
	return codes;
}
haxe.Unserializer.prototype = {
	unserialize: function() {
		var _g = this.buf.charCodeAt(this.pos++);
		switch(_g) {
		case 110:
			return null;
		case 116:
			return true;
		case 102:
			return false;
		case 122:
			return 0;
		case 105:
			return this.readDigits();
		case 100:
			var p1 = this.pos;
			while(true) {
				var c = this.buf.charCodeAt(this.pos);
				if(c >= 43 && c < 58 || c == 101 || c == 69) this.pos++; else break;
			}
			return Std.parseFloat(HxOverrides.substr(this.buf,p1,this.pos - p1));
		case 121:
			var len = this.readDigits();
			if(this.buf.charCodeAt(this.pos++) != 58 || this.length - this.pos < len) throw "Invalid string length";
			var s = HxOverrides.substr(this.buf,this.pos,len);
			this.pos += len;
			s = StringTools.urlDecode(s);
			this.scache.push(s);
			return s;
		case 107:
			return Math.NaN;
		case 109:
			return Math.NEGATIVE_INFINITY;
		case 112:
			return Math.POSITIVE_INFINITY;
		case 97:
			var buf = this.buf;
			var a = new Array();
			this.cache.push(a);
			while(true) {
				var c = this.buf.charCodeAt(this.pos);
				if(c == 104) {
					this.pos++;
					break;
				}
				if(c == 117) {
					this.pos++;
					var n = this.readDigits();
					a[a.length + n - 1] = null;
				} else a.push(this.unserialize());
			}
			return a;
		case 111:
			var o = { };
			this.cache.push(o);
			this.unserializeObject(o);
			return o;
		case 114:
			var n = this.readDigits();
			if(n < 0 || n >= this.cache.length) throw "Invalid reference";
			return this.cache[n];
		case 82:
			var n = this.readDigits();
			if(n < 0 || n >= this.scache.length) throw "Invalid string reference";
			return this.scache[n];
		case 120:
			throw this.unserialize();
			break;
		case 99:
			var name = this.unserialize();
			var cl = this.resolver.resolveClass(name);
			if(cl == null) throw "Class not found " + name;
			var o = Type.createEmptyInstance(cl);
			this.cache.push(o);
			this.unserializeObject(o);
			return o;
		case 119:
			var name = this.unserialize();
			var edecl = this.resolver.resolveEnum(name);
			if(edecl == null) throw "Enum not found " + name;
			var e = this.unserializeEnum(edecl,this.unserialize());
			this.cache.push(e);
			return e;
		case 106:
			var name = this.unserialize();
			var edecl = this.resolver.resolveEnum(name);
			if(edecl == null) throw "Enum not found " + name;
			this.pos++;
			var index = this.readDigits();
			var tag = Type.getEnumConstructs(edecl)[index];
			if(tag == null) throw "Unknown enum index " + name + "@" + index;
			var e = this.unserializeEnum(edecl,tag);
			this.cache.push(e);
			return e;
		case 108:
			var l = new List();
			this.cache.push(l);
			var buf = this.buf;
			while(this.buf.charCodeAt(this.pos) != 104) l.add(this.unserialize());
			this.pos++;
			return l;
		case 98:
			var h = new haxe.ds.StringMap();
			this.cache.push(h);
			var buf = this.buf;
			while(this.buf.charCodeAt(this.pos) != 104) {
				var s = this.unserialize();
				h.set(s,this.unserialize());
			}
			this.pos++;
			return h;
		case 113:
			var h = new haxe.ds.IntMap();
			this.cache.push(h);
			var buf = this.buf;
			var c = this.buf.charCodeAt(this.pos++);
			while(c == 58) {
				var i = this.readDigits();
				h.set(i,this.unserialize());
				c = this.buf.charCodeAt(this.pos++);
			}
			if(c != 104) throw "Invalid IntMap format";
			return h;
		case 77:
			var h = new haxe.ds.ObjectMap();
			this.cache.push(h);
			var buf = this.buf;
			while(this.buf.charCodeAt(this.pos) != 104) {
				var s = this.unserialize();
				h.set(s,this.unserialize());
			}
			this.pos++;
			return h;
		case 118:
			var d = HxOverrides.strDate(HxOverrides.substr(this.buf,this.pos,19));
			this.cache.push(d);
			this.pos += 19;
			return d;
		case 115:
			var len = this.readDigits();
			var buf = this.buf;
			if(this.buf.charCodeAt(this.pos++) != 58 || this.length - this.pos < len) throw "Invalid bytes length";
			var codes = haxe.Unserializer.CODES;
			if(codes == null) {
				codes = haxe.Unserializer.initCodes();
				haxe.Unserializer.CODES = codes;
			}
			var i = this.pos;
			var rest = len & 3;
			var size = (len >> 2) * 3 + (rest >= 2?rest - 1:0);
			var max = i + (len - rest);
			var bytes = haxe.io.Bytes.alloc(size);
			var bpos = 0;
			while(i < max) {
				var c1 = codes[buf.charCodeAt(i++)];
				var c2 = codes[buf.charCodeAt(i++)];
				bytes.b[bpos++] = (c1 << 2 | c2 >> 4) & 255;
				var c3 = codes[buf.charCodeAt(i++)];
				bytes.b[bpos++] = (c2 << 4 | c3 >> 2) & 255;
				var c4 = codes[buf.charCodeAt(i++)];
				bytes.b[bpos++] = (c3 << 6 | c4) & 255;
			}
			if(rest >= 2) {
				var c1 = codes[buf.charCodeAt(i++)];
				var c2 = codes[buf.charCodeAt(i++)];
				bytes.b[bpos++] = (c1 << 2 | c2 >> 4) & 255;
				if(rest == 3) {
					var c3 = codes[buf.charCodeAt(i++)];
					bytes.b[bpos++] = (c2 << 4 | c3 >> 2) & 255;
				}
			}
			this.pos += len;
			this.cache.push(bytes);
			return bytes;
		case 67:
			var name = this.unserialize();
			var cl = this.resolver.resolveClass(name);
			if(cl == null) throw "Class not found " + name;
			var o = Type.createEmptyInstance(cl);
			this.cache.push(o);
			o.hxUnserialize(this);
			if(this.buf.charCodeAt(this.pos++) != 103) throw "Invalid custom data";
			return o;
		default:
		}
		this.pos--;
		throw "Invalid char " + this.buf.charAt(this.pos) + " at position " + this.pos;
	}
	,unserializeEnum: function(edecl,tag) {
		if(this.buf.charCodeAt(this.pos++) != 58) throw "Invalid enum format";
		var nargs = this.readDigits();
		if(nargs == 0) return Type.createEnum(edecl,tag);
		var args = new Array();
		while(nargs-- > 0) args.push(this.unserialize());
		return Type.createEnum(edecl,tag,args);
	}
	,unserializeObject: function(o) {
		while(true) {
			if(this.pos >= this.length) throw "Invalid object";
			if(this.buf.charCodeAt(this.pos) == 103) break;
			var k = this.unserialize();
			if(!js.Boot.__instanceof(k,String)) throw "Invalid object key";
			var v = this.unserialize();
			o[k] = v;
		}
		this.pos++;
	}
	,readDigits: function() {
		var k = 0;
		var s = false;
		var fpos = this.pos;
		while(true) {
			var c = this.buf.charCodeAt(this.pos);
			if(c != c) break;
			if(c == 45) {
				if(this.pos != fpos) break;
				s = true;
				this.pos++;
				continue;
			}
			if(c < 48 || c > 57) break;
			k = k * 10 + (c - 48);
			this.pos++;
		}
		if(s) k *= -1;
		return k;
	}
	,setResolver: function(r) {
		if(r == null) this.resolver = { resolveClass : function(_) {
			return null;
		}, resolveEnum : function(_) {
			return null;
		}}; else this.resolver = r;
	}
	,__class__: haxe.Unserializer
}
haxe.ds = {}
haxe.ds.IntMap = function() {
	this.h = { };
};
$hxClasses["haxe.ds.IntMap"] = haxe.ds.IntMap;
haxe.ds.IntMap.__name__ = ["haxe","ds","IntMap"];
haxe.ds.IntMap.__interfaces__ = [IMap];
haxe.ds.IntMap.prototype = {
	keys: function() {
		var a = [];
		for( var key in this.h ) {
		if(this.h.hasOwnProperty(key)) a.push(key | 0);
		}
		return HxOverrides.iter(a);
	}
	,get: function(key) {
		return this.h[key];
	}
	,set: function(key,value) {
		this.h[key] = value;
	}
	,__class__: haxe.ds.IntMap
}
haxe.ds.ObjectMap = function() {
	this.h = { };
	this.h.__keys__ = { };
};
$hxClasses["haxe.ds.ObjectMap"] = haxe.ds.ObjectMap;
haxe.ds.ObjectMap.__name__ = ["haxe","ds","ObjectMap"];
haxe.ds.ObjectMap.__interfaces__ = [IMap];
haxe.ds.ObjectMap.prototype = {
	keys: function() {
		var a = [];
		for( var key in this.h.__keys__ ) {
		if(this.h.hasOwnProperty(key)) a.push(this.h.__keys__[key]);
		}
		return HxOverrides.iter(a);
	}
	,set: function(key,value) {
		var id = key.__id__ != null?key.__id__:key.__id__ = ++haxe.ds.ObjectMap.count;
		this.h[id] = value;
		this.h.__keys__[id] = key;
	}
	,__class__: haxe.ds.ObjectMap
}
haxe.ds.StringMap = function() {
	this.h = { };
};
$hxClasses["haxe.ds.StringMap"] = haxe.ds.StringMap;
haxe.ds.StringMap.__name__ = ["haxe","ds","StringMap"];
haxe.ds.StringMap.__interfaces__ = [IMap];
haxe.ds.StringMap.prototype = {
	toString: function() {
		var s = new StringBuf();
		s.b += "{";
		var it = this.keys();
		while( it.hasNext() ) {
			var i = it.next();
			s.b += Std.string(i);
			s.b += " => ";
			s.b += Std.string(Std.string(this.get(i)));
			if(it.hasNext()) s.b += ", ";
		}
		s.b += "}";
		return s.b;
	}
	,iterator: function() {
		return { ref : this.h, it : this.keys(), hasNext : function() {
			return this.it.hasNext();
		}, next : function() {
			var i = this.it.next();
			return this.ref["$" + i];
		}};
	}
	,keys: function() {
		var a = [];
		for( var key in this.h ) {
		if(this.h.hasOwnProperty(key)) a.push(key.substr(1));
		}
		return HxOverrides.iter(a);
	}
	,remove: function(key) {
		key = "$" + key;
		if(!this.h.hasOwnProperty(key)) return false;
		delete(this.h[key]);
		return true;
	}
	,exists: function(key) {
		return this.h.hasOwnProperty("$" + key);
	}
	,get: function(key) {
		return this.h["$" + key];
	}
	,set: function(key,value) {
		this.h["$" + key] = value;
	}
	,__class__: haxe.ds.StringMap
}
haxe.io = {}
haxe.io.Bytes = function(length,b) {
	this.length = length;
	this.b = b;
};
$hxClasses["haxe.io.Bytes"] = haxe.io.Bytes;
haxe.io.Bytes.__name__ = ["haxe","io","Bytes"];
haxe.io.Bytes.alloc = function(length) {
	var a = new Array();
	var _g = 0;
	while(_g < length) {
		var i = _g++;
		a.push(0);
	}
	return new haxe.io.Bytes(length,a);
}
haxe.io.Bytes.prototype = {
	__class__: haxe.io.Bytes
}
hxdom.Attr = $hxClasses["hxdom.Attr"] = { __ename__ : ["hxdom","Attr"], __constructs__ : ["Accept","AcceptCharset","Accesskey","Action","Align","Alt","Async","Autocomplete","Autofocus","Autoplay","Bgcolor","Border","Buffered","Challenge","Charset","Checked","Cite","ClassName","Code","Codebase","Color","Cols","Colspan","Content","Contenteditable","Contextmenu","Controls","Coords","Data","Datetime","Default","Defer","Dir","Dirname","Disabled","Download","Draggable","Dropzone","Enctype","For","Form","Headers","Height","Hidden","High","Href","Hreflang","HttpEquiv","Icon","Id","Ismap","Itemprop","Keytype","Kind","Label","Lang","Language","List","Loop","Low","Manifest","Max","Maxlength","Media","Method","Min","Multiple","Name","Novalidate","Open","Optimum","Pattern","Ping","Placeholder","Poster","Preload","Pubdate","Radiogroup","Readonly","Rel","Required","Reversed","Rows","Rowspan","Sandbox","Spellcheck","Scope","Scoped","Seamless","Selected","Shape","Size","Sizes","Span","Src","Srcdoc","Srclang","Start","Step","Style","Summary","Tabindex","Target","Title","Type","Usemap","Value","Width","Wrap"] }
hxdom.Attr.Accept = ["Accept",0];
hxdom.Attr.Accept.toString = $estr;
hxdom.Attr.Accept.__enum__ = hxdom.Attr;
hxdom.Attr.AcceptCharset = ["AcceptCharset",1];
hxdom.Attr.AcceptCharset.toString = $estr;
hxdom.Attr.AcceptCharset.__enum__ = hxdom.Attr;
hxdom.Attr.Accesskey = ["Accesskey",2];
hxdom.Attr.Accesskey.toString = $estr;
hxdom.Attr.Accesskey.__enum__ = hxdom.Attr;
hxdom.Attr.Action = ["Action",3];
hxdom.Attr.Action.toString = $estr;
hxdom.Attr.Action.__enum__ = hxdom.Attr;
hxdom.Attr.Align = ["Align",4];
hxdom.Attr.Align.toString = $estr;
hxdom.Attr.Align.__enum__ = hxdom.Attr;
hxdom.Attr.Alt = ["Alt",5];
hxdom.Attr.Alt.toString = $estr;
hxdom.Attr.Alt.__enum__ = hxdom.Attr;
hxdom.Attr.Async = ["Async",6];
hxdom.Attr.Async.toString = $estr;
hxdom.Attr.Async.__enum__ = hxdom.Attr;
hxdom.Attr.Autocomplete = ["Autocomplete",7];
hxdom.Attr.Autocomplete.toString = $estr;
hxdom.Attr.Autocomplete.__enum__ = hxdom.Attr;
hxdom.Attr.Autofocus = ["Autofocus",8];
hxdom.Attr.Autofocus.toString = $estr;
hxdom.Attr.Autofocus.__enum__ = hxdom.Attr;
hxdom.Attr.Autoplay = ["Autoplay",9];
hxdom.Attr.Autoplay.toString = $estr;
hxdom.Attr.Autoplay.__enum__ = hxdom.Attr;
hxdom.Attr.Bgcolor = ["Bgcolor",10];
hxdom.Attr.Bgcolor.toString = $estr;
hxdom.Attr.Bgcolor.__enum__ = hxdom.Attr;
hxdom.Attr.Border = ["Border",11];
hxdom.Attr.Border.toString = $estr;
hxdom.Attr.Border.__enum__ = hxdom.Attr;
hxdom.Attr.Buffered = ["Buffered",12];
hxdom.Attr.Buffered.toString = $estr;
hxdom.Attr.Buffered.__enum__ = hxdom.Attr;
hxdom.Attr.Challenge = ["Challenge",13];
hxdom.Attr.Challenge.toString = $estr;
hxdom.Attr.Challenge.__enum__ = hxdom.Attr;
hxdom.Attr.Charset = ["Charset",14];
hxdom.Attr.Charset.toString = $estr;
hxdom.Attr.Charset.__enum__ = hxdom.Attr;
hxdom.Attr.Checked = ["Checked",15];
hxdom.Attr.Checked.toString = $estr;
hxdom.Attr.Checked.__enum__ = hxdom.Attr;
hxdom.Attr.Cite = ["Cite",16];
hxdom.Attr.Cite.toString = $estr;
hxdom.Attr.Cite.__enum__ = hxdom.Attr;
hxdom.Attr.ClassName = ["ClassName",17];
hxdom.Attr.ClassName.toString = $estr;
hxdom.Attr.ClassName.__enum__ = hxdom.Attr;
hxdom.Attr.Code = ["Code",18];
hxdom.Attr.Code.toString = $estr;
hxdom.Attr.Code.__enum__ = hxdom.Attr;
hxdom.Attr.Codebase = ["Codebase",19];
hxdom.Attr.Codebase.toString = $estr;
hxdom.Attr.Codebase.__enum__ = hxdom.Attr;
hxdom.Attr.Color = ["Color",20];
hxdom.Attr.Color.toString = $estr;
hxdom.Attr.Color.__enum__ = hxdom.Attr;
hxdom.Attr.Cols = ["Cols",21];
hxdom.Attr.Cols.toString = $estr;
hxdom.Attr.Cols.__enum__ = hxdom.Attr;
hxdom.Attr.Colspan = ["Colspan",22];
hxdom.Attr.Colspan.toString = $estr;
hxdom.Attr.Colspan.__enum__ = hxdom.Attr;
hxdom.Attr.Content = ["Content",23];
hxdom.Attr.Content.toString = $estr;
hxdom.Attr.Content.__enum__ = hxdom.Attr;
hxdom.Attr.Contenteditable = ["Contenteditable",24];
hxdom.Attr.Contenteditable.toString = $estr;
hxdom.Attr.Contenteditable.__enum__ = hxdom.Attr;
hxdom.Attr.Contextmenu = ["Contextmenu",25];
hxdom.Attr.Contextmenu.toString = $estr;
hxdom.Attr.Contextmenu.__enum__ = hxdom.Attr;
hxdom.Attr.Controls = ["Controls",26];
hxdom.Attr.Controls.toString = $estr;
hxdom.Attr.Controls.__enum__ = hxdom.Attr;
hxdom.Attr.Coords = ["Coords",27];
hxdom.Attr.Coords.toString = $estr;
hxdom.Attr.Coords.__enum__ = hxdom.Attr;
hxdom.Attr.Data = ["Data",28];
hxdom.Attr.Data.toString = $estr;
hxdom.Attr.Data.__enum__ = hxdom.Attr;
hxdom.Attr.Datetime = ["Datetime",29];
hxdom.Attr.Datetime.toString = $estr;
hxdom.Attr.Datetime.__enum__ = hxdom.Attr;
hxdom.Attr.Default = ["Default",30];
hxdom.Attr.Default.toString = $estr;
hxdom.Attr.Default.__enum__ = hxdom.Attr;
hxdom.Attr.Defer = ["Defer",31];
hxdom.Attr.Defer.toString = $estr;
hxdom.Attr.Defer.__enum__ = hxdom.Attr;
hxdom.Attr.Dir = ["Dir",32];
hxdom.Attr.Dir.toString = $estr;
hxdom.Attr.Dir.__enum__ = hxdom.Attr;
hxdom.Attr.Dirname = ["Dirname",33];
hxdom.Attr.Dirname.toString = $estr;
hxdom.Attr.Dirname.__enum__ = hxdom.Attr;
hxdom.Attr.Disabled = ["Disabled",34];
hxdom.Attr.Disabled.toString = $estr;
hxdom.Attr.Disabled.__enum__ = hxdom.Attr;
hxdom.Attr.Download = ["Download",35];
hxdom.Attr.Download.toString = $estr;
hxdom.Attr.Download.__enum__ = hxdom.Attr;
hxdom.Attr.Draggable = ["Draggable",36];
hxdom.Attr.Draggable.toString = $estr;
hxdom.Attr.Draggable.__enum__ = hxdom.Attr;
hxdom.Attr.Dropzone = ["Dropzone",37];
hxdom.Attr.Dropzone.toString = $estr;
hxdom.Attr.Dropzone.__enum__ = hxdom.Attr;
hxdom.Attr.Enctype = ["Enctype",38];
hxdom.Attr.Enctype.toString = $estr;
hxdom.Attr.Enctype.__enum__ = hxdom.Attr;
hxdom.Attr.For = ["For",39];
hxdom.Attr.For.toString = $estr;
hxdom.Attr.For.__enum__ = hxdom.Attr;
hxdom.Attr.Form = ["Form",40];
hxdom.Attr.Form.toString = $estr;
hxdom.Attr.Form.__enum__ = hxdom.Attr;
hxdom.Attr.Headers = ["Headers",41];
hxdom.Attr.Headers.toString = $estr;
hxdom.Attr.Headers.__enum__ = hxdom.Attr;
hxdom.Attr.Height = ["Height",42];
hxdom.Attr.Height.toString = $estr;
hxdom.Attr.Height.__enum__ = hxdom.Attr;
hxdom.Attr.Hidden = ["Hidden",43];
hxdom.Attr.Hidden.toString = $estr;
hxdom.Attr.Hidden.__enum__ = hxdom.Attr;
hxdom.Attr.High = ["High",44];
hxdom.Attr.High.toString = $estr;
hxdom.Attr.High.__enum__ = hxdom.Attr;
hxdom.Attr.Href = ["Href",45];
hxdom.Attr.Href.toString = $estr;
hxdom.Attr.Href.__enum__ = hxdom.Attr;
hxdom.Attr.Hreflang = ["Hreflang",46];
hxdom.Attr.Hreflang.toString = $estr;
hxdom.Attr.Hreflang.__enum__ = hxdom.Attr;
hxdom.Attr.HttpEquiv = ["HttpEquiv",47];
hxdom.Attr.HttpEquiv.toString = $estr;
hxdom.Attr.HttpEquiv.__enum__ = hxdom.Attr;
hxdom.Attr.Icon = ["Icon",48];
hxdom.Attr.Icon.toString = $estr;
hxdom.Attr.Icon.__enum__ = hxdom.Attr;
hxdom.Attr.Id = ["Id",49];
hxdom.Attr.Id.toString = $estr;
hxdom.Attr.Id.__enum__ = hxdom.Attr;
hxdom.Attr.Ismap = ["Ismap",50];
hxdom.Attr.Ismap.toString = $estr;
hxdom.Attr.Ismap.__enum__ = hxdom.Attr;
hxdom.Attr.Itemprop = ["Itemprop",51];
hxdom.Attr.Itemprop.toString = $estr;
hxdom.Attr.Itemprop.__enum__ = hxdom.Attr;
hxdom.Attr.Keytype = ["Keytype",52];
hxdom.Attr.Keytype.toString = $estr;
hxdom.Attr.Keytype.__enum__ = hxdom.Attr;
hxdom.Attr.Kind = ["Kind",53];
hxdom.Attr.Kind.toString = $estr;
hxdom.Attr.Kind.__enum__ = hxdom.Attr;
hxdom.Attr.Label = ["Label",54];
hxdom.Attr.Label.toString = $estr;
hxdom.Attr.Label.__enum__ = hxdom.Attr;
hxdom.Attr.Lang = ["Lang",55];
hxdom.Attr.Lang.toString = $estr;
hxdom.Attr.Lang.__enum__ = hxdom.Attr;
hxdom.Attr.Language = ["Language",56];
hxdom.Attr.Language.toString = $estr;
hxdom.Attr.Language.__enum__ = hxdom.Attr;
hxdom.Attr.List = ["List",57];
hxdom.Attr.List.toString = $estr;
hxdom.Attr.List.__enum__ = hxdom.Attr;
hxdom.Attr.Loop = ["Loop",58];
hxdom.Attr.Loop.toString = $estr;
hxdom.Attr.Loop.__enum__ = hxdom.Attr;
hxdom.Attr.Low = ["Low",59];
hxdom.Attr.Low.toString = $estr;
hxdom.Attr.Low.__enum__ = hxdom.Attr;
hxdom.Attr.Manifest = ["Manifest",60];
hxdom.Attr.Manifest.toString = $estr;
hxdom.Attr.Manifest.__enum__ = hxdom.Attr;
hxdom.Attr.Max = ["Max",61];
hxdom.Attr.Max.toString = $estr;
hxdom.Attr.Max.__enum__ = hxdom.Attr;
hxdom.Attr.Maxlength = ["Maxlength",62];
hxdom.Attr.Maxlength.toString = $estr;
hxdom.Attr.Maxlength.__enum__ = hxdom.Attr;
hxdom.Attr.Media = ["Media",63];
hxdom.Attr.Media.toString = $estr;
hxdom.Attr.Media.__enum__ = hxdom.Attr;
hxdom.Attr.Method = ["Method",64];
hxdom.Attr.Method.toString = $estr;
hxdom.Attr.Method.__enum__ = hxdom.Attr;
hxdom.Attr.Min = ["Min",65];
hxdom.Attr.Min.toString = $estr;
hxdom.Attr.Min.__enum__ = hxdom.Attr;
hxdom.Attr.Multiple = ["Multiple",66];
hxdom.Attr.Multiple.toString = $estr;
hxdom.Attr.Multiple.__enum__ = hxdom.Attr;
hxdom.Attr.Name = ["Name",67];
hxdom.Attr.Name.toString = $estr;
hxdom.Attr.Name.__enum__ = hxdom.Attr;
hxdom.Attr.Novalidate = ["Novalidate",68];
hxdom.Attr.Novalidate.toString = $estr;
hxdom.Attr.Novalidate.__enum__ = hxdom.Attr;
hxdom.Attr.Open = ["Open",69];
hxdom.Attr.Open.toString = $estr;
hxdom.Attr.Open.__enum__ = hxdom.Attr;
hxdom.Attr.Optimum = ["Optimum",70];
hxdom.Attr.Optimum.toString = $estr;
hxdom.Attr.Optimum.__enum__ = hxdom.Attr;
hxdom.Attr.Pattern = ["Pattern",71];
hxdom.Attr.Pattern.toString = $estr;
hxdom.Attr.Pattern.__enum__ = hxdom.Attr;
hxdom.Attr.Ping = ["Ping",72];
hxdom.Attr.Ping.toString = $estr;
hxdom.Attr.Ping.__enum__ = hxdom.Attr;
hxdom.Attr.Placeholder = ["Placeholder",73];
hxdom.Attr.Placeholder.toString = $estr;
hxdom.Attr.Placeholder.__enum__ = hxdom.Attr;
hxdom.Attr.Poster = ["Poster",74];
hxdom.Attr.Poster.toString = $estr;
hxdom.Attr.Poster.__enum__ = hxdom.Attr;
hxdom.Attr.Preload = ["Preload",75];
hxdom.Attr.Preload.toString = $estr;
hxdom.Attr.Preload.__enum__ = hxdom.Attr;
hxdom.Attr.Pubdate = ["Pubdate",76];
hxdom.Attr.Pubdate.toString = $estr;
hxdom.Attr.Pubdate.__enum__ = hxdom.Attr;
hxdom.Attr.Radiogroup = ["Radiogroup",77];
hxdom.Attr.Radiogroup.toString = $estr;
hxdom.Attr.Radiogroup.__enum__ = hxdom.Attr;
hxdom.Attr.Readonly = ["Readonly",78];
hxdom.Attr.Readonly.toString = $estr;
hxdom.Attr.Readonly.__enum__ = hxdom.Attr;
hxdom.Attr.Rel = ["Rel",79];
hxdom.Attr.Rel.toString = $estr;
hxdom.Attr.Rel.__enum__ = hxdom.Attr;
hxdom.Attr.Required = ["Required",80];
hxdom.Attr.Required.toString = $estr;
hxdom.Attr.Required.__enum__ = hxdom.Attr;
hxdom.Attr.Reversed = ["Reversed",81];
hxdom.Attr.Reversed.toString = $estr;
hxdom.Attr.Reversed.__enum__ = hxdom.Attr;
hxdom.Attr.Rows = ["Rows",82];
hxdom.Attr.Rows.toString = $estr;
hxdom.Attr.Rows.__enum__ = hxdom.Attr;
hxdom.Attr.Rowspan = ["Rowspan",83];
hxdom.Attr.Rowspan.toString = $estr;
hxdom.Attr.Rowspan.__enum__ = hxdom.Attr;
hxdom.Attr.Sandbox = ["Sandbox",84];
hxdom.Attr.Sandbox.toString = $estr;
hxdom.Attr.Sandbox.__enum__ = hxdom.Attr;
hxdom.Attr.Spellcheck = ["Spellcheck",85];
hxdom.Attr.Spellcheck.toString = $estr;
hxdom.Attr.Spellcheck.__enum__ = hxdom.Attr;
hxdom.Attr.Scope = ["Scope",86];
hxdom.Attr.Scope.toString = $estr;
hxdom.Attr.Scope.__enum__ = hxdom.Attr;
hxdom.Attr.Scoped = ["Scoped",87];
hxdom.Attr.Scoped.toString = $estr;
hxdom.Attr.Scoped.__enum__ = hxdom.Attr;
hxdom.Attr.Seamless = ["Seamless",88];
hxdom.Attr.Seamless.toString = $estr;
hxdom.Attr.Seamless.__enum__ = hxdom.Attr;
hxdom.Attr.Selected = ["Selected",89];
hxdom.Attr.Selected.toString = $estr;
hxdom.Attr.Selected.__enum__ = hxdom.Attr;
hxdom.Attr.Shape = ["Shape",90];
hxdom.Attr.Shape.toString = $estr;
hxdom.Attr.Shape.__enum__ = hxdom.Attr;
hxdom.Attr.Size = ["Size",91];
hxdom.Attr.Size.toString = $estr;
hxdom.Attr.Size.__enum__ = hxdom.Attr;
hxdom.Attr.Sizes = ["Sizes",92];
hxdom.Attr.Sizes.toString = $estr;
hxdom.Attr.Sizes.__enum__ = hxdom.Attr;
hxdom.Attr.Span = ["Span",93];
hxdom.Attr.Span.toString = $estr;
hxdom.Attr.Span.__enum__ = hxdom.Attr;
hxdom.Attr.Src = ["Src",94];
hxdom.Attr.Src.toString = $estr;
hxdom.Attr.Src.__enum__ = hxdom.Attr;
hxdom.Attr.Srcdoc = ["Srcdoc",95];
hxdom.Attr.Srcdoc.toString = $estr;
hxdom.Attr.Srcdoc.__enum__ = hxdom.Attr;
hxdom.Attr.Srclang = ["Srclang",96];
hxdom.Attr.Srclang.toString = $estr;
hxdom.Attr.Srclang.__enum__ = hxdom.Attr;
hxdom.Attr.Start = ["Start",97];
hxdom.Attr.Start.toString = $estr;
hxdom.Attr.Start.__enum__ = hxdom.Attr;
hxdom.Attr.Step = ["Step",98];
hxdom.Attr.Step.toString = $estr;
hxdom.Attr.Step.__enum__ = hxdom.Attr;
hxdom.Attr.Style = ["Style",99];
hxdom.Attr.Style.toString = $estr;
hxdom.Attr.Style.__enum__ = hxdom.Attr;
hxdom.Attr.Summary = ["Summary",100];
hxdom.Attr.Summary.toString = $estr;
hxdom.Attr.Summary.__enum__ = hxdom.Attr;
hxdom.Attr.Tabindex = ["Tabindex",101];
hxdom.Attr.Tabindex.toString = $estr;
hxdom.Attr.Tabindex.__enum__ = hxdom.Attr;
hxdom.Attr.Target = ["Target",102];
hxdom.Attr.Target.toString = $estr;
hxdom.Attr.Target.__enum__ = hxdom.Attr;
hxdom.Attr.Title = ["Title",103];
hxdom.Attr.Title.toString = $estr;
hxdom.Attr.Title.__enum__ = hxdom.Attr;
hxdom.Attr.Type = ["Type",104];
hxdom.Attr.Type.toString = $estr;
hxdom.Attr.Type.__enum__ = hxdom.Attr;
hxdom.Attr.Usemap = ["Usemap",105];
hxdom.Attr.Usemap.toString = $estr;
hxdom.Attr.Usemap.__enum__ = hxdom.Attr;
hxdom.Attr.Value = ["Value",106];
hxdom.Attr.Value.toString = $estr;
hxdom.Attr.Value.__enum__ = hxdom.Attr;
hxdom.Attr.Width = ["Width",107];
hxdom.Attr.Width.toString = $estr;
hxdom.Attr.Width.__enum__ = hxdom.Attr;
hxdom.Attr.Wrap = ["Wrap",108];
hxdom.Attr.Wrap.toString = $estr;
hxdom.Attr.Wrap.__enum__ = hxdom.Attr;
hxdom.DomTools = function() { }
$hxClasses["hxdom.DomTools"] = hxdom.DomTools;
hxdom.DomTools.__name__ = ["hxdom","DomTools"];
hxdom.DomTools.add = function(parent,child) {
	parent.appendChild(child);
	return parent;
}
hxdom.DomTools.remove = function(parent,child) {
	parent.removeChild(child);
	return parent;
}
hxdom.DomTools.insert = function(parent,child,ref) {
	parent.insertBefore(child,ref);
	return parent;
}
hxdom.DomTools.clear = function(node) {
	while(node.node.childNodes.length > 0) node.node.removeChild(node.node.firstChild);
	return node;
}
hxdom.DomTools.classes = function(e,cls) {
	if(e.node.className == null || e.node.className == "") e.node.className = cls; else e.node.className += " " + cls;
	return e;
}
hxdom.DomTools.hasClass = function(e,cls) {
	if(e.node.className != null && e.node.className != "") {
		var ecls = e.node.className.split(" ");
		var newCls = new Array();
		var _g = 0;
		while(_g < ecls.length) {
			var i = ecls[_g];
			++_g;
			if(cls == i) return true;
		}
	}
	return false;
}
hxdom.DomTools.removeClasses = function(e,cls) {
	if(e.node.className != null && e.node.className != "") {
		var clsArr = cls.split(" ");
		var ecls = e.node.className.split(" ");
		var newCls = new Array();
		var _g = 0;
		while(_g < ecls.length) {
			var i = ecls[_g];
			++_g;
			if(!Lambda.has(clsArr,i)) newCls.push(i);
		}
		e.node.className = newCls.join(" ");
	}
	return e;
}
hxdom.DomTools.addText = function(parent,text) {
	parent.appendChild(new hxdom.Text(text));
	return parent;
}
hxdom.DomTools.setText = function(parent,text) {
	hxdom.DomTools.clear(parent);
	parent.appendChild(new hxdom.Text(text));
	return parent;
}
hxdom.DomTools.addHtml = function(parent,html) {
	parent.appendChild(new hxdom.HtmlSnippet(html));
	return parent;
}
hxdom.DomTools.setHtml = function(parent,html) {
	hxdom.DomTools.clear(parent);
	parent.appendChild(new hxdom.HtmlSnippet(html));
	return parent;
}
hxdom.DomTools.unsafeAttr = function(e,key,val) {
	e.node[key] = val;
	return e;
}
hxdom.DomTools.attr = function(e,key,val) {
	var keyStr = Std.string(key);
	hxdom.DomTools.unsafeAttr(e,keyStr.charAt(0).toLowerCase() + HxOverrides.substr(keyStr,1,null),val);
	return e;
}
hxdom.DomTools.dashToCamelCase = function(str) {
	var outStr = "";
	var caps = false;
	var _g1 = 0, _g = str.length;
	while(_g1 < _g) {
		var i = _g1++;
		var chr = HxOverrides.cca(str,i);
		if(chr == 45) caps = true; else {
			if(caps) {
				if(chr >= 97 && chr <= 122) chr += -32;
				caps = false;
			}
			outStr += String.fromCharCode(chr);
		}
	}
	return outStr;
}
hxdom.DomTools.camelCaseToDash = function(str) {
	var outStr = "";
	var _g1 = 0, _g = str.length;
	while(_g1 < _g) {
		var i = _g1++;
		var chr = HxOverrides.cca(str,i);
		if(chr >= 65 && chr <= 90) outStr += "-" + String.fromCharCode(chr - 65 + 97); else outStr += String.fromCharCode(chr);
	}
	return outStr;
}
hxdom.DomTools.vnode = function(node) {
	return Reflect.field(node,"__vdom");
}
hxdom.DomTools.delegate = function(event,type) {
	var currNode = js.Boot.__cast(event.target , Node);
	while(currNode != null && currNode != event.currentTarget) {
		var vnode = Reflect.field(currNode,"__vdom");
		if(js.Boot.__instanceof(vnode,type)) return vnode;
		currNode = currNode.parentNode;
	}
	return null;
}
hxdom.InputType = $hxClasses["hxdom.InputType"] = { __ename__ : ["hxdom","InputType"], __constructs__ : ["Button","Checkbox","Color","Date","DateTime","DateTimeLocal","Email","File","Hidden","Image","Month","Number","Password","Radio","Range","Reset","Search","Submit","Telephone","IText","Time","Url","Week"] }
hxdom.InputType.Button = ["Button",0];
hxdom.InputType.Button.toString = $estr;
hxdom.InputType.Button.__enum__ = hxdom.InputType;
hxdom.InputType.Checkbox = ["Checkbox",1];
hxdom.InputType.Checkbox.toString = $estr;
hxdom.InputType.Checkbox.__enum__ = hxdom.InputType;
hxdom.InputType.Color = ["Color",2];
hxdom.InputType.Color.toString = $estr;
hxdom.InputType.Color.__enum__ = hxdom.InputType;
hxdom.InputType.Date = ["Date",3];
hxdom.InputType.Date.toString = $estr;
hxdom.InputType.Date.__enum__ = hxdom.InputType;
hxdom.InputType.DateTime = ["DateTime",4];
hxdom.InputType.DateTime.toString = $estr;
hxdom.InputType.DateTime.__enum__ = hxdom.InputType;
hxdom.InputType.DateTimeLocal = ["DateTimeLocal",5];
hxdom.InputType.DateTimeLocal.toString = $estr;
hxdom.InputType.DateTimeLocal.__enum__ = hxdom.InputType;
hxdom.InputType.Email = ["Email",6];
hxdom.InputType.Email.toString = $estr;
hxdom.InputType.Email.__enum__ = hxdom.InputType;
hxdom.InputType.File = ["File",7];
hxdom.InputType.File.toString = $estr;
hxdom.InputType.File.__enum__ = hxdom.InputType;
hxdom.InputType.Hidden = ["Hidden",8];
hxdom.InputType.Hidden.toString = $estr;
hxdom.InputType.Hidden.__enum__ = hxdom.InputType;
hxdom.InputType.Image = ["Image",9];
hxdom.InputType.Image.toString = $estr;
hxdom.InputType.Image.__enum__ = hxdom.InputType;
hxdom.InputType.Month = ["Month",10];
hxdom.InputType.Month.toString = $estr;
hxdom.InputType.Month.__enum__ = hxdom.InputType;
hxdom.InputType.Number = ["Number",11];
hxdom.InputType.Number.toString = $estr;
hxdom.InputType.Number.__enum__ = hxdom.InputType;
hxdom.InputType.Password = ["Password",12];
hxdom.InputType.Password.toString = $estr;
hxdom.InputType.Password.__enum__ = hxdom.InputType;
hxdom.InputType.Radio = ["Radio",13];
hxdom.InputType.Radio.toString = $estr;
hxdom.InputType.Radio.__enum__ = hxdom.InputType;
hxdom.InputType.Range = ["Range",14];
hxdom.InputType.Range.toString = $estr;
hxdom.InputType.Range.__enum__ = hxdom.InputType;
hxdom.InputType.Reset = ["Reset",15];
hxdom.InputType.Reset.toString = $estr;
hxdom.InputType.Reset.__enum__ = hxdom.InputType;
hxdom.InputType.Search = ["Search",16];
hxdom.InputType.Search.toString = $estr;
hxdom.InputType.Search.__enum__ = hxdom.InputType;
hxdom.InputType.Submit = ["Submit",17];
hxdom.InputType.Submit.toString = $estr;
hxdom.InputType.Submit.__enum__ = hxdom.InputType;
hxdom.InputType.Telephone = ["Telephone",18];
hxdom.InputType.Telephone.toString = $estr;
hxdom.InputType.Telephone.__enum__ = hxdom.InputType;
hxdom.InputType.IText = ["IText",19];
hxdom.InputType.IText.toString = $estr;
hxdom.InputType.IText.__enum__ = hxdom.InputType;
hxdom.InputType.Time = ["Time",20];
hxdom.InputType.Time.toString = $estr;
hxdom.InputType.Time.__enum__ = hxdom.InputType;
hxdom.InputType.Url = ["Url",21];
hxdom.InputType.Url.toString = $estr;
hxdom.InputType.Url.__enum__ = hxdom.InputType;
hxdom.InputType.Week = ["Week",22];
hxdom.InputType.Week.toString = $estr;
hxdom.InputType.Week.__enum__ = hxdom.InputType;
hxdom.ButtonType = $hxClasses["hxdom.ButtonType"] = { __ename__ : ["hxdom","ButtonType"], __constructs__ : ["Button","Submit","Reset"] }
hxdom.ButtonType.Button = ["Button",0];
hxdom.ButtonType.Button.toString = $estr;
hxdom.ButtonType.Button.__enum__ = hxdom.ButtonType;
hxdom.ButtonType.Submit = ["Submit",1];
hxdom.ButtonType.Submit.toString = $estr;
hxdom.ButtonType.Submit.__enum__ = hxdom.ButtonType;
hxdom.ButtonType.Reset = ["Reset",2];
hxdom.ButtonType.Reset.toString = $estr;
hxdom.ButtonType.Reset.__enum__ = hxdom.ButtonType;
hxdom._Elements = {}
hxdom._Elements.VirtualNodeIterator = function(node) {
	this.child = node.node.firstChild;
};
$hxClasses["hxdom._Elements.VirtualNodeIterator"] = hxdom._Elements.VirtualNodeIterator;
hxdom._Elements.VirtualNodeIterator.__name__ = ["hxdom","_Elements","VirtualNodeIterator"];
hxdom._Elements.VirtualNodeIterator.prototype = {
	next: function() {
		var c = this.child;
		this.child = this.child.nextSibling;
		return Reflect.field(c,"__vdom");
	}
	,hasNext: function() {
		return this.child != null;
	}
	,iterator: function() {
		return this;
	}
	,__class__: hxdom._Elements.VirtualNodeIterator
}
hxdom.EAnchor = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLAnchorElement,"A"));
};
$hxClasses["hxdom.EAnchor"] = hxdom.EAnchor;
hxdom.EAnchor.__name__ = ["hxdom","EAnchor"];
hxdom.EAnchor.__super__ = hxdom.VirtualElement;
hxdom.EAnchor.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EAnchor
});
hxdom.EAbbr = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"ABBR"));
};
$hxClasses["hxdom.EAbbr"] = hxdom.EAbbr;
hxdom.EAbbr.__name__ = ["hxdom","EAbbr"];
hxdom.EAbbr.__super__ = hxdom.VirtualElement;
hxdom.EAbbr.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EAbbr
});
hxdom.EAddress = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"ADDRESS"));
};
$hxClasses["hxdom.EAddress"] = hxdom.EAddress;
hxdom.EAddress.__name__ = ["hxdom","EAddress"];
hxdom.EAddress.__super__ = hxdom.VirtualElement;
hxdom.EAddress.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EAddress
});
hxdom.EArea = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"AREA"));
};
$hxClasses["hxdom.EArea"] = hxdom.EArea;
hxdom.EArea.__name__ = ["hxdom","EArea"];
hxdom.EArea.__super__ = hxdom.VirtualElement;
hxdom.EArea.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EArea
});
hxdom.EAudio = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLAudioElement,"AUDIO"));
};
$hxClasses["hxdom.EAudio"] = hxdom.EAudio;
hxdom.EAudio.__name__ = ["hxdom","EAudio"];
hxdom.EAudio.__super__ = hxdom.VirtualElement;
hxdom.EAudio.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EAudio
});
hxdom.EBold = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"B"));
};
$hxClasses["hxdom.EBold"] = hxdom.EBold;
hxdom.EBold.__name__ = ["hxdom","EBold"];
hxdom.EBold.__super__ = hxdom.VirtualElement;
hxdom.EBold.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EBold
});
hxdom.EBase = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLBaseElement,"BASE"));
};
$hxClasses["hxdom.EBase"] = hxdom.EBase;
hxdom.EBase.__name__ = ["hxdom","EBase"];
hxdom.EBase.__super__ = hxdom.VirtualElement;
hxdom.EBase.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EBase
});
hxdom.EBiIsolation = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"BDI"));
};
$hxClasses["hxdom.EBiIsolation"] = hxdom.EBiIsolation;
hxdom.EBiIsolation.__name__ = ["hxdom","EBiIsolation"];
hxdom.EBiIsolation.__super__ = hxdom.VirtualElement;
hxdom.EBiIsolation.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EBiIsolation
});
hxdom.EBiOverride = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"BDO"));
};
$hxClasses["hxdom.EBiOverride"] = hxdom.EBiOverride;
hxdom.EBiOverride.__name__ = ["hxdom","EBiOverride"];
hxdom.EBiOverride.__super__ = hxdom.VirtualElement;
hxdom.EBiOverride.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EBiOverride
});
hxdom.EBlockQuote = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"BLOCKQUOTE"));
};
$hxClasses["hxdom.EBlockQuote"] = hxdom.EBlockQuote;
hxdom.EBlockQuote.__name__ = ["hxdom","EBlockQuote"];
hxdom.EBlockQuote.__super__ = hxdom.VirtualElement;
hxdom.EBlockQuote.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EBlockQuote
});
hxdom.EBreak = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLBRElement,"BR"));
};
$hxClasses["hxdom.EBreak"] = hxdom.EBreak;
hxdom.EBreak.__name__ = ["hxdom","EBreak"];
hxdom.EBreak.__super__ = hxdom.VirtualElement;
hxdom.EBreak.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EBreak
});
hxdom.EButton = function(type) {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLButtonElement,"BUTTON"));
	if(type == null) type = hxdom.ButtonType.Button;
	this.node.type = (function($this) {
		var $r;
		switch( (type)[1] ) {
		case 0:
			$r = "button";
			break;
		case 1:
			$r = "submit";
			break;
		case 2:
			$r = "reset";
			break;
		}
		return $r;
	}(this));
};
$hxClasses["hxdom.EButton"] = hxdom.EButton;
hxdom.EButton.__name__ = ["hxdom","EButton"];
hxdom.EButton.__super__ = hxdom.VirtualElement;
hxdom.EButton.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EButton
});
hxdom.ECanvas = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLCanvasElement,"CANVAS"));
};
$hxClasses["hxdom.ECanvas"] = hxdom.ECanvas;
hxdom.ECanvas.__name__ = ["hxdom","ECanvas"];
hxdom.ECanvas.__super__ = hxdom.VirtualElement;
hxdom.ECanvas.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ECanvas
});
hxdom.ECaption = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"CAPTION"));
};
$hxClasses["hxdom.ECaption"] = hxdom.ECaption;
hxdom.ECaption.__name__ = ["hxdom","ECaption"];
hxdom.ECaption.__super__ = hxdom.VirtualElement;
hxdom.ECaption.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ECaption
});
hxdom.ECite = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"CITE"));
};
$hxClasses["hxdom.ECite"] = hxdom.ECite;
hxdom.ECite.__name__ = ["hxdom","ECite"];
hxdom.ECite.__super__ = hxdom.VirtualElement;
hxdom.ECite.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ECite
});
hxdom.ECode = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"CODE"));
};
$hxClasses["hxdom.ECode"] = hxdom.ECode;
hxdom.ECode.__name__ = ["hxdom","ECode"];
hxdom.ECode.__super__ = hxdom.VirtualElement;
hxdom.ECode.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ECode
});
hxdom.EColumn = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"COL"));
};
$hxClasses["hxdom.EColumn"] = hxdom.EColumn;
hxdom.EColumn.__name__ = ["hxdom","EColumn"];
hxdom.EColumn.__super__ = hxdom.VirtualElement;
hxdom.EColumn.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EColumn
});
hxdom.EColumnGroup = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"COLGROUP"));
};
$hxClasses["hxdom.EColumnGroup"] = hxdom.EColumnGroup;
hxdom.EColumnGroup.__name__ = ["hxdom","EColumnGroup"];
hxdom.EColumnGroup.__super__ = hxdom.VirtualElement;
hxdom.EColumnGroup.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EColumnGroup
});
hxdom.EData = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"DATA"));
};
$hxClasses["hxdom.EData"] = hxdom.EData;
hxdom.EData.__name__ = ["hxdom","EData"];
hxdom.EData.__super__ = hxdom.VirtualElement;
hxdom.EData.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EData
});
hxdom.EDataList = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLDataListElement,"DATALIST"));
};
$hxClasses["hxdom.EDataList"] = hxdom.EDataList;
hxdom.EDataList.__name__ = ["hxdom","EDataList"];
hxdom.EDataList.__super__ = hxdom.VirtualElement;
hxdom.EDataList.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EDataList
});
hxdom.EDescription = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"DD"));
};
$hxClasses["hxdom.EDescription"] = hxdom.EDescription;
hxdom.EDescription.__name__ = ["hxdom","EDescription"];
hxdom.EDescription.__super__ = hxdom.VirtualElement;
hxdom.EDescription.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EDescription
});
hxdom.EDeleted = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"DEL"));
};
$hxClasses["hxdom.EDeleted"] = hxdom.EDeleted;
hxdom.EDeleted.__name__ = ["hxdom","EDeleted"];
hxdom.EDeleted.__super__ = hxdom.VirtualElement;
hxdom.EDeleted.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EDeleted
});
hxdom.EDetails = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLDetailsElement,"DETAILS"));
};
$hxClasses["hxdom.EDetails"] = hxdom.EDetails;
hxdom.EDetails.__name__ = ["hxdom","EDetails"];
hxdom.EDetails.__super__ = hxdom.VirtualElement;
hxdom.EDetails.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EDetails
});
hxdom.EDefinition = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"DEFINITION"));
};
$hxClasses["hxdom.EDefinition"] = hxdom.EDefinition;
hxdom.EDefinition.__name__ = ["hxdom","EDefinition"];
hxdom.EDefinition.__super__ = hxdom.VirtualElement;
hxdom.EDefinition.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EDefinition
});
hxdom.EDiv = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLDivElement,"DIV"));
};
$hxClasses["hxdom.EDiv"] = hxdom.EDiv;
hxdom.EDiv.__name__ = ["hxdom","EDiv"];
hxdom.EDiv.__super__ = hxdom.VirtualElement;
hxdom.EDiv.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EDiv
});
hxdom.EDescriptionList = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLDListElement,"DL"));
};
$hxClasses["hxdom.EDescriptionList"] = hxdom.EDescriptionList;
hxdom.EDescriptionList.__name__ = ["hxdom","EDescriptionList"];
hxdom.EDescriptionList.__super__ = hxdom.VirtualElement;
hxdom.EDescriptionList.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EDescriptionList
});
hxdom.EDefinitionTerm = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"DT"));
};
$hxClasses["hxdom.EDefinitionTerm"] = hxdom.EDefinitionTerm;
hxdom.EDefinitionTerm.__name__ = ["hxdom","EDefinitionTerm"];
hxdom.EDefinitionTerm.__super__ = hxdom.VirtualElement;
hxdom.EDefinitionTerm.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EDefinitionTerm
});
hxdom.EEmphasis = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"EM"));
};
$hxClasses["hxdom.EEmphasis"] = hxdom.EEmphasis;
hxdom.EEmphasis.__name__ = ["hxdom","EEmphasis"];
hxdom.EEmphasis.__super__ = hxdom.VirtualElement;
hxdom.EEmphasis.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EEmphasis
});
hxdom.EEmbed = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLEmbedElement,"EMBED"));
};
$hxClasses["hxdom.EEmbed"] = hxdom.EEmbed;
hxdom.EEmbed.__name__ = ["hxdom","EEmbed"];
hxdom.EEmbed.__super__ = hxdom.VirtualElement;
hxdom.EEmbed.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EEmbed
});
hxdom.EFieldSet = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLFieldSetElement,"FIELDSET"));
};
$hxClasses["hxdom.EFieldSet"] = hxdom.EFieldSet;
hxdom.EFieldSet.__name__ = ["hxdom","EFieldSet"];
hxdom.EFieldSet.__super__ = hxdom.VirtualElement;
hxdom.EFieldSet.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EFieldSet
});
hxdom.EFigureCaption = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"FIGCAPTION"));
};
$hxClasses["hxdom.EFigureCaption"] = hxdom.EFigureCaption;
hxdom.EFigureCaption.__name__ = ["hxdom","EFigureCaption"];
hxdom.EFigureCaption.__super__ = hxdom.VirtualElement;
hxdom.EFigureCaption.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EFigureCaption
});
hxdom.EFigure = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"FIGURE"));
};
$hxClasses["hxdom.EFigure"] = hxdom.EFigure;
hxdom.EFigure.__name__ = ["hxdom","EFigure"];
hxdom.EFigure.__super__ = hxdom.VirtualElement;
hxdom.EFigure.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EFigure
});
hxdom.EFooter = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"FOOTER"));
};
$hxClasses["hxdom.EFooter"] = hxdom.EFooter;
hxdom.EFooter.__name__ = ["hxdom","EFooter"];
hxdom.EFooter.__super__ = hxdom.VirtualElement;
hxdom.EFooter.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EFooter
});
hxdom.EForm = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLFormElement,"FORM"));
};
$hxClasses["hxdom.EForm"] = hxdom.EForm;
hxdom.EForm.__name__ = ["hxdom","EForm"];
hxdom.EForm.__super__ = hxdom.VirtualElement;
hxdom.EForm.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EForm
});
hxdom.EHeader1 = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"H1"));
};
$hxClasses["hxdom.EHeader1"] = hxdom.EHeader1;
hxdom.EHeader1.__name__ = ["hxdom","EHeader1"];
hxdom.EHeader1.__super__ = hxdom.VirtualElement;
hxdom.EHeader1.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EHeader1
});
hxdom.EHeader2 = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"H2"));
};
$hxClasses["hxdom.EHeader2"] = hxdom.EHeader2;
hxdom.EHeader2.__name__ = ["hxdom","EHeader2"];
hxdom.EHeader2.__super__ = hxdom.VirtualElement;
hxdom.EHeader2.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EHeader2
});
hxdom.EHeader3 = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"H3"));
};
$hxClasses["hxdom.EHeader3"] = hxdom.EHeader3;
hxdom.EHeader3.__name__ = ["hxdom","EHeader3"];
hxdom.EHeader3.__super__ = hxdom.VirtualElement;
hxdom.EHeader3.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EHeader3
});
hxdom.EHeader4 = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"H4"));
};
$hxClasses["hxdom.EHeader4"] = hxdom.EHeader4;
hxdom.EHeader4.__name__ = ["hxdom","EHeader4"];
hxdom.EHeader4.__super__ = hxdom.VirtualElement;
hxdom.EHeader4.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EHeader4
});
hxdom.EHeader5 = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"H5"));
};
$hxClasses["hxdom.EHeader5"] = hxdom.EHeader5;
hxdom.EHeader5.__name__ = ["hxdom","EHeader5"];
hxdom.EHeader5.__super__ = hxdom.VirtualElement;
hxdom.EHeader5.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EHeader5
});
hxdom.EHeader6 = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"H6"));
};
$hxClasses["hxdom.EHeader6"] = hxdom.EHeader6;
hxdom.EHeader6.__name__ = ["hxdom","EHeader6"];
hxdom.EHeader6.__super__ = hxdom.VirtualElement;
hxdom.EHeader6.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EHeader6
});
hxdom.EHead = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLHeadElement,"HEAD"));
};
$hxClasses["hxdom.EHead"] = hxdom.EHead;
hxdom.EHead.__name__ = ["hxdom","EHead"];
hxdom.EHead.__super__ = hxdom.VirtualElement;
hxdom.EHead.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EHead
});
hxdom.EHeader = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"HEADER"));
};
$hxClasses["hxdom.EHeader"] = hxdom.EHeader;
hxdom.EHeader.__name__ = ["hxdom","EHeader"];
hxdom.EHeader.__super__ = hxdom.VirtualElement;
hxdom.EHeader.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EHeader
});
hxdom.EHorizontalRule = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLHRElement,"HR"));
};
$hxClasses["hxdom.EHorizontalRule"] = hxdom.EHorizontalRule;
hxdom.EHorizontalRule.__name__ = ["hxdom","EHorizontalRule"];
hxdom.EHorizontalRule.__super__ = hxdom.VirtualElement;
hxdom.EHorizontalRule.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EHorizontalRule
});
hxdom.EItalics = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"I"));
};
$hxClasses["hxdom.EItalics"] = hxdom.EItalics;
hxdom.EItalics.__name__ = ["hxdom","EItalics"];
hxdom.EItalics.__super__ = hxdom.VirtualElement;
hxdom.EItalics.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EItalics
});
hxdom.EIFrame = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLIFrameElement,"IFRAME"));
};
$hxClasses["hxdom.EIFrame"] = hxdom.EIFrame;
hxdom.EIFrame.__name__ = ["hxdom","EIFrame"];
hxdom.EIFrame.__super__ = hxdom.VirtualElement;
hxdom.EIFrame.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EIFrame
});
hxdom.EImage = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLImageElement,"IMG"));
};
$hxClasses["hxdom.EImage"] = hxdom.EImage;
hxdom.EImage.__name__ = ["hxdom","EImage"];
hxdom.EImage.__super__ = hxdom.VirtualElement;
hxdom.EImage.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EImage
});
hxdom.EInput = function(type) {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLInputElement,"INPUT"));
	this.node.type = (function($this) {
		var $r;
		switch( (type)[1] ) {
		case 0:
			$r = "button";
			break;
		case 1:
			$r = "checkbox";
			break;
		case 2:
			$r = "color";
			break;
		case 3:
			$r = "date";
			break;
		case 4:
			$r = "datetime";
			break;
		case 5:
			$r = "datetime-local";
			break;
		case 6:
			$r = "email";
			break;
		case 7:
			$r = "file";
			break;
		case 8:
			$r = "hidden";
			break;
		case 9:
			$r = "image";
			break;
		case 10:
			$r = "month";
			break;
		case 11:
			$r = "number";
			break;
		case 12:
			$r = "password";
			break;
		case 13:
			$r = "radio";
			break;
		case 14:
			$r = "range";
			break;
		case 15:
			$r = "reset";
			break;
		case 16:
			$r = "search";
			break;
		case 17:
			$r = "submit";
			break;
		case 18:
			$r = "tel";
			break;
		case 19:
			$r = "text";
			break;
		case 20:
			$r = "time";
			break;
		case 21:
			$r = "url";
			break;
		case 22:
			$r = "week";
			break;
		}
		return $r;
	}(this));
};
$hxClasses["hxdom.EInput"] = hxdom.EInput;
hxdom.EInput.__name__ = ["hxdom","EInput"];
hxdom.EInput.__super__ = hxdom.VirtualElement;
hxdom.EInput.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EInput
});
hxdom.EInserted = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"INS"));
};
$hxClasses["hxdom.EInserted"] = hxdom.EInserted;
hxdom.EInserted.__name__ = ["hxdom","EInserted"];
hxdom.EInserted.__super__ = hxdom.VirtualElement;
hxdom.EInserted.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EInserted
});
hxdom.EKeyboard = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"KBD"));
};
$hxClasses["hxdom.EKeyboard"] = hxdom.EKeyboard;
hxdom.EKeyboard.__name__ = ["hxdom","EKeyboard"];
hxdom.EKeyboard.__super__ = hxdom.VirtualElement;
hxdom.EKeyboard.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EKeyboard
});
hxdom.EKeygen = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLKeygenElement,"KEYGEN"));
};
$hxClasses["hxdom.EKeygen"] = hxdom.EKeygen;
hxdom.EKeygen.__name__ = ["hxdom","EKeygen"];
hxdom.EKeygen.__super__ = hxdom.VirtualElement;
hxdom.EKeygen.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EKeygen
});
hxdom.ELabel = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLLabelElement,"LABEL"));
};
$hxClasses["hxdom.ELabel"] = hxdom.ELabel;
hxdom.ELabel.__name__ = ["hxdom","ELabel"];
hxdom.ELabel.__super__ = hxdom.VirtualElement;
hxdom.ELabel.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ELabel
});
hxdom.ELegend = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLLegendElement,"LEGEND"));
};
$hxClasses["hxdom.ELegend"] = hxdom.ELegend;
hxdom.ELegend.__name__ = ["hxdom","ELegend"];
hxdom.ELegend.__super__ = hxdom.VirtualElement;
hxdom.ELegend.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ELegend
});
hxdom.EListItem = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLLIElement,"LI"));
};
$hxClasses["hxdom.EListItem"] = hxdom.EListItem;
hxdom.EListItem.__name__ = ["hxdom","EListItem"];
hxdom.EListItem.__super__ = hxdom.VirtualElement;
hxdom.EListItem.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EListItem
});
hxdom.ELink = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLLinkElement,"LINK"));
};
$hxClasses["hxdom.ELink"] = hxdom.ELink;
hxdom.ELink.__name__ = ["hxdom","ELink"];
hxdom.ELink.__super__ = hxdom.VirtualElement;
hxdom.ELink.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ELink
});
hxdom.EMain = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"MAIN"));
};
$hxClasses["hxdom.EMain"] = hxdom.EMain;
hxdom.EMain.__name__ = ["hxdom","EMain"];
hxdom.EMain.__super__ = hxdom.VirtualElement;
hxdom.EMain.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EMain
});
hxdom.EMap = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLMapElement,"MAP"));
};
$hxClasses["hxdom.EMap"] = hxdom.EMap;
hxdom.EMap.__name__ = ["hxdom","EMap"];
hxdom.EMap.__super__ = hxdom.VirtualElement;
hxdom.EMap.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EMap
});
hxdom.EMark = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"MARK"));
};
$hxClasses["hxdom.EMark"] = hxdom.EMark;
hxdom.EMark.__name__ = ["hxdom","EMark"];
hxdom.EMark.__super__ = hxdom.VirtualElement;
hxdom.EMark.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EMark
});
hxdom.EMenu = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLMenuElement,"MENU"));
};
$hxClasses["hxdom.EMenu"] = hxdom.EMenu;
hxdom.EMenu.__name__ = ["hxdom","EMenu"];
hxdom.EMenu.__super__ = hxdom.VirtualElement;
hxdom.EMenu.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EMenu
});
hxdom.EMenuItem = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"MENUITEM"));
};
$hxClasses["hxdom.EMenuItem"] = hxdom.EMenuItem;
hxdom.EMenuItem.__name__ = ["hxdom","EMenuItem"];
hxdom.EMenuItem.__super__ = hxdom.VirtualElement;
hxdom.EMenuItem.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EMenuItem
});
hxdom.EMeta = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLMetaElement,"META"));
};
$hxClasses["hxdom.EMeta"] = hxdom.EMeta;
hxdom.EMeta.__name__ = ["hxdom","EMeta"];
hxdom.EMeta.__super__ = hxdom.VirtualElement;
hxdom.EMeta.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EMeta
});
hxdom.EMeter = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLMeterElement,"METER"));
};
$hxClasses["hxdom.EMeter"] = hxdom.EMeter;
hxdom.EMeter.__name__ = ["hxdom","EMeter"];
hxdom.EMeter.__super__ = hxdom.VirtualElement;
hxdom.EMeter.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EMeter
});
hxdom.ENav = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"NAV"));
};
$hxClasses["hxdom.ENav"] = hxdom.ENav;
hxdom.ENav.__name__ = ["hxdom","ENav"];
hxdom.ENav.__super__ = hxdom.VirtualElement;
hxdom.ENav.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ENav
});
hxdom.ENoScript = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"NOSCRIPT"));
};
$hxClasses["hxdom.ENoScript"] = hxdom.ENoScript;
hxdom.ENoScript.__name__ = ["hxdom","ENoScript"];
hxdom.ENoScript.__super__ = hxdom.VirtualElement;
hxdom.ENoScript.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ENoScript
});
hxdom.EObject = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLObjectElement,"OBJECT"));
};
$hxClasses["hxdom.EObject"] = hxdom.EObject;
hxdom.EObject.__name__ = ["hxdom","EObject"];
hxdom.EObject.__super__ = hxdom.VirtualElement;
hxdom.EObject.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EObject
});
hxdom.EOrderedList = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLOListElement,"OL"));
};
$hxClasses["hxdom.EOrderedList"] = hxdom.EOrderedList;
hxdom.EOrderedList.__name__ = ["hxdom","EOrderedList"];
hxdom.EOrderedList.__super__ = hxdom.VirtualElement;
hxdom.EOrderedList.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EOrderedList
});
hxdom.EOptionGroup = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLOptGroupElement,"OPTGROUP"));
};
$hxClasses["hxdom.EOptionGroup"] = hxdom.EOptionGroup;
hxdom.EOptionGroup.__name__ = ["hxdom","EOptionGroup"];
hxdom.EOptionGroup.__super__ = hxdom.VirtualElement;
hxdom.EOptionGroup.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EOptionGroup
});
hxdom.EOption = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLOptionElement,"OPTION"));
};
$hxClasses["hxdom.EOption"] = hxdom.EOption;
hxdom.EOption.__name__ = ["hxdom","EOption"];
hxdom.EOption.__super__ = hxdom.VirtualElement;
hxdom.EOption.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EOption
});
hxdom.EOutput = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLOutputElement,"OUTPUT"));
};
$hxClasses["hxdom.EOutput"] = hxdom.EOutput;
hxdom.EOutput.__name__ = ["hxdom","EOutput"];
hxdom.EOutput.__super__ = hxdom.VirtualElement;
hxdom.EOutput.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EOutput
});
hxdom.EParagraph = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLParagraphElement,"P"));
};
$hxClasses["hxdom.EParagraph"] = hxdom.EParagraph;
hxdom.EParagraph.__name__ = ["hxdom","EParagraph"];
hxdom.EParagraph.__super__ = hxdom.VirtualElement;
hxdom.EParagraph.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EParagraph
});
hxdom.EParam = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLParamElement,"PARAM"));
};
$hxClasses["hxdom.EParam"] = hxdom.EParam;
hxdom.EParam.__name__ = ["hxdom","EParam"];
hxdom.EParam.__super__ = hxdom.VirtualElement;
hxdom.EParam.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EParam
});
hxdom.EPre = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLPreElement,"PRE"));
};
$hxClasses["hxdom.EPre"] = hxdom.EPre;
hxdom.EPre.__name__ = ["hxdom","EPre"];
hxdom.EPre.__super__ = hxdom.VirtualElement;
hxdom.EPre.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EPre
});
hxdom.EProgress = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLProgressElement,"PROGRESS"));
};
$hxClasses["hxdom.EProgress"] = hxdom.EProgress;
hxdom.EProgress.__name__ = ["hxdom","EProgress"];
hxdom.EProgress.__super__ = hxdom.VirtualElement;
hxdom.EProgress.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EProgress
});
hxdom.EQuote = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLQuoteElement,"Q"));
};
$hxClasses["hxdom.EQuote"] = hxdom.EQuote;
hxdom.EQuote.__name__ = ["hxdom","EQuote"];
hxdom.EQuote.__super__ = hxdom.VirtualElement;
hxdom.EQuote.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EQuote
});
hxdom.ERubyParen = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"RP"));
};
$hxClasses["hxdom.ERubyParen"] = hxdom.ERubyParen;
hxdom.ERubyParen.__name__ = ["hxdom","ERubyParen"];
hxdom.ERubyParen.__super__ = hxdom.VirtualElement;
hxdom.ERubyParen.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ERubyParen
});
hxdom.ERubyPrononcuation = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"RT"));
};
$hxClasses["hxdom.ERubyPrononcuation"] = hxdom.ERubyPrononcuation;
hxdom.ERubyPrononcuation.__name__ = ["hxdom","ERubyPrononcuation"];
hxdom.ERubyPrononcuation.__super__ = hxdom.VirtualElement;
hxdom.ERubyPrononcuation.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ERubyPrononcuation
});
hxdom.ERuby = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"RUBY"));
};
$hxClasses["hxdom.ERuby"] = hxdom.ERuby;
hxdom.ERuby.__name__ = ["hxdom","ERuby"];
hxdom.ERuby.__super__ = hxdom.VirtualElement;
hxdom.ERuby.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ERuby
});
hxdom.EStrike = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"S"));
};
$hxClasses["hxdom.EStrike"] = hxdom.EStrike;
hxdom.EStrike.__name__ = ["hxdom","EStrike"];
hxdom.EStrike.__super__ = hxdom.VirtualElement;
hxdom.EStrike.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EStrike
});
hxdom.ESample = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"SAMP"));
};
$hxClasses["hxdom.ESample"] = hxdom.ESample;
hxdom.ESample.__name__ = ["hxdom","ESample"];
hxdom.ESample.__super__ = hxdom.VirtualElement;
hxdom.ESample.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ESample
});
hxdom.EScript = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLScriptElement,"SCRIPT"));
};
$hxClasses["hxdom.EScript"] = hxdom.EScript;
hxdom.EScript.__name__ = ["hxdom","EScript"];
hxdom.EScript.__super__ = hxdom.VirtualElement;
hxdom.EScript.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EScript
});
hxdom.ESection = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"SECTION"));
};
$hxClasses["hxdom.ESection"] = hxdom.ESection;
hxdom.ESection.__name__ = ["hxdom","ESection"];
hxdom.ESection.__super__ = hxdom.VirtualElement;
hxdom.ESection.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ESection
});
hxdom.ESelect = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLSelectElement,"SELECT"));
};
$hxClasses["hxdom.ESelect"] = hxdom.ESelect;
hxdom.ESelect.__name__ = ["hxdom","ESelect"];
hxdom.ESelect.__super__ = hxdom.VirtualElement;
hxdom.ESelect.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ESelect
});
hxdom.ESmall = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"SMALL"));
};
$hxClasses["hxdom.ESmall"] = hxdom.ESmall;
hxdom.ESmall.__name__ = ["hxdom","ESmall"];
hxdom.ESmall.__super__ = hxdom.VirtualElement;
hxdom.ESmall.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ESmall
});
hxdom.ESource = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLSourceElement,"SOURCE"));
};
$hxClasses["hxdom.ESource"] = hxdom.ESource;
hxdom.ESource.__name__ = ["hxdom","ESource"];
hxdom.ESource.__super__ = hxdom.VirtualElement;
hxdom.ESource.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ESource
});
hxdom.ESpan = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLSpanElement,"SPAN"));
};
$hxClasses["hxdom.ESpan"] = hxdom.ESpan;
hxdom.ESpan.__name__ = ["hxdom","ESpan"];
hxdom.ESpan.__super__ = hxdom.VirtualElement;
hxdom.ESpan.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ESpan
});
hxdom.EStrong = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"STRONG"));
};
$hxClasses["hxdom.EStrong"] = hxdom.EStrong;
hxdom.EStrong.__name__ = ["hxdom","EStrong"];
hxdom.EStrong.__super__ = hxdom.VirtualElement;
hxdom.EStrong.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EStrong
});
hxdom.EStyle = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLStyleElement,"STYLE"));
};
$hxClasses["hxdom.EStyle"] = hxdom.EStyle;
hxdom.EStyle.__name__ = ["hxdom","EStyle"];
hxdom.EStyle.__super__ = hxdom.VirtualElement;
hxdom.EStyle.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EStyle
});
hxdom.ESub = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"SUB"));
};
$hxClasses["hxdom.ESub"] = hxdom.ESub;
hxdom.ESub.__name__ = ["hxdom","ESub"];
hxdom.ESub.__super__ = hxdom.VirtualElement;
hxdom.ESub.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ESub
});
hxdom.ESummary = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"SUMMARY"));
};
$hxClasses["hxdom.ESummary"] = hxdom.ESummary;
hxdom.ESummary.__name__ = ["hxdom","ESummary"];
hxdom.ESummary.__super__ = hxdom.VirtualElement;
hxdom.ESummary.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ESummary
});
hxdom.ESup = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"SUP"));
};
$hxClasses["hxdom.ESup"] = hxdom.ESup;
hxdom.ESup.__name__ = ["hxdom","ESup"];
hxdom.ESup.__super__ = hxdom.VirtualElement;
hxdom.ESup.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ESup
});
hxdom.ETable = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLTableElement,"TABLE"));
};
$hxClasses["hxdom.ETable"] = hxdom.ETable;
hxdom.ETable.__name__ = ["hxdom","ETable"];
hxdom.ETable.__super__ = hxdom.VirtualElement;
hxdom.ETable.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ETable
});
hxdom.ETableBody = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLTableSectionElement,"TBODY"));
};
$hxClasses["hxdom.ETableBody"] = hxdom.ETableBody;
hxdom.ETableBody.__name__ = ["hxdom","ETableBody"];
hxdom.ETableBody.__super__ = hxdom.VirtualElement;
hxdom.ETableBody.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ETableBody
});
hxdom.ETableCell = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLTableCellElement,"TD"));
};
$hxClasses["hxdom.ETableCell"] = hxdom.ETableCell;
hxdom.ETableCell.__name__ = ["hxdom","ETableCell"];
hxdom.ETableCell.__super__ = hxdom.VirtualElement;
hxdom.ETableCell.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ETableCell
});
hxdom.ETextArea = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLTextAreaElement,"TEXTAREA"));
};
$hxClasses["hxdom.ETextArea"] = hxdom.ETextArea;
hxdom.ETextArea.__name__ = ["hxdom","ETextArea"];
hxdom.ETextArea.__super__ = hxdom.VirtualElement;
hxdom.ETextArea.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ETextArea
});
hxdom.ETableFooter = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLTableSectionElement,"TFOOT"));
};
$hxClasses["hxdom.ETableFooter"] = hxdom.ETableFooter;
hxdom.ETableFooter.__name__ = ["hxdom","ETableFooter"];
hxdom.ETableFooter.__super__ = hxdom.VirtualElement;
hxdom.ETableFooter.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ETableFooter
});
hxdom.ETableHeaderCell = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLTableCellElement,"TH"));
};
$hxClasses["hxdom.ETableHeaderCell"] = hxdom.ETableHeaderCell;
hxdom.ETableHeaderCell.__name__ = ["hxdom","ETableHeaderCell"];
hxdom.ETableHeaderCell.__super__ = hxdom.VirtualElement;
hxdom.ETableHeaderCell.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ETableHeaderCell
});
hxdom.ETableHeader = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLTableSectionElement,"THEAD"));
};
$hxClasses["hxdom.ETableHeader"] = hxdom.ETableHeader;
hxdom.ETableHeader.__name__ = ["hxdom","ETableHeader"];
hxdom.ETableHeader.__super__ = hxdom.VirtualElement;
hxdom.ETableHeader.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ETableHeader
});
hxdom.ETime = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"TIME"));
};
$hxClasses["hxdom.ETime"] = hxdom.ETime;
hxdom.ETime.__name__ = ["hxdom","ETime"];
hxdom.ETime.__super__ = hxdom.VirtualElement;
hxdom.ETime.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ETime
});
hxdom.ETitle = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLTitleElement,"TITLE"));
};
$hxClasses["hxdom.ETitle"] = hxdom.ETitle;
hxdom.ETitle.__name__ = ["hxdom","ETitle"];
hxdom.ETitle.__super__ = hxdom.VirtualElement;
hxdom.ETitle.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ETitle
});
hxdom.ETableRow = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLTableRowElement,"TR"));
};
$hxClasses["hxdom.ETableRow"] = hxdom.ETableRow;
hxdom.ETableRow.__name__ = ["hxdom","ETableRow"];
hxdom.ETableRow.__super__ = hxdom.VirtualElement;
hxdom.ETableRow.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ETableRow
});
hxdom.ETrack = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLTrackElement,"TRACK"));
};
$hxClasses["hxdom.ETrack"] = hxdom.ETrack;
hxdom.ETrack.__name__ = ["hxdom","ETrack"];
hxdom.ETrack.__super__ = hxdom.VirtualElement;
hxdom.ETrack.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.ETrack
});
hxdom.EUnderline = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"U"));
};
$hxClasses["hxdom.EUnderline"] = hxdom.EUnderline;
hxdom.EUnderline.__name__ = ["hxdom","EUnderline"];
hxdom.EUnderline.__super__ = hxdom.VirtualElement;
hxdom.EUnderline.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EUnderline
});
hxdom.EUnorderedList = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLUListElement,"UL"));
};
$hxClasses["hxdom.EUnorderedList"] = hxdom.EUnorderedList;
hxdom.EUnorderedList.__name__ = ["hxdom","EUnorderedList"];
hxdom.EUnorderedList.__super__ = hxdom.VirtualElement;
hxdom.EUnorderedList.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EUnorderedList
});
hxdom.EVar = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"VAR"));
};
$hxClasses["hxdom.EVar"] = hxdom.EVar;
hxdom.EVar.__name__ = ["hxdom","EVar"];
hxdom.EVar.__super__ = hxdom.VirtualElement;
hxdom.EVar.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EVar
});
hxdom.EVideo = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(HTMLVideoElement,"VIDEO"));
};
$hxClasses["hxdom.EVideo"] = hxdom.EVideo;
hxdom.EVideo.__name__ = ["hxdom","EVideo"];
hxdom.EVideo.__super__ = hxdom.VirtualElement;
hxdom.EVideo.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EVideo
});
hxdom.EWordBreak = function() {
	hxdom.VirtualElement.call(this,hxdom.VirtualNode.buildElement(Element,"WBR"));
};
$hxClasses["hxdom.EWordBreak"] = hxdom.EWordBreak;
hxdom.EWordBreak.__name__ = ["hxdom","EWordBreak"];
hxdom.EWordBreak.__super__ = hxdom.VirtualElement;
hxdom.EWordBreak.prototype = $extend(hxdom.VirtualElement.prototype,{
	__class__: hxdom.EWordBreak
});
hxdom.Text = function(txt) {
	hxdom.VirtualNode.call(this,hxdom.VirtualNode.buildText(txt));
};
$hxClasses["hxdom.Text"] = hxdom.Text;
hxdom.Text.__name__ = ["hxdom","Text"];
hxdom.Text.__super__ = hxdom.VirtualNode;
hxdom.Text.prototype = $extend(hxdom.VirtualNode.prototype,{
	__class__: hxdom.Text
});
hxdom.HtmlSnippet = function(html) {
	hxdom.ESpan.call(this);
	this.node.innerHTML = html;
};
$hxClasses["hxdom.HtmlSnippet"] = hxdom.HtmlSnippet;
hxdom.HtmlSnippet.__name__ = ["hxdom","HtmlSnippet"];
hxdom.HtmlSnippet.__super__ = hxdom.ESpan;
hxdom.HtmlSnippet.prototype = $extend(hxdom.ESpan.prototype,{
	__class__: hxdom.HtmlSnippet
});
hxdom.EventDispatcher = function() { }
$hxClasses["hxdom.EventDispatcher"] = hxdom.EventDispatcher;
hxdom.EventDispatcher.__name__ = ["hxdom","EventDispatcher"];
hxdom.EventDispatcher.__interfaces__ = [hxdom.IEventDispatcher];
hxdom.EventDispatcher.prototype = {
	dispatchEvent: function(event) {
		if(this.__listeners == null) this.__listeners = new haxe.ds.StringMap();
		event.target = this;
		this.__capturePhase(event);
		this.__bubblePhase(event);
		return !event.defaultPrevented;
	}
	,__bubblePhase: function(event) {
		event.currentTarget = node;
		if(!event.cancelable || !event.cancelBubble) this.__callListeners(event,false);
		if(js.Boot.__instanceof(this,Node)) {
			var node = this;
			if(node.parentNode != null && event.bubbles) node.parentNode.__bubblePhase(event);
		}
	}
	,__capturePhase: function(event) {
		event.currentTarget = node;
		if(js.Boot.__instanceof(this,Node)) {
			var node = this;
			if(node.parentNode != null && event.bubbles) node.parentNode.__capturePhase(event);
		}
		if(!event.cancelable || !event.cancelBubble) this.__callListeners(event,true);
	}
	,__callListeners: function(event,capture) {
		if(event.target == this) event.eventPhase = 2; else event.eventPhase = capture?1:3;
		var list = this.__listeners.get(event.type);
		if(list != null) {
			var $it0 = list.iterator();
			while( $it0.hasNext() ) {
				var i = $it0.next();
				if(i.cap == capture) {
					Reflect.field(i.handler.inst,i.handler.func).apply(i.handler.inst,[event]);
					if(Reflect.field(event,"cancelImmediate") == true) break;
				}
			}
		}
	}
	,__removeEventListener: function(type,handler,useCapture) {
		if(useCapture == null) useCapture = false;
		if(this.__listeners == null || !this.__listeners.exists(type)) return;
		var list = this.__listeners.get(type);
		var $it0 = list.iterator();
		while( $it0.hasNext() ) {
			var i = $it0.next();
			if(i.handler.inst == handler.inst && i.handler.func == handler.func && i.cap == useCapture) list.remove(i);
		}
	}
	,__addEventListener: function(type,handler,useCapture) {
		if(useCapture == null) useCapture = false;
		if(this.__listeners == null) this.__listeners = new haxe.ds.StringMap();
		var list = this.__listeners.get(type);
		var obj = { handler : handler, cap : useCapture};
		if(list == null) {
			list = new List();
			list.add(obj);
			this.__listeners.set(type,list);
		} else {
			var $it0 = list.iterator();
			while( $it0.hasNext() ) {
				var i = $it0.next();
				if(i.handler.inst == handler.inst && i.handler.func == handler.func && i.cap == useCapture) return;
			}
			list.add(obj);
		}
	}
	,__class__: hxdom.EventDispatcher
}
hxdom.EventDispatcherMacro = function() { }
$hxClasses["hxdom.EventDispatcherMacro"] = hxdom.EventDispatcherMacro;
hxdom.EventDispatcherMacro.__name__ = ["hxdom","EventDispatcherMacro"];
hxdom.EventHandler = function(inst,func,origFunc) {
	this.inst = inst;
	this.func = func;
};
$hxClasses["hxdom.EventHandler"] = hxdom.EventHandler;
hxdom.EventHandler.__name__ = ["hxdom","EventHandler"];
hxdom.EventHandler.prototype = {
	call: function(args) {
		if(args == null) args = new Array();
		return Reflect.field(this.inst,this.func).apply(this.inst,args);
	}
	,__class__: hxdom.EventHandler
}
hxdom.HtmlSerializer = function() {
	haxe.Serializer.call(this);
	this.indent = 0;
	this.useCache = true;
	this.useEnumIndex = hxdom.HtmlSerializer.USE_ENUM_INDEX;
	this.attr = false;
};
$hxClasses["hxdom.HtmlSerializer"] = hxdom.HtmlSerializer;
hxdom.HtmlSerializer.__name__ = ["hxdom","HtmlSerializer"];
hxdom.HtmlSerializer.run = function(html) {
	var s = new hxdom.HtmlSerializer();
	s.buf.b += Std.string("<!DOCTYPE html>" + (hxdom.HtmlSerializer.prettyPrint?hxdom.HtmlSerializer.eol:""));
	s.serialize(html);
	return s.toString();
}
hxdom.HtmlSerializer.__super__ = haxe.Serializer;
hxdom.HtmlSerializer.prototype = $extend(haxe.Serializer.prototype,{
	serialize: function(v) {
		if(js.Boot.__instanceof(v,hxdom.VirtualNode)) {
			var vn = v;
			if(this.attr) this.buf.b += Std.string("D" + Std.string(v.id)); else switch(vn.node.nodeType) {
			case 1:
				this.element(vn);
				break;
			case 3:
				this.text(vn);
				break;
			}
		} else if(Type["typeof"](v) == ValueType.TObject) {
			var name = null;
			try {
				name = Type.getClassName(v);
			} catch( e ) {
			}
			if(name != null) {
				this.buf.b += "O";
				this.serializeString(name);
			} else haxe.Serializer.prototype.serialize.call(this,v);
		} else haxe.Serializer.prototype.serialize.call(this,v);
	}
	,children: function(e) {
		var _g = 0, _g1 = e.node.childNodes;
		while(_g < _g1.length) {
			var i = _g1[_g];
			++_g;
			this.serialize(Reflect.field(i,"__vdom"));
		}
	}
	,attrs: function(e) {
		this.attr = true;
		this.elemIds(e);
		var _g = 0, _g1 = Reflect.fields(e.node.dataset);
		while(_g < _g1.length) {
			var i = _g1[_g];
			++_g;
			this.buf.b += Std.string(" data-" + hxdom.DomTools.camelCaseToDash(i) + "='" + StringTools.htmlEscape(Std.string(Reflect.field(e.node.dataset,i)),true) + "'");
		}
		var style = null;
		var _g = 0, _g1 = Reflect.fields(e.node.style);
		while(_g < _g1.length) {
			var i = _g1[_g];
			++_g;
			if(style == null) style = " style='";
			style += StringTools.htmlEscape(hxdom.DomTools.camelCaseToDash(i) + ":" + Std.string(Reflect.field(e.node.style,i)),true) + ";";
		}
		if(style != null) this.buf.b += Std.string(style + "'");
		var _g = 0, _g1 = Reflect.fields(e.node);
		while(_g < _g1.length) {
			var i = _g1[_g];
			++_g;
			if(Reflect.hasField(hxdom.HtmlSerializer.fieldsToIgnore,i)) continue;
			var attrName = i;
			if(attrName == "className") attrName = "class";
			var val = Reflect.field(e.node,i);
			var _g2 = Type["typeof"](val);
			switch( (_g2)[1] ) {
			case 3:
				if(val) this.buf.b += Std.string(" " + hxdom.DomTools.camelCaseToDash(attrName));
				break;
			default:
				this.buf.b += Std.string(" " + hxdom.DomTools.camelCaseToDash(attrName) + "='" + Std.string(val) + "'");
			}
		}
		var events = Reflect.field(e.node,"__listeners");
		if(events != null) {
			this.buf.b += " data-hxevents='";
			this.serialize(events);
			this.buf.b += "'";
		}
		this.buf.b += Std.string(" data-hxclass='" + Type.getClassName(Type.getClass(e)) + "'");
		var _g = 0, _g1 = Reflect.fields(e);
		while(_g < _g1.length) {
			var i = _g1[_g];
			++_g;
			if(i != "node" && i != "id") {
				this.buf.b += Std.string(" data-hxd" + hxdom.DomTools.camelCaseToDash(i) + "='");
				this.serialize(Reflect.field(e,i));
				this.buf.b += "'";
			}
		}
		this.attr = false;
	}
	,elemIds: function(e) {
		this.buf.b += Std.string(" data-hxid='" + Std.string(Reflect.field(e,"id")));
		if(!Reflect.hasField(e.node,"__htmlSnippet")) {
			var _g = 0, _g1 = e.node.childNodes;
			while(_g < _g1.length) {
				var i = _g1[_g];
				++_g;
				if(i.nodeType == 3) {
					var text = Reflect.field(i,"__vdom");
					if(hxdom.HtmlSerializer.prettyPrint) this.buf.b += Std.string(" " + Std.string(Reflect.field(text,"id")) + "-" + (StringTools.lpad("",hxdom.HtmlSerializer.iStr,this.indent) + hxdom.HtmlSerializer.iStr + (i.data + hxdom.HtmlSerializer.eol)).length); else this.buf.b += Std.string(" " + Std.string(Reflect.field(text,"id")) + "-" + i.data.length);
				}
			}
		}
		this.buf.b += "'";
	}
	,closeTag: function(e) {
		if(hxdom.HtmlSerializer.prettyPrint) this.buf.b += Std.string((e.node.hasChildNodes()?StringTools.lpad("",hxdom.HtmlSerializer.iStr,this.indent):"") + "</" + e.node.tagName.toLowerCase() + ">" + hxdom.HtmlSerializer.eol); else this.buf.b += Std.string("</" + e.node.tagName.toLowerCase() + ">");
	}
	,openTag: function(e) {
		if(hxdom.HtmlSerializer.prettyPrint) this.buf.b += Std.string(StringTools.lpad("",hxdom.HtmlSerializer.iStr,this.indent) + "<" + e.node.tagName.toLowerCase()); else this.buf.b += Std.string("<" + e.node.tagName.toLowerCase());
		this.attrs(e);
		this.buf.b += Std.string(hxdom.HtmlSerializer.prettyPrint && e.node.hasChildNodes()?">" + hxdom.HtmlSerializer.eol:">");
	}
	,element: function(e) {
		this.openTag(e);
		this.indent++;
		this.children(e);
		this.indent--;
		this.closeTag(e);
	}
	,text: function(t) {
		if(hxdom.HtmlSerializer.prettyPrint) this.buf.b += Std.string(StringTools.lpad("",hxdom.HtmlSerializer.iStr,this.indent) + hxdom.HtmlSerializer.iStr + t.node.data + hxdom.HtmlSerializer.eol); else this.buf.b += Std.string(t.node.data);
	}
	,__class__: hxdom.HtmlSerializer
});
hxdom.js.Boot = function() {
	haxe.Unserializer.call(this,"");
	this.elementLookup = new haxe.ds.IntMap();
	this.initFuncs = new List();
};
$hxClasses["hxdom.js.Boot"] = hxdom.js.Boot;
hxdom.js.Boot.__name__ = ["hxdom","js","Boot"];
hxdom.js.Boot.init = function() {
	var html = js.Browser.document.childNodes[1];
	var boot = new hxdom.js.Boot();
	boot.buildElementLookup(html);
	boot.unserializeNode(html);
	var $it0 = boot.initFuncs.iterator();
	while( $it0.hasNext() ) {
		var i = $it0.next();
		i.call();
	}
	return Reflect.field(html,"__vdom");
}
hxdom.js.Boot.__super__ = haxe.Unserializer;
hxdom.js.Boot.prototype = $extend(haxe.Unserializer.prototype,{
	unserialize: function() {
		var _g = this.buf.charCodeAt(this.pos);
		switch(_g) {
		case 68:
			this.pos++;
			var e = this.elementLookup.get(this.readDigits());
			if(e == null) throw "Missing element reference!";
			return Reflect.field(e,"__vdom");
		case 79:
			this.pos++;
			var name = haxe.Unserializer.prototype.unserialize.call(this);
			return Type.resolveClass(name);
		case 99:
			var inst = haxe.Unserializer.prototype.unserialize.call(this);
			if(js.Boot.__instanceof(inst,hxdom.js.ClientOnly)) this.initFuncs.add(new hxdom.EventHandler(inst,"__hxdomBoot",null));
			return inst;
		default:
			return haxe.Unserializer.prototype.unserialize.call(this);
		}
	}
	,doUnserialize: function(str) {
		this.buf = str;
		this.pos = 0;
		this.length = str.length;
		return this.unserialize();
	}
	,checkClientInit: function(inst) {
		if(js.Boot.__instanceof(inst,hxdom.js.ClientOnly)) this.initFuncs.add(new hxdom.EventHandler(inst,"__hxdomBoot",null));
	}
	,buildElementLookup: function(node) {
		if(node.nodeType == 1) {
			var cls = Type.resolveClass(Reflect.field((js.Boot.__cast(node , Element)).dataset,"hxclass"));
			if(cls != null) {
				var velem = Type.createEmptyInstance(cls);
				node.__vdom = velem;
				velem.node = node;
				var first = true;
				var remainingStr = null;
				var child = node.firstChild;
				var _g = 0, _g1 = node.attributes.getNamedItem("data-hxid").nodeValue.split(" ");
				while(_g < _g1.length) {
					var i = _g1[_g];
					++_g;
					if(first) {
						var id = Std.parseInt(i);
						velem.id = id;
						this.elementLookup.set(id,node);
						first = false;
					} else {
						var dash = i.indexOf("-");
						var id = Std.parseInt(HxOverrides.substr(i,0,dash));
						var len = Std.parseInt(HxOverrides.substr(i,dash + 1,null));
						var nodeToAdd = null;
						if(len > 0) {
							while(child.nodeType != 3) child = child.nextSibling;
							var txt = child;
							nodeToAdd = child;
							if(remainingStr == null && txt.length == len) child = child.nextSibling; else if(remainingStr == null) {
								remainingStr = HxOverrides.substr(txt.data,len,null);
								txt.data = HxOverrides.substr(txt.data,0,len);
							} else {
								nodeToAdd = js.Browser.document.createTextNode(HxOverrides.substr(remainingStr,0,len));
								node.insertBefore(nodeToAdd,child.nextSibling);
								if(remainingStr.length == len) remainingStr = null; else remainingStr = HxOverrides.substr(remainingStr,len,null);
								child = child.nextSibling;
							}
						} else {
							nodeToAdd = js.Browser.document.createTextNode("");
							node.insertBefore(nodeToAdd,child);
						}
						var vdomText = Type.createEmptyInstance(hxdom.Text);
						vdomText.id = id;
						vdomText.node = nodeToAdd;
						nodeToAdd.__vdom = vdomText;
						this.elementLookup.set(id,nodeToAdd);
					}
				}
				var _g = 0, _g1 = node.childNodes;
				while(_g < _g1.length) {
					var i = _g1[_g];
					++_g;
					this.buildElementLookup(i);
				}
			}
		}
	}
	,unserializeNode: function(node) {
		switch(node.nodeType) {
		case 1:
			this.element(node);
			var _g = 0, _g1 = node.childNodes;
			while(_g < _g1.length) {
				var i = _g1[_g];
				++_g;
				this.unserializeNode(i);
			}
			break;
		}
	}
	,element: function(e) {
		var velem = Reflect.field(e,"__vdom");
		var _g = 0, _g1 = Reflect.fields(e.dataset);
		while(_g < _g1.length) {
			var i = _g1[_g];
			++_g;
			switch(i) {
			case "hxevents":
				var listeners = this.doUnserialize(Reflect.field(e.dataset,i));
				var $it0 = listeners.keys();
				while( $it0.hasNext() ) {
					var eventType = $it0.next();
					var $it1 = listeners.get(eventType).iterator();
					while( $it1.hasNext() ) {
						var eh = $it1.next();
						var eh1 = [eh];
						e.addEventListener(eventType,(function(eh1) {
							return function(e1) {
								eh1[0].handler.call([e1]);
							};
						})(eh1),eh1[0].cap);
					}
				}
				break;
			case "hxclass":case "hxid":
				break;
			default:
				if(StringTools.startsWith(i,"hxd")) {
					var key = HxOverrides.substr(i,3,null);
					velem[key] = this.doUnserialize(Reflect.field(e.dataset,i));
				}
			}
		}
		if(js.Boot.__instanceof(velem,hxdom.js.ClientOnly)) this.initFuncs.add(new hxdom.EventHandler(velem,"__hxdomBoot",null));
	}
	,__class__: hxdom.js.Boot
});
hxdom.js.ClientOnlyMacros = function() { }
$hxClasses["hxdom.js.ClientOnlyMacros"] = hxdom.js.ClientOnlyMacros;
hxdom.js.ClientOnlyMacros.__name__ = ["hxdom","js","ClientOnlyMacros"];
var js = {}
js.Boot = function() { }
$hxClasses["js.Boot"] = js.Boot;
js.Boot.__name__ = ["js","Boot"];
js.Boot.__string_rec = function(o,s) {
	if(o == null) return "null";
	if(s.length >= 5) return "<...>";
	var t = typeof(o);
	if(t == "function" && (o.__name__ || o.__ename__)) t = "object";
	switch(t) {
	case "object":
		if(o instanceof Array) {
			if(o.__enum__) {
				if(o.length == 2) return o[0];
				var str = o[0] + "(";
				s += "\t";
				var _g1 = 2, _g = o.length;
				while(_g1 < _g) {
					var i = _g1++;
					if(i != 2) str += "," + js.Boot.__string_rec(o[i],s); else str += js.Boot.__string_rec(o[i],s);
				}
				return str + ")";
			}
			var l = o.length;
			var i;
			var str = "[";
			s += "\t";
			var _g = 0;
			while(_g < l) {
				var i1 = _g++;
				str += (i1 > 0?",":"") + js.Boot.__string_rec(o[i1],s);
			}
			str += "]";
			return str;
		}
		var tostr;
		try {
			tostr = o.toString;
		} catch( e ) {
			return "???";
		}
		if(tostr != null && tostr != Object.toString) {
			var s2 = o.toString();
			if(s2 != "[object Object]") return s2;
		}
		var k = null;
		var str = "{\n";
		s += "\t";
		var hasp = o.hasOwnProperty != null;
		for( var k in o ) { ;
		if(hasp && !o.hasOwnProperty(k)) {
			continue;
		}
		if(k == "prototype" || k == "__class__" || k == "__super__" || k == "__interfaces__" || k == "__properties__") {
			continue;
		}
		if(str.length != 2) str += ", \n";
		str += s + k + " : " + js.Boot.__string_rec(o[k],s);
		}
		s = s.substring(1);
		str += "\n" + s + "}";
		return str;
	case "function":
		return "<function>";
	case "string":
		return o;
	default:
		return String(o);
	}
}
js.Boot.__interfLoop = function(cc,cl) {
	if(cc == null) return false;
	if(cc == cl) return true;
	var intf = cc.__interfaces__;
	if(intf != null) {
		var _g1 = 0, _g = intf.length;
		while(_g1 < _g) {
			var i = _g1++;
			var i1 = intf[i];
			if(i1 == cl || js.Boot.__interfLoop(i1,cl)) return true;
		}
	}
	return js.Boot.__interfLoop(cc.__super__,cl);
}
js.Boot.__instanceof = function(o,cl) {
	if(cl == null) return false;
	switch(cl) {
	case Int:
		return (o|0) === o;
	case Float:
		return typeof(o) == "number";
	case Bool:
		return typeof(o) == "boolean";
	case String:
		return typeof(o) == "string";
	case Dynamic:
		return true;
	default:
		if(o != null) {
			if(typeof(cl) == "function") {
				if(o instanceof cl) {
					if(cl == Array) return o.__enum__ == null;
					return true;
				}
				if(js.Boot.__interfLoop(o.__class__,cl)) return true;
			}
		} else return false;
		if(cl == Class && o.__name__ != null) return true;
		if(cl == Enum && o.__ename__ != null) return true;
		return o.__enum__ == cl;
	}
}
js.Boot.__cast = function(o,t) {
	if(js.Boot.__instanceof(o,t)) return o; else throw "Cannot cast " + Std.string(o) + " to " + Std.string(t);
}
js.Browser = function() { }
$hxClasses["js.Browser"] = js.Browser;
js.Browser.__name__ = ["js","Browser"];
function $iterator(o) { if( o instanceof Array ) return function() { return HxOverrides.iter(o); }; return typeof(o.iterator) == 'function' ? $bind(o,o.iterator) : o.iterator; };
var $_, $fid = 0;
function $bind(o,m) { if( m == null ) return null; if( m.__id__ == null ) m.__id__ = $fid++; var f; if( o.hx__closures__ == null ) o.hx__closures__ = {}; else f = o.hx__closures__[m.__id__]; if( f == null ) { f = function(){ return f.method.apply(f.scope, arguments); }; f.scope = o; f.method = m; o.hx__closures__[m.__id__] = f; } return f; };
Math.__name__ = ["Math"];
Math.NaN = Number.NaN;
Math.NEGATIVE_INFINITY = Number.NEGATIVE_INFINITY;
Math.POSITIVE_INFINITY = Number.POSITIVE_INFINITY;
$hxClasses.Math = Math;
Math.isFinite = function(i) {
	return isFinite(i);
};
Math.isNaN = function(i) {
	return isNaN(i);
};
String.prototype.__class__ = $hxClasses.String = String;
String.__name__ = ["String"];
Array.prototype.__class__ = $hxClasses.Array = Array;
Array.__name__ = ["Array"];
Date.prototype.__class__ = $hxClasses.Date = Date;
Date.__name__ = ["Date"];
var Int = $hxClasses.Int = { __name__ : ["Int"]};
var Dynamic = $hxClasses.Dynamic = { __name__ : ["Dynamic"]};
var Float = $hxClasses.Float = Number;
Float.__name__ = ["Float"];
var Bool = $hxClasses.Bool = Boolean;
Bool.__ename__ = ["Bool"];
var Class = $hxClasses.Class = { __name__ : ["Class"]};
var Enum = { };
hxdom.VirtualNode.ID = 0;
haxe.Serializer.USE_CACHE = false;
haxe.Serializer.USE_ENUM_INDEX = false;
haxe.Serializer.BASE64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789%:";
haxe.Unserializer.DEFAULT_RESOLVER = Type;
haxe.Unserializer.BASE64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789%:";
haxe.ds.ObjectMap.count = 0;
hxdom.HtmlSerializer.USE_ENUM_INDEX = false;
hxdom.HtmlSerializer.fieldsToIgnore = { nodeType : null, tagName : null, childNodes : null, parentNode : null, nextSibling : null, previousSibling : null, firstChild : null, lastChild : null, dataset : null, style : null, offsetWidth : null, offsetHeight : null, __listeners : null, __vdom : null, __htmlSnippet : null};
hxdom.HtmlSerializer.prettyPrint = false;
hxdom.HtmlSerializer.iStr = "\t";
hxdom.HtmlSerializer.eol = "\r\n";
js.Browser.window = typeof window != "undefined" ? window : null;
js.Browser.document = typeof window != "undefined" ? window.document : null;
Main.main();
})();
