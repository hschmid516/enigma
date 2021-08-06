module Shiftable

  def date_offsets
    (@data[:date].to_i ** 2).to_s[-4..-1].split(//)
  end

  def all_keys
    @data[:key].split(//).each_cons(2).map do |num|
      num.join
    end
  end

  def all_shifts
    all_keys.zip(date_offsets).map do |key, offset|
      key.to_i + offset.to_i
    end
  end

  def shift(key, char)
    character_set.rotate(character_set.index(char) + key)
  end
end
