require './lib/cryptable'
require './lib/shiftable'

class Encrypter
  include Cryptable
  include Shiftable
  attr_reader :encrypted

  def initialize
# Create make_crypt_hash method to store separate variables?  
    @encrypted = {}
  end

  def encryption(message, key, date)
    @encrypted[:key] = key
    @encrypted[:date] = date
    @encrypted[:encryption] = encrypt_text(message.downcase)
    @encrypted
  end
end
