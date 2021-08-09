class Cracker < Cipher
  include Creatable
  attr_reader :keys, :date

  def initialize(message, key = nil, date, plus_minus)
    @keys = crack_keys
    @date = date
    super(message, shifts, plus_minus)
  end

  def find_key
    try_key(@date)
    until cracked?
      try_key(@date)
    end
    shifts.key
  end

  def try_key(date)
    key = @keys.shift
    @shifts = KeyShift.new(key, date)
  end

  def cracked?
    crack_last_four == end_rotated
  end

  def crack_last_four
    last_four.split(//).each_slice(4).map do |chars|
      crypt_chars(chars)
    end.join
  end

  def end_rotated
    [' ', 'e', 'n', 'd'].rotate(rotation).join
  end

  def last_four
    @message[-4..-1].split(//).rotate(rotation).join
  end

  def rotation
    (@message.length % 4) * -1
  end
end
