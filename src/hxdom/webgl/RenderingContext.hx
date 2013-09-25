package hxdom.webgl;

#if js
typedef RenderingContext = js.html.webgl.RenderingContext;
#else
class RenderingContext {
	
	public static inline var ACTIVE_ATTRIBUTES:Int = 0x8B89;

	public static inline var ACTIVE_TEXTURE:Int = 0x84E0;

	public static inline var ACTIVE_UNIFORMS:Int = 0x8B86;

	public static inline var ALIASED_LINE_WIDTH_RANGE:Int = 0x846E;

	public static inline var ALIASED_POINT_SIZE_RANGE:Int = 0x846D;

	public static inline var ALPHA:Int = 0x1906;

	public static inline var ALPHA_BITS:Int = 0x0D55;

	public static inline var ALWAYS:Int = 0x0207;

	public static inline var ARRAY_BUFFER:Int = 0x8892;

	public static inline var ARRAY_BUFFER_BINDING:Int = 0x8894;

	public static inline var ATTACHED_SHADERS:Int = 0x8B85;

	public static inline var BACK:Int = 0x0405;

	public static inline var BLEND:Int = 0x0BE2;

	public static inline var BLEND_COLOR:Int = 0x8005;

	public static inline var BLEND_DST_ALPHA:Int = 0x80CA;

	public static inline var BLEND_DST_RGB:Int = 0x80C8;

	public static inline var BLEND_EQUATION:Int = 0x8009;

	public static inline var BLEND_EQUATION_ALPHA:Int = 0x883D;

	public static inline var BLEND_EQUATION_RGB:Int = 0x8009;

	public static inline var BLEND_SRC_ALPHA:Int = 0x80CB;

	public static inline var BLEND_SRC_RGB:Int = 0x80C9;

	public static inline var BLUE_BITS:Int = 0x0D54;

	public static inline var BOOL:Int = 0x8B56;

	public static inline var BOOL_VEC2:Int = 0x8B57;

	public static inline var BOOL_VEC3:Int = 0x8B58;

	public static inline var BOOL_VEC4:Int = 0x8B59;

	public static inline var BROWSER_DEFAULT_WEBGL:Int = 0x9244;

	public static inline var BUFFER_SIZE:Int = 0x8764;

	public static inline var BUFFER_USAGE:Int = 0x8765;

	public static inline var BYTE:Int = 0x1400;

	public static inline var CCW:Int = 0x0901;

	public static inline var CLAMP_TO_EDGE:Int = 0x812F;

	public static inline var COLOR_ATTACHMENT0:Int = 0x8CE0;

	public static inline var COLOR_BUFFER_BIT:Int = 0x00004000;

	public static inline var COLOR_CLEAR_VALUE:Int = 0x0C22;

	public static inline var COLOR_WRITEMASK:Int = 0x0C23;

	public static inline var COMPILE_STATUS:Int = 0x8B81;

	public static inline var COMPRESSED_TEXTURE_FORMATS:Int = 0x86A3;

	public static inline var CONSTANT_ALPHA:Int = 0x8003;

	public static inline var CONSTANT_COLOR:Int = 0x8001;

	public static inline var CONTEXT_LOST_WEBGL:Int = 0x9242;

	public static inline var CULL_FACE:Int = 0x0B44;

	public static inline var CULL_FACE_MODE:Int = 0x0B45;

	public static inline var CURRENT_PROGRAM:Int = 0x8B8D;

	public static inline var CURRENT_VERTEX_ATTRIB:Int = 0x8626;

	public static inline var CW:Int = 0x0900;

	public static inline var DECR:Int = 0x1E03;

	public static inline var DECR_WRAP:Int = 0x8508;

	public static inline var DELETE_STATUS:Int = 0x8B80;

	public static inline var DEPTH_ATTACHMENT:Int = 0x8D00;

	public static inline var DEPTH_BITS:Int = 0x0D56;

	public static inline var DEPTH_BUFFER_BIT:Int = 0x00000100;

	public static inline var DEPTH_CLEAR_VALUE:Int = 0x0B73;

	public static inline var DEPTH_COMPONENT:Int = 0x1902;

	public static inline var DEPTH_COMPONENT16:Int = 0x81A5;

	public static inline var DEPTH_FUNC:Int = 0x0B74;

	public static inline var DEPTH_RANGE:Int = 0x0B70;

	public static inline var DEPTH_STENCIL:Int = 0x84F9;

