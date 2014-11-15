package ;

import hxdom.EventDispatcher;
import hxdom.html.Event;
import hxdom.HtmlSerializer;
import hxdom.js.Boot;
import hxdom.Elements;
import hxdom.js.ClientOnly;

using hxdom.DomTools;

class Test {
	
	static function main () {
		#if js
		js.Browser.window.onload = function (_) {
			var app:ForumApp = cast Boot.init();
			
			//Add a post on load from JS
			app.threads.addPost(new Post(app.threads.posts[0].post.user, "Right back at yea John! This time from JS!"));
			
			//Check to see text references are maintained
			app.threads.markTextEnds();
		}
		#else
		sys.io.File.saveContent("index.html", HtmlSerializer.run(new ForumApp()));
		#end
	}
	
	public static function staticEventListener (e:Event):Void {
		trace("Static listener");
	}
	
}

class ForumApp extends EHtml {
	
	public var head(default, null):EHead;
	public var threads(default, null):ForumThreadView;
	
	var empty:Text;
	
	public function new () {
		super();
		
		var user1 = new User(0, "Fred");
		var user2 = new John(1);
		
		head = new EHead();
		head.append(new EScript().setAttr("src", "haxedom.js").setAttr("defer", true));
		
		threads = new ForumThreadView([new Post(user1, "Hi John!"), new Post(user2, "Well hello there Fred.")]);
		untyped threads.node.dataset.testingCustomDataAttr = "data'.data.data'.data";
		threads.node.style.backgroundColor = "red";
		addEventListener("click", Test.staticEventListener);
		empty = new Text("");
		
		append(head);
		append(threads);
		append(empty);
	}
	
}

class ForumThreadView extends EBody implements ClientOnly {
	
	public var posts(default, set):Array<PostView>;
	
	var t1:Text;
	var t2:Text;
	var _empty:Text;
	var t3:Text;
	var rawHtml:EDiv;
	
	public function new (posts:Array<Post>) {
		super();
		
		this.posts = posts.map(function (e) { return new PostView(e); } );
		
		t1 = new Text("Testing ");
		t2 = new Text("<span>escaped</span>inline              text ");
		_empty = new Text("");
		t3 = new Text("references");
		rawHtml = new EDiv();
		rawHtml.setHtml("MMMMMMMMMMMMMMMM <span color='blue'>This is raw html</span>");
		
		append(t1).append(t2).append(_empty).append(t3).append(rawHtml);
	}
	
	@:client
	function init ():Void {
		trace("FTV init");
	}
	
	public function markTextEnds ():Void {
		t1.node.data += "|";
		t2.node.data += "|";
		_empty.node.data += "|";
		t3.node.data += "|";
	}
	
	function set_posts (posts:Array<PostView>):Array<PostView> {
		this.posts = posts;
		
		this.empty();
		for (i in posts) {
			this.append(i);
		}
		
		return posts;
	}
	
	public function addPost (post:Post):Void {
		this.append(new PostView(post));
	}
	
}

class PostView extends EArticle {
	
	public var post(default, set):Post;
	
	var eprofile:ProfileView;
	var emsg:EDiv;
	var btn:EButton;

	public function new (post:Post) {
		super();
		
		this.addClass("post");
		
		this.post = post;
	}
	
	function set_post (post:Post):Post {
		//Clear last post
		if (this.post != null) {
			this.empty();
			btn.node.removeEventListener("click", onClick);
		}
		
		this.post = post;
		
		//Add new post
		if (post != null) {
			eprofile = new ProfileView(post.user);
			emsg = new EDiv();
			
			this.append(eprofile);
			this.append(emsg.addClass("post-message").addText(post.message));
			btn = new EButton().addText("Click Me!");
			btn.addEventListener("click", onClick);
			this.append(btn);
		}
		
		return post;
	}
	
	function onClick (_):Void {
		post.message += " EVENT!";
		this.post = post;		//Update the view
	}
	
}

class ProfileView extends EAside {
	
	public var user(default, set):User;

	public function new (user:User) {
		super();
		
		this.addClass("profile");
		
		this.user = user;
	}
	
	function set_user (user:User):User {
		this.user = user;
		
		this.empty();
		if (user != null) {
			this.append(new EDiv().addClass("profile-name").addText(user.name));
		}
		
		return user;
	}
	
}

class User implements IEventDispatcher implements ClientOnly {
	
	public var id:Int;
	public var name:String;

	public function new (id:Int, name:String) {
		this.id = id;
		this.name = name;
	}
	
	@:client
	function init ():Void {
		//JS specific code
		js.Browser.window.alert("Client load init! id = " + id + ", name = " + name);
	}
	
}

class John extends User {
	
	public function new (id:Int) {
		super(id, "John");
	}
	
}

class Post implements IEventDispatcher {
	
	public var user:User;
	public var message:String;

	public function new (user:User, message:String) {
		this.user = user;
		this.message = message;
	}
	
}