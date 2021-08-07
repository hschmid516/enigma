require './lib/encrypter'

RSpec.describe Encrypter do
  context 'initialization' do
    encrypter = Encrypter.new

    it 'exists' do
      expect(encrypter).to be_a(Encrypter)
    end
  end

  context 'keys and shifts' do
    encrypter = Encrypter.new
    encrypter.encryption('hello world', '02715', '040895')

    it 'makes array of date offsets' do
      expect(encrypter.date_offsets(encrypter.encrypted[:date])).to eq(['1', '0', '2', '5'])
    end

    it 'makes array of all keys' do
      expect(encrypter.all_keys(encrypter.encrypted[:key])).to eq(["02", "27", "71", "15"])
    end

    it 'makes array of all shifts' do
      expect(encrypter.all_shifts(encrypter.encrypted[:date], encrypter.encrypted[:key])).to eq([3, 27, 73, 20])
    end

    it 'makes a character set' do
      expected =
      ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
       "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(encrypter.character_set).to eq(expected)
    end
  end

  context 'encryption' do
    encrypter = Encrypter.new

    it 'can encrypt characters' do
      encrypter.encryption('hello world', '02715', '040895')

      expect(encrypter.encrypt_chars(['h', 'e', 'l'], encrypter.encrypted[:date], encrypter.encrypted[:key])).to eq('ked')
    end

    it 'encrypts a message' do
      expected = {
        encryption: 'keder ohulw',
        key: '02715',
        date: '040895'
      }
      expect(encrypter.encryption('hello world', '02715', '040895')).to eq(expected)
    end

    it 'has encrypted data in @encrypted' do
      expected = {
        encryption: 'keder ohulw',
        key: '02715',
        date: '040895'
      }
      expect(encrypter.encrypted).to eq(expected)
    end
  end
end
