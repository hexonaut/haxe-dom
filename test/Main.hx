package ;

import hxdom.EventDispatcher;
import hxdom.html.CharacterData;
import hxdom.html.Event;
import hxdom.HTMLSerializer;
import hxdom.js.Boot;
import hxdom.Elements;

using hxdom.DomTools;

class Main {
	
	static function main () {
		#if js
		var body:ForumThreadView = cast Boot.init().childNodes[1];
		
		//Add a post on load from JS
		body.addPost(new Post(body.posts[0].post.user, "Right back at yea John! This time from JS!"));
		
		//Check to see text references are maintained
		body.markTextEnds();
		#else
		var user1 = new User(0, "Fred");
		var user2 = new User(1, "John");
		
		var html = EHtml.create();
		var head = EHead.create();
		head.add(EScript.create().addText("HTMLDetailsElement = HTMLElement;"));
		head.add(EScript.create().attr(src, "haxedom.js").attr(defer, true));
		var body = ForumThreadView.create([new Post(user1, "Hi John!"), new Post(user2, "Well hello there Fred.")]);
		body.dataset.testingCustomDataAttr = "data'.data.data'.data";
		
		html.add(head).add(body);
		
		sys.io.File.saveContent("index.html", HTMLSerializer.run(html));
		#end
	}
	
}

class ForumThreadView extends EBody {
	
	public var posts(default, set):Array<PostView>;
	
	var t1:CharacterData;
	var t2:CharacterData;
	var t3:CharacterData;
	
	public function new (posts:Array<Post>) {
		super();
		
		this.posts = posts.map(function (e) { return PostView.create(e); } );
		
		t1 = Text.create("Testing ");
		t2 = Text.create("inline              text ");
		t3 = Text.create("references");
		
		add(t1).add(t2).add(t3);
	}
	
	public function markTextEnds ():Void {
		t1.data += "|";
		t2.data += "|";
		t3.data += "|";
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
		this.add(PostView.create(post));
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
			btn.removeEventListener("click", onClick);
		}
		
		this.post = post;
		
		//Add new post
		if (post != null) {
			eprofile = ProfileView.create(post.user);
			emsg = EDiv.create();
			
			post.addEventListener("change", onPostChange);
			
			this.add(eprofile);
			this.add(emsg.classes("post-message").addText(post.message));
			btn = EButton.create().addText("Click Me!");
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
			this.add(EDiv.create().classes("profile-name").addText(user.name));
		}
		
		return user;
	}
	
}

class User extends EventDispatcher {
	
	public var id:Int;
	public var name:String;

	public function new (id:Int, name:String) {
		this.id = id;
		this.name = name;
	}
	
	public function update ():Void {
		this.dispatchEvent(new Event("change"));
	}
	
}

class Post extends EventDispatcher {
	
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