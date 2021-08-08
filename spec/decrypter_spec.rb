require './spec_helper'

RSpec.describe Decrypter do
  context 'initialization' do
    decrypter = Decrypter.new

    it 'exists' do
      expect(decrypter).to be_a(Decrypter)
    end
  end

  context 'keys and shifts' do
    decrypter = Decrypter.new
    decrypter.decryption('hello world', '02715', '040895')

    it 'makes array of date offsets' do
      expected = ['1', '0', '2', '5']
      expect(decrypter.date_offsets(decrypter.decrypted[:date])).to eq(expected)
    end

    it 'makes array of all keys' do
      expected = ["02", "27", "71", "15"]
      expect(decrypter.all_keys(decrypter.decrypted[:key])).to eq(expected)
    end

    it 'makes array of all shifts' do
      expected = [3, 27, 73, 20]
      expect(decrypter.all_shifts(decrypter.decrypted[:key], decrypter.decrypted[:date])).to eq(expected)
    end

    it 'makes a character set' do
      expected =
      ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
        "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(decrypter.character_set).to eq(expected)
    end
  end

  context 'decryption' do
    decrypter = Decrypter.new

    it 'can decrypt characters' do
      decrypter.decryption('keder ohulw', '02715', '040895')

      expect(decrypter.crypt_chars(['k', 'e', 'd'], decrypter.decrypted[:key], decrypter.decrypted[:date], :-)).to eq('hel')
    end

    it 'decrypts a message' do
      expected = {
        decryption: 'hello world',
        key: '02715',
        date: '040895'
      }
      expect(decrypter.decryption('keder ohulw', '02715', '040895')).to eq(expected)
    end

    it 'has decrypted data in @decrypted' do
      expected = {
        decryption: 'hello world',
        key: '02715',
        date: '040895'
      }
      expect(decrypter.decrypted).to eq(expected)
    end
  end
end