	public static inline var DEPTH_STENCIL_ATTACHMENT:Int = 0x821A;

	public static inline var DEPTH_TEST:Int = 0x0B71;

	public static inline var DEPTH_WRITEMASK:Int = 0x0B72;

	public static inline var DITHER:Int = 0x0BD0;

	public static inline var DONT_CARE:Int = 0x1100;

	public static inline var DST_ALPHA:Int = 0x0304;

	public static inline var DST_COLOR:Int = 0x0306;

	public static inline var DYNAMIC_DRAW:Int = 0x88E8;

	public static inline var ELEMENT_ARRAY_BUFFER:Int = 0x8893;

	public static inline var ELEMENT_ARRAY_BUFFER_BINDING:Int = 0x8895;

	public static inline var EQUAL:Int = 0x0202;

	public static inline var FASTEST:Int = 0x1101;

	public static inline var FLOAT:Int = 0x1406;

	public static inline var FLOAT_MAT2:Int = 0x8B5A;

	public static inline var FLOAT_MAT3:Int = 0x8B5B;

	public static inline var FLOAT_MAT4:Int = 0x8B5C;

	public static inline var FLOAT_VEC2:Int = 0x8B50;

	public static inline var FLOAT_VEC3:Int = 0x8B51;

	public static inline var FLOAT_VEC4:Int = 0x8B52;

	public static inline var FRAGMENT_SHADER:Int = 0x8B30;

	public static inline var FRAMEBUFFER:Int = 0x8D40;

	public static inline var FRAMEBUFFER_ATTACHMENT_OBJECT_NAME:Int = 0x8CD1;

	public static inline var FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE:Int = 0x8CD0;

	public static inline var FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE:Int = 0x8CD3;

	public static inline var FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL:Int = 0x8CD2;

	public static inline var FRAMEBUFFER_BINDING:Int = 0x8CA6;

	public static inline var FRAMEBUFFER_COMPLETE:Int = 0x8CD5;

	public static inline var FRAMEBUFFER_INCOMPLETE_ATTACHMENT:Int = 0x8CD6;

	public static inline var FRAMEBUFFER_INCOMPLETE_DIMENSIONS:Int = 0x8CD9;

	public static inline var FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT:Int = 0x8CD7;

	public static inline var FRAMEBUFFER_UNSUPPORTED:Int = 0x8CDD;

	public static inline var FRONT:Int = 0x0404;

	public static inline var FRONT_AND_BACK:Int = 0x0408;

	public static inline var FRONT_FACE:Int = 0x0B46;

	public static inline var FUNC_ADD:Int = 0x8006;

	public static inline var FUNC_REVERSE_SUBTRACT:Int = 0x800B;

	public static inline var FUNC_SUBTRACT:Int = 0x800A;

	public static inline var GENERATE_MIPMAP_HINT:Int = 0x8192;

	public static inline var GEQUAL:Int = 0x0206;

	public static inline var GREATER:Int = 0x0204;

	public static inline var GREEN_BITS:Int = 0x0D53;

	public static inline var HIGH_FLOAT:Int = 0x8DF2;

	public static inline var HIGH_INT:Int = 0x8DF5;

	public static inline var INCR:Int = 0x1E02;

	public static inline var INCR_WRAP:Int = 0x8507;

	public static inline var INT:Int = 0x1404;

	public static inline var INT_VEC2:Int = 0x8B53;

	public static inline var INT_VEC3:Int = 0x8B54;

	public static inline var INT_VEC4:Int = 0x8B55;

	public static inline var INVALID_ENUM:Int = 0x0500;

	public static inline var INVALID_FRAMEBUFFER_OPERATION:Int = 0x0506;

	public static inline var INVALID_OPERATION:Int = 0x0502;

	public static inline var INVALID_VALUE:Int = 0x0501;

	public static inline var INVERT:Int = 0x150A;

	public static inline var KEEP:Int = 0x1E00;

	public static inline var LEQUAL:Int = 0x0203;

	public static inline var LESS:Int = 0x0201;

	public static inline var LINEAR:Int = 0x2601;

	public static inline var LINEAR_MIPMAP_LINEAR:Int = 0x2703;

	public static inline var LINEAR_MIPMAP_NEAREST:Int = 0x2701;

	public static inline var LINES:Int = 0x0001;

	public static inline var LINE_LOOP:Int = 0x0002;

	public static inline var LINE_STRIP:Int = 0x0003;

	public static inline var LINE_WIDTH:Int = 0x0B21;

