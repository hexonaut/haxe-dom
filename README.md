haxe-dom provides target independant DOM manipulation. The goal of this project is to reduce duplicate code between the server and client without having to resort to single page apps. View state can be manipulated on the server, serialized into idiomatic HTML5 and reconstructed on the client. Usage is straightforward.

Contruct the page (Neko/PHP/Java/etc):

	import hxdom.Elements;
	
	var page = EHtml.create();
	var head = EHead.create();
	var body = EBody.create();
	
	page.appendChild(head);
	page.appendChild(body);

Serialize to HTML:

	writeToHttpSocket(hxdom.HTMLSerializer.run(page));

The following is sent across the wire:

	<!DOCTYPE html><html data-class='hxdom.EHtml' data-id='0'><head data-class='hxdom.EHead' data-id='1'/><body data-class='hxdom.EBody' data-id='2'/></html>

Init on client (JavaScript):

	var page = hxdom.js.Boot();

Custom Classes
==============

The above example is cool and all, but it's not really practical for a full scale app. We need to be able to extend and encapsulate DOM components. Doing this is also very straightforward:

	class MyCustomApp extends EHtml {
		
		public var head(default, null):EHead;
		public var body(default, null):EBody;
		
		public function new (numTexts:Int) {
			super();
			
			head = EHead.create();
			body = EBody.create();
			
			appendChild(head);
			appendChild(body);
			
			for (i in 0 ... numTexts) {
				addSomeTextToBody();
			}
		}
		
		public function addSomeTextToBody ():Void {
			body.appendChild(Text.create("Some Text"));
		}
		
	}

Build the HTML and send it to the client:
	
	writeToHttpSocket(hxdom.HTMLSerializer.run(MyCustomApp.create(5)));

Sends this to the client:

	<!DOCTYPE html><html data-class='MyCustomApp' data-id='0' data-k0='body' data-v0='D2' data-k1='head' data-v1='D1'><head data-class='hxdom.EHead' data-id='1'/><body data-class='hxdom.EBody' data-id='2'>Some TextSome TextSome TextSome TextSome Text</body></html>

Load the custom app and 2 more lines of text (JavaScript):

	var myCustomApp:MyCustomApp = cast hxdom.js.Boot();
	myCustomApp.addSomeTextToBody();
	myCustomApp.addSomeTextToBody();

Event Listeners
===============

You can also attach event listeners on the server:

	class MyCustomApp extends EHtml {
		
		public function new () {
			super();
			
			var body = EBody.create();
			
			appendChild(EHead.create());
			appendChild(body);
			
			body.addEventListener("click", onClick);
		}
		
		public function onClick (_):Void {
			trace("Click!");
		}
		
	}

Sends the following:

	<!DOCTYPE html><html data-class='MyCustomApp' data-id='0'><head data-class='hxdom.EHead' data-id='2'/><body data-class='hxdom.EBody' data-id='1' data-k0='listeners' data-v0='by5:clickloy4:funcy7:onClicky4:instD0y3:capfghh'/></html>

Load on client (JavaScript):

	hxdom.js.Boot();

And that's it! Clicking on the webpage will trigger a "Click!" to be traced to the console.

One unavoidable restriction on events is that you cannot listen to anonymous functions. The serializer needs to be able to reference the function and this is impossible with lambdas. For example this will result in a compilation error:

	myElem.addEventListener("click", function (_) { trace("Click!"); });

Tools
=====

Using the DOM directly can be kind of annoying, so I've included a DomTools class that you should usually include as a "using". DomTools is built for chaining. Here is a quick example:

	using hxdom.DomTools;
	
	var div = EDiv.create().classes("myCssClass anotherClass").attr(id, "someId").addText("Some text in the Div!");

Notes
=====

What's with the XXXX.create() instead of using the "new" operator?

Unfortunately the JS spec can only create elements via "document.createElement(tagName)" which means it is impossible to use the new operator and have it return a reference to a DOM object. The next best solution as far as I could see was to use a create() static method that is generated via macros to completely replicate the signature of the constructor. The create function will always call the constructor.

A Full Example
==============

Compile the following code with this command:

	haxe -cp . -neko server.n -main Main --next -cp . -js client.js -main Main

	package ;

	import hxdom.html.Event;
	import hxdom.HTMLSerializer;
	import hxdom.js.Boot;
	import hxdom.Elements;

	using hxdom.DomTools;

	class Main {
		
		static function main () {
			#if js
			Boot.init();
			#else
			var user1 = new User(0, "Fred", "image1.png");
			var user2 = new User(1, "John", "image2.png");
			
			var html = EHtml.create();
			var head = EHead.create();
			head.add(EScript.create().attr(src, "client.js").attr(defer, true));
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