package ;

import hxdom.HTMLSerializer;
import hxdom.js.Boot;
import hxdom.Elements;
import ForumThreadView;
import PostView;
import ProfileView;
import User;

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
		
		var post1 = PostView.create(user1, "Hi John!");
		var post2 = PostView.create(user2, "Well hello there Fred.");
		
		var html = EHtml.create();
		var head = EHead.create();
		head.add(EScript.create().attr(src, "shiv.js").attr(defer, true));
		head.add(EScript.create().attr(src, "haxedom.js").attr(defer, true));
		var body = ForumThreadView.create([post1, post2]);
		
		html.add(head).add(body);
		
		sys.io.File.saveContent("index.html", HTMLSerializer.run(html));
		#end
	}
	
}