package hxdom.html;

#if js
typedef SpanElement = js.html.SpanElement;
#else
class SpanElement extends Element {
}
#end