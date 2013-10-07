package ;

/**
 * Some user object.
 * 
 * @author Sam MacPherson
 */
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