	public static inline var LINK_STATUS:Int = 0x8B82;

	public static inline var LOW_FLOAT:Int = 0x8DF0;

	public static inline var LOW_INT:Int = 0x8DF3;

	public static inline var LUMINANCE:Int = 0x1909;

	public static inline var LUMINANCE_ALPHA:Int = 0x190A;

	public static inline var MAX_COMBINED_TEXTURE_IMAGE_UNITS:Int = 0x8B4D;

	public static inline var MAX_CUBE_MAP_TEXTURE_SIZE:Int = 0x851C;

	public static inline var MAX_FRAGMENT_UNIFORM_VECTORS:Int = 0x8DFD;

	public static inline var MAX_RENDERBUFFER_SIZE:Int = 0x84E8;

	public static inline var MAX_TEXTURE_IMAGE_UNITS:Int = 0x8872;

	public static inline var MAX_TEXTURE_SIZE:Int = 0x0D33;

	public static inline var MAX_VARYING_VECTORS:Int = 0x8DFC;

	public static inline var MAX_VERTEX_ATTRIBS:Int = 0x8869;

	public static inline var MAX_VERTEX_TEXTURE_IMAGE_UNITS:Int = 0x8B4C;

	public static inline var MAX_VERTEX_UNIFORM_VECTORS:Int = 0x8DFB;

	public static inline var MAX_VIEWPORT_DIMS:Int = 0x0D3A;

	public static inline var MEDIUM_FLOAT:Int = 0x8DF1;

	public static inline var MEDIUM_INT:Int = 0x8DF4;

	public static inline var MIRRORED_REPEAT:Int = 0x8370;

	public static inline var NEAREST:Int = 0x2600;

	public static inline var NEAREST_MIPMAP_LINEAR:Int = 0x2702;

	public static inline var NEAREST_MIPMAP_NEAREST:Int = 0x2700;

	public static inline var NEVER:Int = 0x0200;

	public static inline var NICEST:Int = 0x1102;

	public static inline var NONE:Int = 0;

	public static inline var NOTEQUAL:Int = 0x0205;

	public static inline var NO_ERROR:Int = 0;

	public static inline var ONE:Int = 1;

	public static inline var ONE_MINUS_CONSTANT_ALPHA:Int = 0x8004;

	public static inline var ONE_MINUS_CONSTANT_COLOR:Int = 0x8002;

	public static inline var ONE_MINUS_DST_ALPHA:Int = 0x0305;

	public static inline var ONE_MINUS_DST_COLOR:Int = 0x0307;

	public static inline var ONE_MINUS_SRC_ALPHA:Int = 0x0303;

	public static inline var ONE_MINUS_SRC_COLOR:Int = 0x0301;

	public static inline var OUT_OF_MEMORY:Int = 0x0505;

	public static inline var PACK_ALIGNMENT:Int = 0x0D05;

	public static inline var POINTS:Int = 0x0000;

	public static inline var POLYGON_OFFSET_FACTOR:Int = 0x8038;

	public static inline var POLYGON_OFFSET_FILL:Int = 0x8037;

	public static inline var POLYGON_OFFSET_UNITS:Int = 0x2A00;

	public static inline var RED_BITS:Int = 0x0D52;

	public static inline var RENDERBUFFER:Int = 0x8D41;

	public static inline var RENDERBUFFER_ALPHA_SIZE:Int = 0x8D53;

	public static inline var RENDERBUFFER_BINDING:Int = 0x8CA7;

	public static inline var RENDERBUFFER_BLUE_SIZE:Int = 0x8D52;

	public static inline var RENDERBUFFER_DEPTH_SIZE:Int = 0x8D54;

	public static inline var RENDERBUFFER_GREEN_SIZE:Int = 0x8D51;

	public static inline var RENDERBUFFER_HEIGHT:Int = 0x8D43;

	public static inline var RENDERBUFFER_INTERNAL_FORMAT:Int = 0x8D44;

	public static inline var RENDERBUFFER_RED_SIZE:Int = 0x8D50;

	public static inline var RENDERBUFFER_STENCIL_SIZE:Int = 0x8D55;

	public static inline var RENDERBUFFER_WIDTH:Int = 0x8D42;

	public static inline var RENDERER:Int = 0x1F01;

	public static inline var REPEAT:Int = 0x2901;

	public static inline var REPLACE:Int = 0x1E01;

	public static inline var RGB:Int = 0x1907;

	public static inline var RGB565:Int = 0x8D62;

