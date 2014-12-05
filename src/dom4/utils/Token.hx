package dom4.utils;

enum TokenType {

    NULL_TYPE;

    WHITESPACE_TYPE;
    STRING_TYPE;
    COMMENT_TYPE;
    NUMBER_TYPE;
    IDENT_TYPE;
    FUNCTION_TYPE;
    ATRULE_TYPE;
    INCLUDES_TYPE;
    DASHMATCH_TYPE;
    BEGINSMATCH_TYPE;
    ENDSMATCH_TYPE;
    CONTAINSMATCH_TYPE;
    SYMBOL_TYPE;
    DIMENSION_TYPE;
    PERCENTAGE_TYPE;
    HEX_TYPE;
}

class Token {


    public var type : TokenType;
    public var value : Dynamic;
    public var ivalue(get, null): Dynamic;
        private function get_ivalue(): Dynamic
        {
          return switch (type) {
            case STRING_TYPE
                 | IDENT_TYPE
                 | FUNCTION_TYPE: this.value.toLowerCase();
            case _: this.value;
          };
        }
    public var unit : String;

    public function toString(): DOMString
    {
      return switch(this.type) {
        case NULL_TYPE:        "null";
        case WHITESPACE_TYPE:  " ";
        case DIMENSION_TYPE:   this.value + this.unit;
        case _ :  this.value;
      };
    }

    public function new(aType : TokenType, aValue : Dynamic, aUnit: String) {
        type = aType;
        value = aValue;
        unit = aUnit;
    }

    public function isNotNull () : Bool
    {
        return !this._isOfType(NULL_TYPE);
    }

    private function _isOfType(aType : TokenType, ?aValue : String="") : Bool
    {
        return (type == aType && ("" == aValue || value.toLowerCase() == aValue));
    }

    public function isWhiteSpace(?w : String="") : Bool {
        return _isOfType(WHITESPACE_TYPE, w);
    }

    public function isString() : Bool
    {
        return _isOfType(STRING_TYPE);
    }

    public function isComment() : Bool
    {
        return _isOfType(COMMENT_TYPE);
    }

    public function isNumber() : Bool
    {
        return _isOfType(NUMBER_TYPE);
    }

    public function isZero() : Bool
    {
        return _isOfType(NUMBER_TYPE, "0");
    }

    public function isIdent(i : String="") : Bool
    {
        return _isOfType(IDENT_TYPE, i);
    }

    public function isFunction(f : String="") : Bool
    {
        return _isOfType(FUNCTION_TYPE, f);
    }

    public function isAtRule(a) : Bool
    {
        return _isOfType(ATRULE_TYPE, a);
    }

    public function isIncludes() : Bool
    {
        return _isOfType(INCLUDES_TYPE);
    }

    public function isDashmatch() : Bool
    {
        return _isOfType(DASHMATCH_TYPE);
    }

    public function isBeginsmatch() : Bool
    {
        return _isOfType(BEGINSMATCH_TYPE);
    }

    public function isEndsmatch() : Bool
    {
        return _isOfType(ENDSMATCH_TYPE);
    }

    public function isContainsmatch() : Bool
    {
        return _isOfType(CONTAINSMATCH_TYPE);
    }

    public function isSymbol(?c : String="") : Bool
    {
        return _isOfType(SYMBOL_TYPE, c);
    }

    public function isDimension() : Bool
    {
        return _isOfType(DIMENSION_TYPE);
    }

    public function isPercentage() : Bool
    {
        return _isOfType(PERCENTAGE_TYPE);
    }

    public function isHex() : Bool
    {
        return _isOfType(HEX_TYPE);
    }

    public function isDimensionOfUnit(aUnit) : Bool
    {
        return (isDimension() && unit == aUnit);
    }

    public function isLength() : Bool
    {
        return (isPercentage() ||
                isDimensionOfUnit("cm") ||
                isDimensionOfUnit("mm") ||
                isDimensionOfUnit("in") ||
                isDimensionOfUnit("pc") ||
                isDimensionOfUnit("px") ||
                isDimensionOfUnit("em") ||
                isDimensionOfUnit("ex") ||
                isDimensionOfUnit("pt"));
    }

    public function isAngle() : Bool
    {
        return (isDimensionOfUnit("deg") ||
                isDimensionOfUnit("rad") ||
                isDimensionOfUnit("grad"));
    }
}
