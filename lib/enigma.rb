require './lib/shiftable'

class Enigma
  include Shiftable
  attr_reader :encrypter, :decrypter

  def initialize
    @encrypter = Encrypter.new
    @decrypter = Decrypter.new
  end

  def encrypt(message, key = random_key, date = today)
    @encrypter.encryption(message, key, date)
  end

  def decrypt(message, key, date = today)
    @decrypter.decryption(message, key, date)
  end

  def today
    Date.today.strftime('%d%m%y')
  end
end
