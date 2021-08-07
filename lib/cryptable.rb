module Cryptable
  def encrypt_text(message)
    message.split(//).each_slice(4).map do |chars|
      encrypt_chars(chars, @encrypted[:date], @encrypted[:key])
    end.join
  end

  def encrypt_chars(chars, date, key)
    chars.zip(all_shifts(date, key)).map do |char, key|
      crypt(key, char, :+).first
    end.join
  end

  def decrypt_text(message)
    message.split(//).each_slice(4).map do |chars|
      decrypt_chars(chars, @decrypted[:date], @decrypted[:key])
    end.join
  end

  def decrypt_chars(chars, date, key)
    chars.zip(all_shifts(date, key)).map do |char, key|
      crypt(key, char, :-).first
    end.join
  end


end
