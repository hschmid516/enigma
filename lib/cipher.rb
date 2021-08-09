require './lib/creatable'
require './lib/key_shift'

class Cipher
  include Creatable
  attr_reader :message, :shifts, :plus_minus

  def initialize(message, key = nil, date, plus_minus)
    @message = message.downcase
    @shifts = KeyShift.new(key, date)
    @plus_minus = plus_minus
  end

  def cipher_text
    @message.chars.each_slice(4).map do |chars|
      cipher_chars(chars)
    end.join
  end

  def cipher_chars(chars)
    chars_shifts(chars).map do |char, shift|
      if character_set.include?(char)
        rotate_characters(shift, char).first
      else
        char
      end
    end.join
  end

  def chars_shifts(chars)
    chars.zip(@shifts.all_shifts)
  end

  def rotate_characters(shift, char)
    character_set.rotate(character_set.index(char).send(@plus_minus, shift))
  end
end
