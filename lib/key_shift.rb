class KeyShift
  attr_reader :key, :date

  def initialize(key, date)
    @key = key
    @date = date
  end

  def all_shifts
    keys_offsets.map do |key, offset|
      key.to_i + offset.to_i
    end
  end

  def date_offsets
    (@date.to_i ** 2).to_s[-4..-1].split(//)
  end

  def all_keys
    @key.split(//).each_cons(2).map do |num|
      num.join
    end
  end

  def keys_offsets
    all_keys.zip(date_offsets)
  end
end
