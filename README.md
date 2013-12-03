haxe-dom provides target independant DOM manipulation. The goal of this project is to reduce duplicate code between the server and client without having to resort to single page apps. View state can be manipulated on the server, serialized into idiomatic HTML5 and reconstructed on the client. Usage is straightforward.

Contruct the page (Neko/PHP/Java/etc):

	import hxdom.Elements;
	
	var page = new EHtml();
	var head = new EHead();
	var body = new EBody();
	
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
			
			head = new EHead();
			body = new EBody();
			
			appendChild(head);
			appendChild(body);
			
			for (i in 0 ... numTexts) {
				addSomeTextToBody();
			}
		}
		
		public function addSomeTextToBody ():Void {
			body.appendChild(new Text("Some Text"));
		}
		
	}

Build the HTML and send it to the client:
	
	writeToHttpSocket(hxdom.HTMLSerializer.run(new MyCustomApp(5)));

Sends this to the client:

	<!DOCTYPE html><html data-class='MyCustomApp' data-id='0' data-k0='body' data-v0='D2' data-k1='head' data-v1='D1'><head data-class='hxdom.EHead' data-id='1'/><body data-class='hxdom.EBody' data-id='2'>Some TextSome TextSome TextSome TextSome Text</body></html>

Load the custom app and add 2 more lines of text (JavaScript):

	var myCustomApp:MyCustomApp = cast hxdom.js.Boot();
	myCustomApp.addSomeTextToBody();
	myCustomApp.addSomeTextToBody();

Event Listeners
===============

You can also attach event listeners on the server:

	class MyCustomApp extends EHtml {
		
		public function new () {
			super();
			
			var body = new EBody();
			
			appendChild(new EHead());
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
	
	var div = new EDiv().classes("myCssClass anotherClass").attr(id, "someId").addText("Some text in the Div!");

FAQ
===

Can I use this with NodeJS?

Although I have not tested this yet you can use NodeJS by adding the -D use_vdom compiler flag. This flag makes the library use the virtual DOM instead of the actual one (which doesn't exist in NodeJS).

A Full Example
==============

Use this command:

	haxe -cp . -neko server.n -main Main --next -cp . -js client.js -main Main

To compile this example:

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
			var app:ForumApp = cast Boot.init();
			
			//Add a post on load from JS
			app.threads.addPost(new Post(app.threads.posts[0].post.user, "Right back at yea John! This time from JS!"));
			
			//Check to see text references are maintained
			app.threads.markTextEnds();
			#else
			sys.io.File.saveContent("index.html", HTMLSerializer.run(new ForumApp()));
			#end
		}
		
		public static function staticEventListener (e:Event):Void {
			trace("Static listener");
		}
		
	}

	class ForumApp extends EHtml {
		
		public var head(default, null):EHead;
		public var threads(default, null):ForumThreadView;
		
		public function new () {
			super();
			
			var user1 = new User(0, "Fred");
			var user2 = new User(1, "John");
			
			head = new EHead();
			head.add(new EScript().addText("HTMLDetailsElement = HTMLElement;"));
			head.add(new EScript().attr(src, "haxedom.js").attr(defer, true));
			
			threads = new ForumThreadView([new Post(user1, "Hi John!"), new Post(user2, "Well hello there Fred.")]);
			untyped threads.node.dataset.testingCustomDataAttr = "data'.data.data'.data";
			threads.node.style.backgroundColor = "red";
			threads.addEventListener("click", Main.staticEventListener);
			
			add(head);
			add(threads);
		}
		
	}

	class ForumThreadView extends EBody {
		
		public var posts(default, set):Array<PostView>;
		
		var t1:Text;
		var t2:Text;
		var t3:Text;
		
		public function new (posts:Array<Post>) {
			super();
			
			this.posts = posts.map(function (e) { return new PostView(e); } );
			
			t1 = new Text("Testing ");
			t2 = new Text("inline              text ");
			t3 = new Text("references");
			
			add(t1).add(t2).add(t3);
		}
		
		public function markTextEnds ():Void {
			t1.node.data += "|";
			t2.node.data += "|";
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

Run the neko binary which will produce an index.html file to which you can load into your browser. You may need to shiv missing elements depending on your browser.