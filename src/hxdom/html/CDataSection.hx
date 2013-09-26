package hxdom.html;

#if js
typedef CDATASection = js.html.CDATASection;
#else
class CDATASection extends Text {
}
#end