	public static inline var RGB5_A1:Int = 0x8057;

	public static inline var RGBA:Int = 0x1908;

	public static inline var RGBA4:Int = 0x8056;

	public static inline var SAMPLER_2D:Int = 0x8B5E;

	public static inline var SAMPLER_CUBE:Int = 0x8B60;

	public static inline var SAMPLES:Int = 0x80A9;

	public static inline var SAMPLE_ALPHA_TO_COVERAGE:Int = 0x809E;

	public static inline var SAMPLE_BUFFERS:Int = 0x80A8;

	public static inline var SAMPLE_COVERAGE:Int = 0x80A0;

	public static inline var SAMPLE_COVERAGE_INVERT:Int = 0x80AB;

	public static inline var SAMPLE_COVERAGE_VALUE:Int = 0x80AA;

	public static inline var SCISSOR_BOX:Int = 0x0C10;

	public static inline var SCISSOR_TEST:Int = 0x0C11;

	public static inline var SHADER_TYPE:Int = 0x8B4F;

	public static inline var SHADING_LANGUAGE_VERSION:Int = 0x8B8C;

	public static inline var SHORT:Int = 0x1402;

	public static inline var SRC_ALPHA:Int = 0x0302;

	public static inline var SRC_ALPHA_SATURATE:Int = 0x0308;

	public static inline var SRC_COLOR:Int = 0x0300;

	public static inline var STATIC_DRAW:Int = 0x88E4;

	public static inline var STENCIL_ATTACHMENT:Int = 0x8D20;

	public static inline var STENCIL_BACK_FAIL:Int = 0x8801;

	public static inline var STENCIL_BACK_FUNC:Int = 0x8800;

	public static inline var STENCIL_BACK_PASS_DEPTH_FAIL:Int = 0x8802;

	public static inline var STENCIL_BACK_PASS_DEPTH_PASS:Int = 0x8803;

	public static inline var STENCIL_BACK_REF:Int = 0x8CA3;

	public static inline var STENCIL_BACK_VALUE_MASK:Int = 0x8CA4;

	public static inline var STENCIL_BACK_WRITEMASK:Int = 0x8CA5;

	public static inline var STENCIL_BITS:Int = 0x0D57;

	public static inline var STENCIL_BUFFER_BIT:Int = 0x00000400;

	public static inline var STENCIL_CLEAR_VALUE:Int = 0x0B91;

	public static inline var STENCIL_FAIL:Int = 0x0B94;

	public static inline var STENCIL_FUNC:Int = 0x0B92;

	public static inline var STENCIL_INDEX:Int = 0x1901;

	public static inline var STENCIL_INDEX8:Int = 0x8D48;

	public static inline var STENCIL_PASS_DEPTH_FAIL:Int = 0x0B95;

	public static inline var STENCIL_PASS_DEPTH_PASS:Int = 0x0B96;

	public static inline var STENCIL_REF:Int = 0x0B97;

	public static inline var STENCIL_TEST:Int = 0x0B90;

	public static inline var STENCIL_VALUE_MASK:Int = 0x0B93;

	public static inline var STENCIL_WRITEMASK:Int = 0x0B98;

	public static inline var STREAM_DRAW:Int = 0x88E0;

	public static inline var SUBPIXEL_BITS:Int = 0x0D50;

	public static inline var TEXTURE:Int = 0x1702;

	public static inline var TEXTURE0:Int = 0x84C0;

	public static inline var TEXTURE1:Int = 0x84C1;

	public static inline var TEXTURE10:Int = 0x84CA;

	public static inline var TEXTURE11:Int = 0x84CB;

	public static inline var TEXTURE12:Int = 0x84CC;

	public static inline var TEXTURE13:Int = 0x84CD;

	public static inline var TEXTURE14:Int = 0x84CE;

	public static inline var TEXTURE15:Int = 0x84CF;

	public static inline var TEXTURE16:Int = 0x84D0;

	public static inline var TEXTURE17:Int = 0x84D1;

	public static inline var TEXTURE18:Int = 0x84D2;

	public static inline var TEXTURE19:Int = 0x84D3;

	public static inline var TEXTURE2:Int = 0x84C2;

	public static inline var TEXTURE20:Int = 0x84D4;

	public static inline var TEXTURE21:Int = 0x84D5;

	public static inline var TEXTURE22:Int = 0x84D6;

	public static inline var TEXTURE23:Int = 0x84D7;

