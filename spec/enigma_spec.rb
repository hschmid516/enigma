require './spec_helper'
require './lib/enigma'
require 'date'

RSpec.describe Enigma do
  context 'initialization' do
    enigma = Enigma.new

    it 'exists' do
      expect(enigma).to be_a(Enigma)
    end

    it 'starts with no data' do
      expect(enigma.data).to eq({})
    end
  end

  context 'keys and shifts' do
    enigma = Enigma.new
    enigma.encrypt('hello world', '02715', '040895')

    it 'creates data hash including key and date' do
      expect(enigma.data[:key]).to eq('02715')
      expect(enigma.data[:date]).to eq('040895')
    end

    it 'makes array of date offsets' do
      expect(enigma.date_offsets).to eq(['1', '0', '2', '5'])
    end

    it 'makes array of all keys' do
      expect(enigma.all_keys).to eq(["02", "27", "71", "15"])
    end

    it 'makes array of all shifts' do
      expect(enigma.all_shifts).to eq([3, 27, 73, 20])
    end

    it 'makes a character set' do
      expected =
      ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
       "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
      expect(enigma.character_set).to eq(expected)
    end
  end

  context 'encryption' do
    enigma = Enigma.new

    it 'can encrypt characters' do
      enigma.encrypt('hello world', '02715', '040895')

      expect(enigma.new_letters(['h', 'e', 'l'])).to eq('ked')
    end

    it 'can encrypt message' do
      enigma.encrypt('hello world', '02715', '040895')

      expect(enigma.encrypt_text('hello world')).to eq('keder ohulw')
    end

    it 'can return encrypted message with encrypt' do
      expected = {
        encryption: 'keder ohulw',
        key: '02715',
        date: '040895'
      }
      expect(enigma.encrypt('hello world', '02715', '040895')).to eq(expected)
    end

    it 'has encrypt data in @data' do
      enigma.encrypt('hello world', '02715', '040895')

      expected = {
        encryption: 'keder ohulw',
        key: '02715',
        date: '040895'
      }
      expect(enigma.data).to eq(expected)
    end

    it "uses today's date if none given" do
      expected = {
        encryption: 'nefau qdxly',
        key: '02715',
        date: Date.today.strftime('%d%m%y')
      }
      expect(enigma.encrypt('hello world', '02715')).to eq(expected)
    end

    it "can generate a random key and use today's date if none given" do
      expect(enigma.encrypt('hello world')[:key]).to be_a(String)
      expect(enigma.encrypt('hello world')[:key].length).to eq(5)
      expect(enigma.data[:date]).to eq(Date.today.strftime('%d%m%y'))
    end
  end
end
