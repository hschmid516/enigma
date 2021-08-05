class Enigma

  def encrypt(message, key = rand.to_s[2..6], date = Date.today.strftime('%d%m%y'))
    {
      encryption: message,
      key: key,
      date: date
    }
  end
end
