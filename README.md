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

Use this command:

	haxe -cp . -neko server.n -main Main --next -cp . -js client.js -main Main

To compile this example:

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

Run the neko binary which will produce an index.html file to which you can load into your browser. You may need to shiv missing elements depending on your browser.