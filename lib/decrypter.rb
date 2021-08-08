require './lib/cryptable'
require './lib/shiftable'

class Decrypter
  include Cryptable
  include Shiftable
  attr_reader :decrypted

  def initialize
    @decrypted = {}
  end

  def decryption(message, key, date)
    @decrypted[:key] = key
    @decrypted[:date] = date
    @decrypted[:decryption] = decrypt_text(message.downcase)
    @decrypted
  end

  def decrypt_text(message)
    crypt_text(message, @decrypted[:key], @decrypted[:date], :-)
  end
end
