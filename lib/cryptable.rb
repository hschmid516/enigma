module Cryptable
  def crypt_text(message, key, date, plus_minus)
    message.split(//).each_slice(4).map do |chars|
      crypt_chars(chars, key, date, plus_minus)
    end.join
  end

  def crypt_chars(chars, key, date, plus_minus)
    chars_shifts(chars, key, date).map do |char, shift|
      shift_letters(shift, char, plus_minus).first
    end.join
  end

  def chars_shifts(chars, key, date)
    chars.zip(all_shifts(key, date))
  end
end
