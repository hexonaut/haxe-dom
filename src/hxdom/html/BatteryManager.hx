package hxdom.html;

#if js
typedef BatteryManager = js.html.BatteryManager;
#else
class BatteryManager extends EventTarget {
	
	public var charging(default,null) : Bool;

	public var chargingTime(default,null) : Float;

	public var dischargingTime(default,null) : Float;

	public var level(default,null) : Float;

	public var onchargingchange : EventListener;

	public var onchargingtimechange : EventListener;

	public var ondischargingtimechange : EventListener;

	public var onlevelchange : EventListener;

}
#end