	public static inline var TEXTURE24:Int = 0x84D8;

	public static inline var TEXTURE25:Int = 0x84D9;

	public static inline var TEXTURE26:Int = 0x84DA;

	public static inline var TEXTURE27:Int = 0x84DB;

	public static inline var TEXTURE28:Int = 0x84DC;

	public static inline var TEXTURE29:Int = 0x84DD;

	public static inline var TEXTURE3:Int = 0x84C3;

	public static inline var TEXTURE30:Int = 0x84DE;

	public static inline var TEXTURE31:Int = 0x84DF;

	public static inline var TEXTURE4:Int = 0x84C4;

	public static inline var TEXTURE5:Int = 0x84C5;

	public static inline var TEXTURE6:Int = 0x84C6;

	public static inline var TEXTURE7:Int = 0x84C7;

	public static inline var TEXTURE8:Int = 0x84C8;

	public static inline var TEXTURE9:Int = 0x84C9;

	public static inline var TEXTURE_2D:Int = 0x0DE1;

	public static inline var TEXTURE_BINDING_2D:Int = 0x8069;

	public static inline var TEXTURE_BINDING_CUBE_MAP:Int = 0x8514;

	public static inline var TEXTURE_CUBE_MAP:Int = 0x8513;

	public static inline var TEXTURE_CUBE_MAP_NEGATIVE_X:Int = 0x8516;

	public static inline var TEXTURE_CUBE_MAP_NEGATIVE_Y:Int = 0x8518;

	public static inline var TEXTURE_CUBE_MAP_NEGATIVE_Z:Int = 0x851A;

	public static inline var TEXTURE_CUBE_MAP_POSITIVE_X:Int = 0x8515;

	public static inline var TEXTURE_CUBE_MAP_POSITIVE_Y:Int = 0x8517;

	public static inline var TEXTURE_CUBE_MAP_POSITIVE_Z:Int = 0x8519;

	public static inline var TEXTURE_MAG_FILTER:Int = 0x2800;

	public static inline var TEXTURE_MIN_FILTER:Int = 0x2801;

	public static inline var TEXTURE_WRAP_S:Int = 0x2802;

	public static inline var TEXTURE_WRAP_T:Int = 0x2803;

	public static inline var TRIANGLES:Int = 0x0004;

	public static inline var TRIANGLE_FAN:Int = 0x0006;

	public static inline var TRIANGLE_STRIP:Int = 0x0005;

	public static inline var UNPACK_ALIGNMENT:Int = 0x0CF5;

	public static inline var UNPACK_COLORSPACE_CONVERSION_WEBGL:Int = 0x9243;

	public static inline var UNPACK_FLIP_Y_WEBGL:Int = 0x9240;

	public static inline var UNPACK_PREMULTIPLY_ALPHA_WEBGL:Int = 0x9241;

	public static inline var UNSIGNED_BYTE:Int = 0x1401;

	public static inline var UNSIGNED_INT:Int = 0x1405;

	public static inline var UNSIGNED_SHORT:Int = 0x1403;

	public static inline var UNSIGNED_SHORT_4_4_4_4:Int = 0x8033;

	public static inline var UNSIGNED_SHORT_5_5_5_1:Int = 0x8034;

	public static inline var UNSIGNED_SHORT_5_6_5:Int = 0x8363;

	public static inline var VALIDATE_STATUS:Int = 0x8B83;

	public static inline var VENDOR:Int = 0x1F00;

	public static inline var VERSION:Int = 0x1F02;

	public static inline var VERTEX_ATTRIB_ARRAY_BUFFER_BINDING:Int = 0x889F;

	public static inline var VERTEX_ATTRIB_ARRAY_ENABLED:Int = 0x8622;

	public static inline var VERTEX_ATTRIB_ARRAY_NORMALIZED:Int = 0x886A;

	public static inline var VERTEX_ATTRIB_ARRAY_POINTER:Int = 0x8645;

	public static inline var VERTEX_ATTRIB_ARRAY_SIZE:Int = 0x8623;

	public static inline var VERTEX_ATTRIB_ARRAY_STRIDE:Int = 0x8624;

	public static inline var VERTEX_ATTRIB_ARRAY_TYPE:Int = 0x8625;

	public static inline var VERTEX_SHADER:Int = 0x8B31;

	public static inline var VIEWPORT:Int = 0x0BA2;

	public static inline var ZERO:Int = 0;

	public var drawingBufferHeight(default, null):Int;

