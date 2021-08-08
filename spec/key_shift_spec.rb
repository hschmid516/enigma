require './spec_helper'

RSpec.describe KeyShift do
  context 'initialization' do
    key_shift = KeyShift.new('02715', '040895')

    it 'exists' do
      expect(key_shift).to be_a(KeyShift)
    end
  end

  context 'keys and shifts' do
    key_shift = KeyShift.new('02715', '040895')

    it 'makes array of date offsets' do
      expect(key_shift.date_offsets).to eq(['1', '0', '2', '5'])
    end

    it 'makes array of all keys' do
      expect(key_shift.all_keys).to eq(["02", "27", "71", "15"])
    end

    it 'makes array of all shifts' do
      expect(key_shift.all_shifts).to eq([3, 27, 73, 20])
    end

    it 'makes a character set' do
      expected =
      ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
        "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(key_shift.character_set).to eq(expected)
    end
  end

  # context 'decryption' do
  #   decrypter = Decrypter.new
  #
  #   it 'can decrypt characters' do
  #     decrypter.decryption('keder ohulw', '02715', '040895')
  #
  #     expect(decrypter.crypt_chars(['k', 'e', 'd'], decrypter.decrypted[:key], decrypter.decrypted[:date], :-)).to eq('hel')
  #   end
  #
  #   it 'decrypts a message' do
  #     expected = {
  #       decryption: 'hello world',
  #       key: '02715',
  #       date: '040895'
  #     }
  #     expect(decrypter.decryption('keder ohulw', '02715', '040895')).to eq(expected)
  #   end
  #
  #   it 'has decrypted data in @decrypted' do
  #     expected = {
  #       decryption: 'hello world',
  #       key: '02715',
  #       date: '040895'
  #     }
  #     expect(decrypter.decrypted).to eq(expected)
  #   end
  # end
end
