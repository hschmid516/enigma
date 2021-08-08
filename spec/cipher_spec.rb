require './spec_helper'

RSpec.describe Cipher do
  context 'initialization' do
    cipher = Cipher.new('hello world', '02715', '040895', :+)

    xit 'exists' do
      expect(cipher).to be_a(Cipher)
    end
  end

  # context 'keys and shifts' do
  #   encrypter = Encrypter.new
  #   encrypter.encryption('hello world', '02715', '040895')
  #
  #   xit 'makes array of date offsets' do
  #     expect(encrypter.date_offsets(encrypter.encrypted[:date])).to eq(['1', '0', '2', '5'])
  #   end
  #
  #   xit 'makes array of all keys' do
  #     expect(encrypter.all_keys(encrypter.encrypted[:key])).to eq(["02", "27", "71", "15"])
  #   end
  #
  #   xit 'makes array of all shifts' do
  #     expect(encrypter.all_shifts(encrypter.encrypted[:key], encrypter.encrypted[:date])).to eq([3, 27, 73, 20])
  #   end
  #
  #   xit 'makes a character set' do
  #     expected =
  #     ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
  #      "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
  #     expect(encrypter.character_set).to eq(expected)
  #   end
  # end

  context 'encryption' do
    cipher = Cipher.new('hello world', '02715', '040895', :+)

    xit 'can encrypt characters' do
      encrypter.encryption('hello world', '02715', '040895')

      expect(encrypter.crypt_chars(['h', 'e', 'l'], encrypter.encrypted[:key], encrypter.encrypted[:date], :+)).to eq('ked')
    end

    xit 'encrypts a message' do
      expected = {
        encryption: 'keder ohulw',
        key: '02715',
        date: '040895'
      }
      expect(encrypter.encryption('hello world', '02715', '040895')).to eq(expected)
    end

    xit 'has encrypted data in @encrypted' do
      expected = {
        encryption: 'keder ohulw',
        key: '02715',
        date: '040895'
      }
      expect(encrypter.encrypted).to eq(expected)
    end
  end
end