	public var drawingBufferWidth(default, null):Int;

	public function activeTexture (texture:Int ):Void {}

	public function attachShader (program:Program, shader:Shader ):Void {}

	public function bindAttribLocation (program:Program, index:Int, name:String ):Void {}

	public function bindBuffer (target:Int, buffer:Buffer ):Void {}

	public function bindFramebuffer (target:Int, framebuffer:Framebuffer ):Void {}

	public function bindRenderbuffer (target:Int, renderbuffer:Renderbuffer ):Void {}

	public function bindTexture (target:Int, texture:Texture ):Void {}

	public function blendColor (red:Float, green:Float, blue:Float, alpha:Float ):Void {}

	public function blendEquation (mode:Int ):Void {}

	public function blendEquationSeparate (modeRGB:Int, modeAlpha:Int ):Void {}

	public function blendFunc (sfactor:Int, dfactor:Int ):Void {}

	public function blendFuncSeparate (srcRGB:Int, dstRGB:Int, srcAlpha:Int, dstAlpha:Int ):Void {}

	/** Throws DOMException. */
	@:overload( function( target:Int, data:hxdom.ArrayBuffer, usage:Int ) :Void {} )
	@:overload( function( target:Int, data:hxdom.ArrayBufferView, usage:Int ) :Void {} )
	public function bufferData (target:Int, size:Int, usage:Int ):Void {}

	/** Throws DOMException. */
	@:overload( function( target:Int, offset:Int, data:hxdom.ArrayBuffer ) :Void {} )
	public function bufferSubData (target:Int, offset:Int, data:hxdom.ArrayBufferView ):Void {}

	public function checkFramebufferStatus (target:Int ):Int {}

	public function clear (mask:Int ):Void {}

	public function clearColor (red:Float, green:Float, blue:Float, alpha:Float ):Void {}

	public function clearDepth (depth:Float ):Void {}

	public function clearStencil (s:Int ):Void {}

	public function colorMask (red:Bool, green:Bool, blue:Bool, alpha:Bool ):Void {}

	public function compileShader (shader:Shader ):Void {}

	public function compressedTexImage2D (target:Int, level:Int, internalformat:Int, width:Int, height:Int, border:Int, data:hxdom.ArrayBufferView ):Void {}

	public function compressedTexSubImage2D (target:Int, level:Int, xoffset:Int, yoffset:Int, width:Int, height:Int, format:Int, data:hxdom.ArrayBufferView ):Void {}

	public function copyTexImage2D (target:Int, level:Int, internalformat:Int, x:Int, y:Int, width:Int, height:Int, border:Int ):Void {}

	public function copyTexSubImage2D (target:Int, level:Int, xoffset:Int, yoffset:Int, x:Int, y:Int, width:Int, height:Int ):Void {}

	public function createBuffer ():Buffer {}

	public function createFramebuffer ():Framebuffer {}

	public function createProgram ():Program {}

	public function createRenderbuffer ():Renderbuffer {}

	public function createShader (type:Int ):Shader {}

	public function createTexture ():Texture {}

	public function cullFace (mode:Int ):Void {}

	public function deleteBuffer (buffer:Buffer ):Void {}

	public function deleteFramebuffer (framebuffer:Framebuffer ):Void {}

	public function deleteProgram (program:Program ):Void {}

	public function deleteRenderbuffer (renderbuffer:Renderbuffer ):Void {}

	public function deleteShader (shader:Shader ):Void {}

	public function deleteTexture (texture:Texture ):Void {}

	public function depthFunc (func:Int ):Void {}

	public function depthMask (flag:Bool ):Void {}

	public function depthRange (zNear:Float, zFar:Float ):Void {}

	public function detachShader (program:Program, shader:Shader ):Void {}

	public function disable (cap:Int ):Void {}

	public function disableVertexAttribArray (index:Int ):Void {}

	public function drawArrays (mode:Int, first:Int, count:Int ):Void {}

	public function drawElements (mode:Int, count:Int, type:Int, offset:Int ):Void {}

	public function enable (cap:Int ):Void {}

	public function enableVertexAttribArray (index:Int ):Void {}

	public function finish ():Void {}

	public function flush ():Void {}

	public function framebufferRenderbuffer (target:Int, attachment:Int, renderbuffertarget:Int, renderbuffer:Renderbuffer ):Void {}

	public function framebufferTexture2D (target:Int, attachment:Int, textarget:Int, texture:Texture, level:Int ):Void {}

