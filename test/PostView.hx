package ;

import hxdom.Elements;

using hxdom.DomTools;

/**
 * An example of a user post.
 * 
 * @author Sam MacPherson
 */
class PostView extends EArticle {
	
	public var profile(default, null):ProfileView;
	public var message(default, set):String;
	
	var econtent:EDiv;

	public function new (user:User, message:String) {
		super();
		
		this.classes("post");
		
		this.econtent = EDiv.create().classes("post-content");
		this.profile = ProfileView.create(user);
		this.message = message;
		
		this.add(profile);
		this.add(econtent);
	}
	
	function set_message (message:String):String {
		this.message = message;
		
		econtent.clear().addText(message);
		
		return message;
	}
	
}