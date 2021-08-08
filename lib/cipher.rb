require './lib/creatable'

class Cipher
  include Creatable
  attr_reader :message

  def initialize(message, key, date, plus_minus)
    @message = message
    @shifts = KeyShift.new(key, date)
    @plus_minus = plus_minus
  end

  def crypt_text
    @message.split(//).each_slice(4).map do |chars|
      crypt_chars(chars)
    end.join
  end

  def crypt_chars(chars)
    chars_shifts(chars).map do |char, shift|
      shift_letters(shift, char).first
    end.join
  end

  def shift_letters(shift, char)
    character_set.rotate(character_set.index(char).send(@plus_minus, shift))
  end

  def chars_shifts(chars)
    chars.zip(@shifts.all_shifts)
  end
end
