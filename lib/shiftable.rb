module Shiftable

  def all_shifts(key, date)
    keys_offsets(key, date).map do |key, offset|
      key.to_i + offset.to_i
    end
  end

  def date_offsets(date)
    (date.to_i ** 2).to_s[-4..-1].split(//)
  end

  def all_keys(key)
    key.split(//).each_cons(2).map do |num|
      num.join
    end
  end

  def shift_letters(key, char, plus_minus)
    character_set.rotate(character_set.index(char).send(plus_minus, key))
  end

  def keys_offsets(key, date)
    all_keys(key).zip(date_offsets(date))
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def random_key
    rand.to_s[1..5]
  end
end
