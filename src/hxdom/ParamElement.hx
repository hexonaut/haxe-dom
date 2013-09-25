package hxdom;

#if js
typedef ParamElement = js.html.ParamElement;
#else
class ParamElement extends Element {
	
	/** Name of the parameter. */
	public var name:String;

	/** Only used if the <code>valuetype</code> is set to "ref". Specifies the type of values found at the URI specified by value. */
	public var type:String;

	/** Value of the parameter. */
	public var value:String;

	public var valueType:String;
	
}
#end