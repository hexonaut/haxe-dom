package dom4.utils;

class Scanner {

    static var CSS_ESCAPE = '\\';

    static var IS_HEX_DIGIT  = 1;
    static var START_IDENT   = 2;
    static var IS_IDENT      = 4;
    static var IS_WHITESPACE = 8;

    static var W   = IS_WHITESPACE;
    static var I   = IS_IDENT;
    static var S   = START_IDENT;
    static var SI  = IS_IDENT | START_IDENT;
    static var XI  = IS_IDENT | IS_HEX_DIGIT;
    static var XSI = IS_IDENT | START_IDENT | IS_HEX_DIGIT;

    static var kLexTable = [
        //                                     TAB LF      FF  CR
           0,  0,  0,  0,  0,  0,  0,  0,  0,  W,  W,  0,  W,  W,  0,  0,
        //
           0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
        // SPC !   "   #   $   %   &   '   (   )   *   +   ,   -   .   /
           W,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  I,  0,  0,
        // 0   1   2   3   4   5   6   7   8   9   :   ;   <   =   >   ?
           XI, XI, XI, XI, XI, XI, XI, XI, XI, XI, 0,  0,  0,  0,  0,  0,
        // @   A   B   C   D   E   F   G   H   I   J   K   L   M   N   O
           0,  XSI,XSI,XSI,XSI,XSI,XSI,SI, SI, SI, SI, SI, SI, SI, SI, SI,
        // P   Q   R   S   T   U   V   W   X   Y   Z   [   \   ]   ^   _
           SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, 0,  S,  0,  0,  SI,
        // `   a   b   c   d   e   f   g   h   i   j   k   l   m   n   o
           0,  XSI,XSI,XSI,XSI,XSI,XSI,SI, SI, SI, SI, SI, SI, SI, SI, SI,
        // p   q   r   s   t   u   v   w   x   y   z   {   |   }   ~
           SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, 0,  0,  0,  0,  0,
        //
           0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
        //
           0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
        //     ¡   ¢   £   ¤   ¥   ¦   §   ¨   ©   ª   «   ¬   ­   ®   ¯
           0,  SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI,
        // °   ±   ²   ³   ´   µ   ¶   ·   ¸   ¹   º   »   ¼   ½   ¾   ¿
           SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI,
        // À   Á   Â   Ã   Ä   Å   Æ   Ç   È   É   Ê   Ë   Ì   Í   Î   Ï
           SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI,
        // Ð   Ñ   Ò   Ó   Ô   Õ   Ö   ×   Ø   Ù   Ú   Û   Ü   Ý   Þ   ß
           SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI,
        // à   á   â   ã   ä   å   æ   ç   è   é   ê   ë   ì   í   î   ï
           SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI,
        // ð   ñ   ò   ó   ô   õ   ö   ÷   ø   ù   ú   û   ü   ý   þ   ÿ
           SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI, SI
    ];

    var kHexValues:DynamicMap<Int> = {
        "0": 0, "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9,
        "a": 10, "b": 11, "c": 12, "d": 13, "e": 14, "f": 15
    };

    var mString : String;
    var mPos : Int;
    var mPreservedPos : Array<Int>;

    /****************** PUBLIC ******************/

    public function new(aString : String) {
        init(aString);
    }

    public function init(aString: String) {
        mString = aString;
        mPos = 0;
        mPreservedPos = [];
    }

    public function preserveState() : Void {
        mPreservedPos.push(mPos);
    }

    public function restoreState() : Void {
        if (0 < mPreservedPos.length)
            mPos = mPreservedPos.pop();
    }

    public function forgetState() : Void {
        if (0 < mPreservedPos.length)
            mPreservedPos.pop();
    }

    /****************** PRIVATE ******************/

    function getCurrentPos() : Int {
        return mPos;
    }

    function getAlreadyScanned() : String {
        return mString.substr(0, mPos);
    }

    function read() : String {
        if (mPos < mString.length)
            return mString.charAt(mPos++);
        return "";
    }

    function peek() : String {
        if (mPos < mString.length)
            return mString.charAt(mPos);
        return "";
    }

    function isHexDigit(c : String) : Bool {
        var code = c.charCodeAt(0);
        return (code < 256 && (kLexTable[code] & IS_HEX_DIGIT) != 0);
    }

    function isIdentStart(c : String) : Bool {
        var code = c.charCodeAt(0);
        return (code >= 256 || (kLexTable[code] & START_IDENT) != 0);
    }

    function startsWithIdent(aFirstChar : String, aSecondChar : String) : Bool {
        var code = aFirstChar.charCodeAt(0);
        return isIdentStart(aFirstChar) ||
            (aFirstChar == "-" && isIdentStart(aSecondChar));
    }

    function isIdent(c : String) : Bool {
        var code = c.charCodeAt(0);
        return (code >= 256 || (kLexTable[code] & IS_IDENT != 0));
    }

    function pushback() : Void {
        mPos--;
    }

    public function nextHexValue() : Token {
        var c = read();
        if (c == "" || !isHexDigit(c))
            return new Token(NULL_TYPE, null, "");
        var s = c;
        c = read();
        while (c != "" && isHexDigit(c)) {
            s += c;
            c = read();
        }
        if (c != "")
            pushback();
        return new Token(HEX_TYPE, s, "");
    }

    function isWhiteSpace(c : String) : Bool {
        var code = c.charCodeAt(0);
        return code < 256 && (kLexTable[code] & IS_WHITESPACE) != 0;
    }