	public function frontFace (mode:Int ):Void {}

	public function generateMipmap (target:Int ):Void {}

	public function getActiveAttrib (program:Program, index:Int ):ActiveInfo {}

	public function getActiveUniform (program:Program, index:Int ):ActiveInfo {}

	/** Throws DOMException. */
	@:overload( function( program:Program ) :Void {} )
	public function getAttachedShaders (program:Program ):Array<hxdom.webgl.Shader> {}

	public function getAttribLocation (program:Program, name:String ):Int {}

	@:overload( function() :Void {} )
	public function getBufferParameter (target:Int, pname:Int ):Dynamic {}

	public function getContextAttributes ():ContextAttributes {}

	public function getError ():Int {}

	public function getExtension (name:String ):Dynamic {}

	@:overload( function() :Void {} )
	public function getFramebufferAttachmentParameter (target:Int, attachment:Int, pname:Int ):Dynamic {}

	@:overload( function() :Void {} )
	public function getParameter (pname:Int ):Dynamic {}

	public function getProgramInfoLog (program:Program ):String {}

	@:overload( function() :Void {} )
	public function getProgramParameter (program:Program, pname:Int ):Dynamic {}

	@:overload( function() :Void {} )
	public function getRenderbufferParameter (target:Int, pname:Int ):Dynamic {}

	public function getShaderInfoLog (shader:Shader ):String {}

	/** Throws DOMException. */
	@:overload( function() :Void {} )
	public function getShaderParameter (shader:Shader, pname:Int ):Dynamic {}

	public function getShaderPrecisionFormat (shadertype:Int, precisiontype:Int ):ShaderPrecisionFormat {}

	public function getShaderSource (shader:Shader ):String {}

	public function getSupportedExtensions ():Array<String> {}

	@:overload( function() :Void {} )
	public function getTexParameter (target:Int, pname:Int ):Dynamic {}

	@:overload( function() :Void {} )
	public function getUniform (program:Program, location:UniformLocation ):Dynamic {}

	public function getUniformLocation (program:Program, name:String ):UniformLocation {}

	@:overload( function() :Void {} )
	public function getVertexAttrib (index:Int, pname:Int ):Dynamic {}

	public function getVertexAttribOffset (index:Int, pname:Int ):Int {}

	public function hint (target:Int, mode:Int ):Void {}

	public function isBuffer (buffer:Buffer ):Bool {}

	public function isContextLost ():Bool {}

	public function isEnabled (cap:Int ):Bool {}

	public function isFramebuffer (framebuffer:Framebuffer ):Bool {}

	public function isProgram (program:Program ):Bool {}

	public function isRenderbuffer (renderbuffer:Renderbuffer ):Bool {}

	public function isShader (shader:Shader ):Bool {}

	public function isTexture (texture:Texture ):Bool {}

	public function lineWidth (width:Float ):Void {}

	public function linkProgram (program:Program ):Void {}

	public function pixelStorei (pname:Int, param:Int ):Void {}

	public function polygonOffset (factor:Float, units:Float ):Void {}

	public function readPixels (x:Int, y:Int, width:Int, height:Int, format:Int, type:Int, pixels:hxdom.ArrayBufferView ):Void {}

	public function releaseShaderCompiler ():Void {}

	public function renderbufferStorage (target:Int, internalformat:Int, width:Int, height:Int ):Void {}

	public function sampleCoverage (value:Float, invert:Bool ):Void {}

	public function scissor (x:Int, y:Int, width:Int, height:Int ):Void {}

	public function shaderSource (shader:Shader, string:String ):Void {}

	public function stencilFunc (func:Int, ref:Int, mask:Int ):Void {}

	public function stencilFuncSeparate (face:Int, func:Int, ref:Int, mask:Int ):Void {}

	public function stencilMask (mask:Int ):Void {}

	public function stencilMaskSeparate (face:Int, mask:Int ):Void {}

	public function stencilOp (fail:Int, zfail:Int, zpass:Int ):Void {}

	public function stencilOpSeparate (face:Int, fail:Int, zfail:Int, zpass:Int ):Void {}

