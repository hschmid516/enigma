require './lib/cipher'
require './lib/cracker'
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

  def decrypt(message, key = random_key, date = make_date)
    {
      key: key,
      date: date,
      decryption: Cipher.new(message, key, date, :-).crypt_text
    }
  end

  def crack(message, date = make_date)
    key = Cracker.new(message, date, :-).find_key
    {
      key: key,
      date: date,
      decryption: Cipher.new(message, key, date, :-).crypt_text
    }
  end
end
