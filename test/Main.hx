package ;

import hxdom.html.Event;
import hxdom.HTMLSerializer;
import hxdom.js.Boot;
import hxdom.Elements;

using hxdom.DomTools;

/**
 * Testing for hxdom.
 * 
 * @author Sam MacPherson
 */

class Main {
	
	static function main () {
		#if js
		var html = Boot.init();
		#else
		var user1 = new User(0, "Fred", "image1.png");
		var user2 = new User(1, "John", "image2.png");
		
		var html = EHtml.create();
		var head = EHead.create();
		head.add(EScript.create().attr(src, "shiv.js").attr(defer, true));
		head.add(EScript.create().attr(src, "haxedom.js").attr(defer, true));
		var body = ForumThreadView.create([new Post(user1, "Hi John!"), new Post(user2, "Well hello there Fred.")]);
		
		html.add(head).add(body);
		
		trace(HTMLSerializer.run(html));
		#end
	}
	
}

class ForumThreadView extends EBody {
	
	public var posts(default, set):Array<PostView>;
	
	public function new (posts:Array<Post>) {
		super();
		
		this.posts = posts.map(function (e) { return PostView.create(e); });
	}
	
	function set_posts (posts:Array<PostView>):Array<PostView> {
		this.posts = posts;
		
		this.clear();
		for (i in posts) {
			this.add(i);
			var btn = EButton.create().addText("Click Me!");
			btn.addEventListener("click", onPostClick);
			this.add(btn);
		}
		
		return posts;
	}
	
	function onPostClick (e:Event):Void {
		var pv = posts[Std.int(Math.random() * posts.length)];
		pv.post = new Post(pv.post.user, pv.post.message + " EVENT!");
	}
	
}

class PostView extends EArticle {
	
	public var post(default, set):Post;

	public function new (post:Post) {
		super();
		
		this.classes("post");
		
		this.post = post;
	}
	
	function set_post (post:Post):Post {
		this.post = post;
		
		this.clear();
		this.add(ProfileView.create(post.user));
		this.add(EDiv.create().classes("post-message").addText(post.message));
		
		return post;
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
			this.add(EImage.create().classes("profile-avatar").attr(src, user.avatar));
			this.add(EDiv.create().classes("profile-name").addText(user.name));
		}
		
		return user;
	}
	
}

class User {
	
	public var id(default, null):Int;
	public var name(default, null):String;
	public var avatar(default, null):String;

	public function new (id:Int, name:String, avatar:String) {
		this.id = id;
		this.name = name;
		this.avatar = avatar;
	}
	
}

class Post {
	
	public var user(default, null):User;
	public var message(default, null):String;

	public function new (user:User, message:String) {
		this.user = user;
		this.message = message;
	}
	
}