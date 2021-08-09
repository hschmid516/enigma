class Cracker < Cipher
  include Creatable
  attr_reader :keys, :date

  def initialize(message, date, plus_minus)
    @keys = crack_keys
    @date = date
    super(message, shifts, plus_minus)
  end

  def find_key
    try_key(@date)
    try_key(@date) until cracked?
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
    last_four.each_slice(4).map do |chars|
      cipher_chars(chars)
    end.join
  end

  def end_rotated
    [' ', 'e', 'n', 'd'].rotate(rotation).join
  end

  def last_four
    @message[-4..-1].chars.rotate(rotation)
  end

  def rotation
    (@message.length % 4) * -1
  end
end
