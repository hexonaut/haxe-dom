package hxdom.html;

#if js
typedef Comment = js.html.Comment;
#else
class Comment extends CharacterData {
}
#end