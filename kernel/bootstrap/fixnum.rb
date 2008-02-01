class Fixnum < Integer
  def ==(o)
    Ruby.primitive :equal
    super(o)
  end
  
  def +(o)
    Ruby.primitive :add
    super(o)
  end
  
  def -(o)
    Ruby.primitive :sub
    super(o)
  end
  
  def *(o)
    Ruby.primitive :fixnum_mul
    super(o)
  end
  
  # this method is aliased to / in core
  # see README-DEVELOPERS regarding safe math compiler plugin
  def divide(o)
    Ruby.primitive :fixnum_div
    super(o)
  end
  
  def %(o)
    Ruby.primitive :fixnum_modulo
    super(o)
  end
  
  def &(o)
    Ruby.primitive :fixnum_and
    super(o)
  end

  def |(o)
    Ruby.primitive :fixnum_or
    super(o)
  end

  def ^(o)
    Ruby.primitive :fixnum_xor
    super(o)
  end

  def ~
    Ruby.primitive :fixnum_invert
    raise PrimitiveFailure, "primitive failed"
  end

  def -@
    Ruby.primitive :fixnum_neg
    raise PrimitiveFailure, "primitive failed"
  end
  
  def divmod(other)
    Ruby.primitive :fixnum_divmod
    super(other)
  end
  
  def <=>(other)
    Ruby.primitive :compare
    super(other)
  end

  def <(o)
    Ruby.primitive :fixnum_lt
    super(o)
  end
  
  def <=(o)
    Ruby.primitive :fixnum_le
    super(o)
  end
  
  def >(o)
    Ruby.primitive :fixnum_gt
    super(o)
  end
  
  def >=(o)
    Ruby.primitive :fixnum_ge
    super(o)
  end
  
  def to_s(base=10)
    based_to_s(base)
  end
  
  def based_to_s(base)
    Ruby.primitive :fixnum_to_s
    raise PrimitiveFailure, "primitive failed"
  end
  
  def to_f
    Ruby.primitive :fixnum_to_f
    raise PrimitiveFailure, "primitive failed"
  end
  
  def size
    Ruby.primitive :fixnum_size
    raise PrimitiveFailure, "primitive failed"
  end

  def inspect
    based_to_s(10)
  end

  def zero?
    self == 0
  end

  def __fixnum_left_shift__(c)
    Ruby.primitive :fixnum_left_shift
    raise PrimitiveFailure, "primitive failed"
  end

  def __fixnum_right_shift__(c)
    Ruby.primitive :fixnum_right_shift
    raise PrimitiveFailure, "primitive failed"
  end

  def __bignum_new__(value)
    Ruby.primitive :bignum_new
    raise PrimitiveFailure, "primitive failed"
  end
end

class Numeric
  def coerce(other)
    Ruby.primitive(:numeric_coerce) # try to keep bignum/fixnum precision
    [Float(other), Float(self)]
  end
end
