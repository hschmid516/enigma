require './lib/cipher'
require './lib/cracker'
require './lib/creatable'

class Enigma
  include Creatable

  def encrypt(message, key = random_key, date = make_date)
    {
      encryption: Cipher.new(message, key, date, :+).cipher_text,
      key: key,
      date: date
    }
  end

  def decrypt(message, key = random_key, date = make_date)
    {
      decryption: Cipher.new(message, key, date, :-).cipher_text,
      key: key,
      date: date
    }
  end

  def crack(message, date = make_date)
    key = Cracker.new(message, date, :-).find_key
    {
      decryption: Cipher.new(message, key, date, :-).cipher_text,
      key: key,
      date: date
    }
  end
end
