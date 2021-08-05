class Enigma
  attr_reader :message, :key, :date

  def initialize
    @message = nil
    @key = nil
    @date = nil
  end

  def encrypt(message, key = rand.to_s[2..6], date = Date.today.strftime('%d%m%y'))
    create_attributes(message, key, date)
    {
      encryption: message,
      key: key,
      date: date
    }
  end

  def create_attributes(message, key, date)
    @message = message
    @key = key
    @date = date
  end

  def a_key
    @key[0..1]
  end

  def b_key
    @key[1..2]
  end

  def c_key
    @key[2..3]
  end

  def d_key
    @key[3..4]
  end
end
