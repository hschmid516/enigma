require './lib/shiftable'

class Enigma
  include Shiftable
  attr_reader :key, :encrypted, :decrypted

  def initialize
    @encrypted = {}
    @decrypted = {}
  end

  def encrypt(message, key = rand.to_s[2..6], date = today)
    @encrypted = {
      key: key,
      date: date
    }
    @encrypted[:encryption] = encrypt_text(message)
    @encrypted
  end

  def decrypt(message, key, date = today)
    @decrypted = {
      key: key,
      date: date
    }
    @decrypted[:decryption] = decrypt_text(message)
    @decrypted
  end

  def today
    Date.today.strftime('%d%m%y')
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def encrypt_text(message)
    message.split(//).each_slice(4).map do |chars|
      encrypt_chars(chars, @encrypted[:date], @encrypted[:key])
    end.join
  end

  def encrypt_chars(chars, date, key)
    chars.zip(all_shifts(date, key)).map do |char, key|
        encrypt_shift(key, char).first
    end.join
  end

  def decrypt_text(message)
    message.split(//).each_slice(4).map do |chars|
      decrypt_chars(chars, @decrypted[:date], @decrypted[:key])
    end.join

  end

  def decrypt_chars(chars, date, key)
    chars.zip(all_shifts(date, key)).map do |char, key|
      decrypt_shift(key, char).first
    end.join
  end
end
