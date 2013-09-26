package hxdom.html;

#if js
typedef EntityReference = js.html.EntityReference;
#else
class EntityReference extends Node {
}
#end