    function gatherEscape() : String {
        var c = peek();
        if (c == "")
            return "";
        if (isHexDigit(c)) {
            var code = 0;
            var j = 0;
            for (i in 0...6) {
                   j = i;
                c = read();
                if (isHexDigit(c))
                    code = code * 16 + kHexValues[c.toLowerCase()];
                else if (!isHexDigit(c) && !isWhiteSpace(c)) {
                    pushback();
                    break;
                }
                else
                    break;
            }
            if (j == 6) {
                c = peek();
                if (isWhiteSpace(c))
                    read();
            }
            return String.fromCharCode(code);
        }
        c = read();
        if (c != "\n")
            return c;
        return "";
    }

    function gatherIdent(c : String) : String {
        var s = "";
        if (c == CSS_ESCAPE)
            s += gatherEscape();
        else
            s += c;
        c = read();
        while (c != ""
               && (isIdent(c) || c == CSS_ESCAPE)) {
            if (c == CSS_ESCAPE)
                s += gatherEscape();
            else
                s += c;
            c = read();
        }
        if (c != "")
            pushback();
        return s;
    }

    function parseIdent(c : String) : Token {
        var value = gatherIdent(c);
        var nextChar = peek();
        if (nextChar == "(") {
            value += read();
            return new Token(FUNCTION_TYPE, value, "");
        }
        return new Token(IDENT_TYPE, value, "");
    }

    function isDigit(c : String) : Bool {
        return (c >= '0') && (c <= '9');
    }

    function parseComment(c : String) : Token {
        var s = c;
        while ((c = read()) != "") {
          s += c;
          if (c == "*") {
            c = read();
            if (c == "")
              break;
            if (c == "/") {
              s += c;
              break;
            }
            pushback();
          }
        }
        return new Token(COMMENT_TYPE, s, "");
    }

    function parseNumber(c : String) : Token {
        var s = c;
        var foundDot = false;
        while ((c = read()) != "") {
            if (c == ".") {
                if (foundDot)
                    break;
                else {
                    s += c;
                    foundDot = true;
                }
            } else if (isDigit(c))
                s += c;
            else
                break;
        }
    
        if (c != "" && startsWithIdent(c, peek())) { // DIMENSION
            var unit = gatherIdent(c);
            return new Token(DIMENSION_TYPE, s, unit);
        }
        else if (c == "%") {
            return new Token(PERCENTAGE_TYPE, s, "");
        }
        else if (c != "")
            pushback();
        return new Token(NUMBER_TYPE, s, "");
    }

    function parseString(aStop : String) : Token {
        var s = aStop;
        var previousChar = aStop;
        var c;
        while ((c = read()) != "") {
            if (c == aStop && previousChar != CSS_ESCAPE) {
                s += c;
                break;
            }
            else if (c == CSS_ESCAPE) {
                c = peek();
                if (c == "")
                    break;
                else if (c == "\n" || c == "\r" || c == "\x0C") {
                    var d = c;
                    c = read();
                    // special for Opera that preserves \r\n...
                    if (d == "\r") {
                        c = peek();
                        if (c == "\n")
                            c = read();
                    }
                }
                else {
                    s += gatherEscape();
                    c = peek();
                }
            }
            else if (c == "\n" || c == "\r" || c == "\x0C") {
                break;
            }
            else
                s += c;
    
            previousChar = c;
        }
        return new Token(STRING_TYPE, s, "");
    } 

    function parseAtKeyword(c : String) : Token {
        return new Token(ATRULE_TYPE, gatherIdent(c), "");
    }

    function eatWhiteSpace(c : String) : String {
        var s = c;
        while ((c = read()) != "") {
            if (!isWhiteSpace(c))
                break;
            s += c;
        }
        if (c != "")
            pushback();
        return s;
    }

    public function nextToken() : Token {
        var c = read();
        if (c == "")
            return new Token(NULL_TYPE, null, "");

        if (startsWithIdent(c, peek()))
            return parseIdent(c);

        if (c == '@') {
            var nextChar = read();
            if (nextChar != "") {
                var followingChar = peek();
                pushback();
                if (startsWithIdent(nextChar, followingChar))
                    return parseAtKeyword(c);
            }
        }

        if (c == "." || c == "+" || c == "-") {
            var nextChar = peek();
            if (isDigit(nextChar))
                return parseNumber(c);
            else if (nextChar == "." && c != ".") {
                var firstChar = read();
                var secondChar = peek();
                pushback();
                if (isDigit(secondChar))
                    return parseNumber(c);
            }
        }
        if (isDigit(c)) {
            return parseNumber(c);
        }

        if (c == "'" || c == '"')
            return parseString(c);

        if (isWhiteSpace(c)) {
            var s = eatWhiteSpace(c);
      
            return new Token(WHITESPACE_TYPE, s, "");
        }

        if (c == "|" || c == "~" || c == "^" || c == "$" || c == "*") {
            var nextChar = read();
            if (nextChar == "=") {
                switch (c) {
                    case "~" :
                        return new Token(INCLUDES_TYPE, "~=", "");
                    case "|" :
                        return new Token(DASHMATCH_TYPE, "|=", "");
                    case "^" :
                        return new Token(BEGINSMATCH_TYPE, "^=", "");
                    case "$" :
                        return new Token(ENDSMATCH_TYPE, "$=", "");
                    case "*" :
                        return new Token(CONTAINSMATCH_TYPE, "*=", "");
                }
            } else if (nextChar != "")
            pushback();
        }

        if (c == "/" && peek() == "*")
            return parseComment(c);

        return new Token(SYMBOL_TYPE, c, "");
    }
}
