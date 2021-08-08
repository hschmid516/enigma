require 'spec_helper'

RSpec.describe Enigma do
  context 'initialization' do
    enigma = Enigma.new

    it 'exists' do
      expect(enigma).to be_a(Enigma)
    end
  end

  context 'encryption' do
    enigma = Enigma.new

    it 'can encrypt a message' do
      expected = {
        encryption: 'keder ohulw',
        key: '02715',
        date: '040895'
      }
      expect(enigma.encrypt('hello world', '02715', '040895')).to eq(expected)
    end

    # Today's date works for this August, use mock so test always passes
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
      expect(enigma.encrypt('hello world')[:date]).to eq(Date.today.strftime('%d%m%y'))
    end
  end

  context 'decryption' do
    enigma = Enigma.new

    # Today's date works for this August, use mock so test always passes
    it "uses today's date if none given" do
      expected = {
        decryption: 'hello world',
        key: '02715',
        date: Date.today.strftime('%d%m%y')
      }
      expect(enigma.decrypt('nefau qdxly', '02715')).to eq(expected)
    end
  end
end
