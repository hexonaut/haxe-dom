package ;

import hxdom.EventDispatcher;
import hxdom.html.Event;
import hxdom.HtmlSerializer;
import hxdom.js.Boot;
import hxdom.Elements;

using hxdom.DomTools;

class Main {
	
	static function main () {
		#if js
		var app:ForumApp = cast Boot.init();
		
		//Add a post on load from JS
		app.threads.addPost(new Post(app.threads.posts[0].post.user, "Right back at yea John! This time from JS!"));
		
		//Check to see text references are maintained
		app.threads.markTextEnds();
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
		var user2 = new User(1, "John");
		
		head = new EHead();
		head.add(new EScript().addText("HTMLDetailsElement = HTMLElement;"));
		head.add(new EScript().attr(Src, "haxedom.js").attr(Defer, true));
		
		threads = new ForumThreadView([new Post(user1, "Hi John!"), new Post(user2, "Well hello there Fred.")]);
		untyped threads.node.dataset.testingCustomDataAttr = "data'.data.data'.data";
		threads.node.style.backgroundColor = "red";
		threads.addEventListener("click", Main.staticEventListener);
		empty = new Text("");
		
		add(head);
		add(threads);
		add(empty);
	}
	
}

class ForumThreadView extends EBody {
	
	public var posts(default, set):Array<PostView>;
	
	var t1:Text;
	var t2:Text;
	var empty:Text;
	var t3:Text;
	
	public function new (posts:Array<Post>) {
		super();
		
		this.posts = posts.map(function (e) { return new PostView(e); } );
		
		t1 = new Text("Testing ");
		t2 = new Text("inline              text ");
		empty = new Text("");
		t3 = new Text("references");
		
		add(t1).add(t2).add(empty).add(t3);
	}
	
	@clientInit
	function init ():Void {
		trace("FTV init");
	}
	
	public function markTextEnds ():Void {
		t1.node.data += "|";
		t2.node.data += "|";
		empty.node.data += "|";
		t3.node.data += "|";
	}
	
	function set_posts (posts:Array<PostView>):Array<PostView> {
		this.posts = posts;
		
		this.clear();
		for (i in posts) {
			this.add(i);
		}
		
		return posts;
	}
	
	public function addPost (post:Post):Void {
		this.add(new PostView(post));
	}
	
}

class PostView extends EArticle {
	
	public var post(default, set):Post;
	
	var eprofile:ProfileView;
	var emsg:EDiv;
	var btn:EButton;

	public function new (post:Post) {
		super();
		
		this.classes("post");
		
		this.post = post;
	}
	
	function set_post (post:Post):Post {
		//Clear last post
		if (this.post != null) {
			this.clear();
			this.post.removeEventListener("change", onPostChange);
			btn.node.removeEventListener("click", onClick);
		}
		
		this.post = post;
		
		//Add new post
		if (post != null) {
			eprofile = new ProfileView(post.user);
			emsg = new EDiv();
			
			post.addEventListener("change", onPostChange);
			
			this.add(eprofile);
			this.add(emsg.classes("post-message").addText(post.message));
			btn = new EButton().addText("Click Me!");
			btn.addEventListener("click", onClick);
			this.add(btn);
		}
		
		return post;
	}
	
	function onClick (_):Void {
		post.message += " EVENT!";
		post.update();	//Notify views of data change
	}
	
	function onPostChange (_):Void {
		this.post = post;
	}
	
}

class ProfileView extends EAside {
	
	public var user(default, set):User;

	public function new (user:User) {
		super();
		
		this.classes("profile");
		
		this.user = user;
	}
	
	function set_user (user:User):User {
		this.user = user;
		
		this.clear();
		if (user != null) {
			this.add(new EDiv().classes("profile-name").addText(user.name));
		}
		
		return user;
	}
	
}

class User implements IEventDispatcher {
	
	public var id:Int;
	public var name:String;

	public function new (id:Int, name:String) {
		this.id = id;
		this.name = name;
	}
	
	@clientInit
	function init ():Void {
		trace("Client load init! id = " + id);
	}
	
	public function update ():Void {
		this.dispatchEvent(new Event("change"));
	}
	
}

class Post implements IEventDispatcher {
	
	public var user:User;
	public var message:String;

	public function new (user:User, message:String) {
		this.user = user;
		this.message = message;
	}
	
	public function update ():Void {
		this.dispatchEvent(new Event("change"));
	}
	
}