package hxdom;

import hxdom.html.Element;
import hxdom.html.Node;
import hxdom.html.ScriptElement;
import hxdom.Wrappers;

/**
 * Utility functions for common DOM operations. Most functions are built for chaining.
 * 
 * @author Sam MacPherson
 */
class DomTools {
	
	/**
	 * Does an appendChild, but returns the current node for chaining.
	 */
	public static function add<T:Node> (parent:T, child:Node):T {
		parent.appendChild(child);
		
		return parent;
	}
	
	/**
	 * Add in classes for this element. Space delimited.
	 */
	public static function classes<T:Element> (e:T, cls:String):T {
		if (e.className == null) e.className = cls;
		else e.className += " " + cls;
		
		return e;
	}
	
	/**
	 * Set the id for this element.
	 */
	public static function ident<T:Element> (e:T, id:String):T {
		e.id = id;
		
		return e;
	}
	
	/**
	 * Set the src property for this element.
	 */
	public static function source<T:{ src:String }> (e:T, src:String):T {
		e.src = src;
		
		return e;
	}
	
	/**
	 * Shortcut for adding text.
	 */
	public static function text<T:Node> (parent:T, text:String):T {
		parent.appendChild(new Text(text));
		
		return parent;
	}
	
}