module Shiftable

  def date_offsets(date)
    (date.to_i ** 2).to_s[-4..-1].split(//)
  end

  def all_keys(key)
    key.split(//).each_cons(2).map do |num|
      num.join
    end
  end

  def all_shifts(date, key)
    all_keys(key).zip(date_offsets(date)).map do |key, offset|
      key.to_i + offset.to_i
    end
  end

  def encrypt_shift(key, char)
    character_set.rotate(character_set.index(char) + key)
  end

  def decrypt_shift(key, char)
    character_set.rotate(character_set.index(char) - key)
  end
end
