package dom4.utils;

/**
 * Simple wrapper for anonymous structures that are meant to be used as a
 * keyed collection of objects of the same type (i.e. json object).
 *
 * Wraps Reflect calls with nice syntax and static typing without any
 * runtime overhead.
 */
abstract DynamicMap<V>(Dynamic<V>) from Dynamic<V>
{
    /**
     * Get value by string key.
     * Can only be used with m[key] syntax (because it's private).
     */
    @:arrayAccess private inline function get(key:String):V
    {
        return #if js untyped this[key]; #else Reflect.field(this, key); #end
    }

    /**
     * Set value by string key.
     * Can only be used with m[key] = v syntax (because it's private).
     */
    @:arrayAccess private inline function set(key:String, value:V):Void
    {
        Reflect.setField(this, key, value);
    }

    /**
     * Return whether a map contains given key
     */
    public inline function has(key:String):Bool
    {
        return Reflect.hasField(this, key);
    }

    /**
     * Delete given key from a map.
     * Returns whether the key was present before deletion.
     */
    public inline function delete(key:String):Bool
    {
        return Reflect.deleteField(this, key);
    }

    /**
     * Return an array of all keys in the map.
     */
    public inline function keys():Array<String>
    {
        return Reflect.fields(this);
    }
}
