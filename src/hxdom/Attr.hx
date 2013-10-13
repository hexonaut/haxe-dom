/****
* Copyright (C) 2013 Sam MacPherson
* 
* Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
* 
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
****/

package hxdom;

/**
 * A list of all valid HTML attributes.
 * 
 * Taken from: https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes
 * 
 * @author Sam MacPherson
 */
enum Attr {
	accept;
	acceptCharset;	//accept-charset
	accesskey;
	action;
	align;
	alt;
	async;
	autocomplete;
	autofocus;
	autoplay;
	bgcolor;
	border;
	buffered;
	challenge;
	charset;
	checked;
	cite;
	className;	//class
	code;
	codebase;
	color;
	cols;
	colspan;
	content;
	contenteditable;
	contextmenu;
	controls;
	coords;
	data;
	datetime;
	default_;	//default
	defer;
	dir;
	dirname;
	disabled;
	download;
	draggable;
	dropzone;
	enctype;
	for_;	//for
	form;
	headers;
	height;
	hidden;
	high;
	href;
	hreflang;
	httpEquiv;	//http-equiv
	icon;
	id;
	ismap;
	itemprop;
	keytype;
	kind;
	label;
	lang;
	language;
	list;
	loop;
	low;
	manifest;
	max;
	maxlength;
	media;
	method;
	min;
	multiple;
	name;
	novalidate;
	open;
	optimum;
	pattern;
	ping;
	placeholder;
	poster;
	preload;
	pubdate;
	radiogroup;
	readonly;
	rel;
	required;
	reversed;
	rows;
	rowspan;
	sandbox;
	spellcheck;
	scope;
	scoped;
	seamless;
	selected;
	shape;
	size;
	sizes;
	span;
	src;
	srcdoc;
	srclang;
	start;
	step;
	style;
	summary;
	tabindex;
	target;
	title;
	type;
	usemap;
	value;
	width;
	wrap;
}