	/** Throws DOMException. */
	@:overload( function( target:Int, level:Int, internalformat:Int, width:Int, height:Int, border:Int, format:Int, type:Int, pixels:hxdom.ArrayBufferView ) :Void {} )
	@:overload( function( target:Int, level:Int, internalformat:Int, format:Int, type:Int, pixels:hxdom.ImageData ) :Void {} )
	@:overload( function( target:Int, level:Int, internalformat:Int, format:Int, type:Int, image:hxdom.ImageElement ) :Void {} )
	@:overload( function( target:Int, level:Int, internalformat:Int, format:Int, type:Int, canvas:hxdom.CanvasElement ) :Void {} )
	public function texImage2D (target:Int, level:Int, internalformat:Int, format:Int, type:Int, video:hxdom.VideoElement ):Void {}

	public function texParameterf (target:Int, pname:Int, param:Float ):Void {}

	public function texParameteri (target:Int, pname:Int, param:Int ):Void {}

	/** Throws DOMException. */
	@:overload( function( target:Int, level:Int, xoffset:Int, yoffset:Int, width:Int, height:Int, format:Int, type:Int, pixels:hxdom.ArrayBufferView ) :Void {} )
	@:overload( function( target:Int, level:Int, xoffset:Int, yoffset:Int, format:Int, type:Int, pixels:hxdom.ImageData ) :Void {} )
	@:overload( function( target:Int, level:Int, xoffset:Int, yoffset:Int, format:Int, type:Int, image:hxdom.ImageElement ) :Void {} )
	@:overload( function( target:Int, level:Int, xoffset:Int, yoffset:Int, format:Int, type:Int, canvas:hxdom.CanvasElement ) :Void {} )
	public function texSubImage2D (target:Int, level:Int, xoffset:Int, yoffset:Int, format:Int, type:Int, video:hxdom.VideoElement ):Void {}

	public function uniform1f (location:UniformLocation, x:Float ):Void {}

	public function uniform1fv (location:UniformLocation, v:hxdom.Float32Array ):Void {}

	public function uniform1i (location:UniformLocation, x:Int ):Void {}

	public function uniform1iv (location:UniformLocation, v:hxdom.Int32Array ):Void {}

	public function uniform2f (location:UniformLocation, x:Float, y:Float ):Void {}

	public function uniform2fv (location:UniformLocation, v:hxdom.Float32Array ):Void {}

	public function uniform2i (location:UniformLocation, x:Int, y:Int ):Void {}

	public function uniform2iv (location:UniformLocation, v:hxdom.Int32Array ):Void {}

	public function uniform3f (location:UniformLocation, x:Float, y:Float, z:Float ):Void {}

	public function uniform3fv (location:UniformLocation, v:hxdom.Float32Array ):Void {}

	public function uniform3i (location:UniformLocation, x:Int, y:Int, z:Int ):Void {}

	public function uniform3iv (location:UniformLocation, v:hxdom.Int32Array ):Void {}

	public function uniform4f (location:UniformLocation, x:Float, y:Float, z:Float, w:Float ):Void {}

	public function uniform4fv (location:UniformLocation, v:hxdom.Float32Array ):Void {}

	public function uniform4i (location:UniformLocation, x:Int, y:Int, z:Int, w:Int ):Void {}

	public function uniform4iv (location:UniformLocation, v:hxdom.Int32Array ):Void {}

	public function uniformMatrix2fv (location:UniformLocation, transpose:Bool, array:hxdom.Float32Array ):Void {}

	public function uniformMatrix3fv (location:UniformLocation, transpose:Bool, array:hxdom.Float32Array ):Void {}

	public function uniformMatrix4fv (location:UniformLocation, transpose:Bool, array:hxdom.Float32Array ):Void {}

	public function useProgram (program:Program ):Void {}

	public function validateProgram (program:Program ):Void {}

	public function vertexAttrib1f (indx:Int, x:Float ):Void {}

	public function vertexAttrib1fv (indx:Int, values:hxdom.Float32Array ):Void {}

	public function vertexAttrib2f (indx:Int, x:Float, y:Float ):Void {}

	public function vertexAttrib2fv (indx:Int, values:hxdom.Float32Array ):Void {}

	public function vertexAttrib3f (indx:Int, x:Float, y:Float, z:Float ):Void {}

	public function vertexAttrib3fv (indx:Int, values:hxdom.Float32Array ):Void {}

	public function vertexAttrib4f (indx:Int, x:Float, y:Float, z:Float, w:Float ):Void {}

	public function vertexAttrib4fv (indx:Int, values:hxdom.Float32Array ):Void {}

	public function vertexAttribPointer (indx:Int, size:Int, type:Int, normalized:Bool, stride:Int, offset:Int ):Void {}

	public function viewport (x:Int, y:Int, width:Int, height:Int ):Void {}
	
}
#end