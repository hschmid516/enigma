require './spec_helper'

RSpec.describe Cipher do
  context 'initialization' do
    cipher = Cipher.new('hello world', '02715', '040895', :+)

    it 'exists' do
      expect(cipher).to be_a(Cipher)
    end

    it 'has attributes' do
      expect(cipher.message).to eq('hello world')
      expect(cipher.shifts).to be_a(KeyShift)
      expect(cipher.plus_minus).to eq(:+)
    end
  end

  context 'encryption' do
    cipher = Cipher.new('hello world', '02715', '040895', :+)

    it 'can encrypt characters' do
      expect(cipher.cipher_chars(['h', 'e', 'l', 'l'])).to eq('kede')
    end

    it 'encrypts a message' do
      expect(cipher.cipher_text).to eq('keder ohulw')
    end

    it 'rotates chars' do
      expected = ["k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
        "w", "x", "y", "z", " ", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
      expect(cipher.rotate_characters(3, 'h')).to eq(expected)
    end

    it 'creates arrays of characters with shifts' do
      expected = [["h", 3], ["e", 27], ["l", 73], ["l", 20]]
      expect(cipher.chars_shifts(['h', 'e', 'l', 'l'])).to eq(expected)
    end

    it 'makes a character set' do
      expected =
      ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n",
        "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(cipher.character_set).to eq(expected)
    end
  end

  context 'decryption' do
    cipher = Cipher.new('keder ohulw', '02715', '040895', :-)

    it 'can decrypt characters' do
      expect(cipher.cipher_chars(['k', 'e', 'd', 'e'])).to eq('hell')
    end

    it 'decrypts a message' do
      expect(cipher.cipher_text).to eq('hello world')
    end

    it 'rotates chars backwards' do
      expected = ["e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p",
        "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b", "c", "d"]
      expect(cipher.rotate_characters(3, 'h')).to eq(expected)
    end

    it 'creates arrays of characters with shifts' do
      expected = [["k", 3], ["e", 27], ["d", 73], ["e", 20]]
      expect(cipher.chars_shifts(['k', 'e', 'd', 'e'])).to eq(expected)
    end
  end
end
