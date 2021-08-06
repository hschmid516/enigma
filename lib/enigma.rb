require './lib/shiftable'

class Enigma
  include Shiftable
  attr_reader :key, :date

  def initialize
    @key = nil
    @date = nil
  end

  def encrypt(message, key = rand.to_s[2..6], date = Date.today.strftime('%d%m%y'))
    create_attributes(message, key, date)
    {
      encryption: encrypt_text(message),
      key: key,
      date: date
    }
  end

  def create_attributes(message, key, date)
    @key = key
    @date = date
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def encrypt_text(message)
    message.split(//).each_slice(4).map do |chars|
      new_letters(chars)
    end.join
  end


  def new_letters(chars)
    chars.zip(all_shifts).map do |char, shift|
        shift(shift, char).first
    end.join
  end
end
