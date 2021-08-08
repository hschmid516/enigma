module Creatable
  def make_date
    Date.today.strftime('%d%m%y')
  end

  def character_set
    ("a".."z").to_a << " "
  end

  def random_key
    rand.to_s[2..6]
  end
end
