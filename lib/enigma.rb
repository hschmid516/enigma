require './lib/cipher'
require './lib/creatable'

class Enigma
  include Creatable

  def encrypt(message, key = random_key, date = make_date)
    {
      key: key,
      date: date,
      encryption: Cipher.new(message, key, date, :+).crypt_text
    }
  end

  def decrypt(message, key, date = make_date)
    {
      key: key,
      date: date,
      decryption: Cipher.new(message, key, date, :-).crypt_text
    }
  end
end
