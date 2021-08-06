module Shiftable

# Combine keys and offsets into shifts
  def a_key
    @key[0..1]
  end

  def b_key
    @key[1..2]
  end

  def c_key
    @key[2..3]
  end

  def d_key
    @key[3..4]
  end

  def offsets_from_date
    (@date.to_i ** 2).to_s[-4..-1]
  end

  def a_offset
    offsets_from_date[0].to_i
  end

  def b_offset
    offsets_from_date[1].to_i
  end

  def c_offset
    offsets_from_date[2].to_i
  end

  def d_offset
    offsets_from_date[3].to_i
  end

  def a_shift
    a_key.to_i + a_offset
  end

  def b_shift
    b_key.to_i + b_offset
  end

  def c_shift
    c_key.to_i + c_offset
  end

  def d_shift
    d_key.to_i + d_offset
  end
end
