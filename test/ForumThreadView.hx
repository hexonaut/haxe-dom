package ;

import hxdom.Elements;
import hxdom.html.Event;

using hxdom.DomTools;

/**
 * Displays a list of forum posts.
 * 
 * @author Sam MacPherson
 */
class ForumThreadView extends EBody {
	
	public var posts(default, set):Array<PostView>;
	
	public function new (posts:Array<PostView>) {
		super();
		
		this.posts = posts;
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
		posts[Std.int(Math.random() * posts.length)].message += " EVENT!";
	}
	
}