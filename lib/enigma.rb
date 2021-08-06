require './shiftable'

class Enigma
  include Shiftable
  attr_reader :message, :key, :date

  def initialize
    @message = nil
    @key = nil
    @date = nil
  end

  def encrypt(message, key = rand.to_s[2..6], date = Date.today.strftime('%d%m%y'))
    create_attributes(message, key, date)
    {
      encryption: message,
      key: key,
      date: date
    }
  end

  def create_attributes(message, key, date)
    @message = message.downcase
    @key = key
    @date = date
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def shift_letters(message)
    encrypted = ""
    message.split(//).each_slice(4).map do |chars|
      encrypted.concat(shift(a_shift, chars[0]).first)
      if !chars[1].nil?
        encrypted.concat(shift(b_shift, chars[1]).first)
      end
      if !chars[2].nil?
        encrypted.concat(shift(c_shift, chars[2]).first)
      end
      if !chars[3].nil?
        encrypted.concat(shift(d_shift, chars[3]).first)
      end
    end
    encrypted
  end

  def shift(shift_letter, char)
    character_set.rotate(character_set.index(char) + shift_letter)
  end
end
