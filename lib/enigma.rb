require './lib/shiftable'

class Enigma
  include Shiftable
  attr_reader :key, :data

  def initialize
    @data = {}
  end

  def encrypt(message, key = rand.to_s[2..6], date = today)
    @data = {
      key: key,
      date: date
    }
    @data[:encryption] = encrypt_text(message)
    @data
  end

  def today
    Date.today.strftime('%d%m%y')
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
