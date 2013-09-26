package hxdom.webgl;

#if js
typedef Buffer = js.html.webgl.Buffer;
#else
class Buffer {
}
#end