package hxdom.html;

#if js
typedef NodeList = js.html.NodeList;
#else
typedef NodeList = Array<Node>;
#end