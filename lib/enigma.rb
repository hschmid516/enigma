require './shiftable'

class Enigma
  include Shiftable
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
    @message = message.downcase
    @key = key
    @date = date
  end
end
