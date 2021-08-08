require './lib/cryptable'
require './lib/shiftable'

class Encrypter
  include Cryptable
  include Shiftable
  attr_reader :encrypted

  def initialize
    @encrypted = {}
  end

  def encryption(message, key, date)
    @encrypted[:key] = key
    @encrypted[:date] = date
    @encrypted[:encryption] = encrypt_text(message.downcase)
    @encrypted
  end

  def encrypt_text(message)
    crypt_text(message, @encrypted[:key], @encrypted[:date], :+)
  end
end
