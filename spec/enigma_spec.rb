require './lib/enigma'
require './spec_helper'
require 'date'

RSpec.describe Enigma do
  context 'initialization and encrypt method' do
    enigma = Enigma.new

    it 'exists' do
      expect(enigma).to be_a(Enigma)
    end

    it 'has an encrypt method' do
      expected = {
        encryption: 'hello world',
        key: '02715',
        date: '040895'
      }
      expect(enigma.encrypt('hello world', '02715', '040895')).to eq(expected)
    end

    it "uses today's date if none given" do
      expected = {
        encryption: 'hello world',
        key: '02715',
        date: '050821'
      }
      expect(enigma.encrypt('hello world', '02715')).to eq(expected)
    end

    it "can generate a random key and use today's date if none given" do
      expect(enigma.encrypt('hello world')[:key]).to be_a(String)
      expect(enigma.encrypt('hello world')[:key].length).to eq(5)
    end
  end

  context 'keys and shifts' do
    enigma = Enigma.new
    enigma.encrypt('hello world', '02715', '040895')

    it 'creates attributes for message, key, and date' do
      expect(enigma.message).to eq('hello world')
      expect(enigma.key).to eq('02715')
      expect(enigma.date).to eq('040895')
    end

    it "has A, B, C, and D keys" do
      expect(enigma.a_key).to eq('02')
      expect(enigma.b_key).to eq('27')
      expect(enigma.c_key).to eq('71')
      expect(enigma.d_key).to eq('15')
    end

    it 'takes last four digits from date squared' do
      expect(enigma.offsets_from_date).to eq('1025')
    end

    it 'creates offsets' do
      expect(enigma.a_offset).to eq(1)
      expect(enigma.b_offset).to eq(0)
      expect(enigma.c_offset).to eq(2)
      expect(enigma.d_offset).to eq(5)
    end

    it 'creates final shifts' do
      expect(enigma.a_shift).to eq(3)
      expect(enigma.b_shift).to eq(27)
      expect(enigma.c_shift).to eq(73)
      expect(enigma.d_shift).to eq(20)
    end

    it 'creates a character set' do
      expected =
      ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
       "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(enigma.character_set).to eq(expected)
    end
  end

  context 'encryption' do
    enigma = Enigma.new
    enigma.encrypt('hello world', '02715', '040895')

    it 'can encrypt message' do
      expect(enigma.shift_letters('hello world')).to eq('keder ohulw')
    end
  end
end
