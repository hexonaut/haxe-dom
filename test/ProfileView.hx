package ;

import hxdom.Elements;

using hxdom.DomTools;

/**
 * An example of a typical component.
 * 
 * @author Sam MacPherson
 */
class ProfileView extends EAside {
	
	public var user(default, set):User;

	public function new (?user:User) {
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