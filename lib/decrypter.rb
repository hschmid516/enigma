require './lib/cryptable'
require './lib/shiftable'

class Decrypter
  include Cryptable
  include Shiftable
  attr_reader :decrypted

  def initialize
# Create make_crypt_hash method to store separate variables?
    @decrypted = {}
  end

  def decryption(message, key, date)
    @decrypted[:key] = key
    @decrypted[:date] = date
    @decrypted[:decryption] = decrypt_text(message.downcase)
    @decrypted
  end
end
