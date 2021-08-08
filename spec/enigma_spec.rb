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

    it "uses today's date if none given" do
      allow(enigma).to receive(:make_date).and_return('080821')

      expected = {
        encryption: 'nefau qdxly',
        key: '02715',
        date: '080821'
      }
      expect(enigma.encrypt('hello world', '02715')).to eq(expected)
    end

    it "can generate a random key and use today's date if none given" do
      allow(enigma).to receive(:make_date).and_return('080821')
      allow(enigma).to receive(:random_key).and_return('74812')

      expected = {
        encryption: 'ezpylu aofh',
        key: '74812',
        date: '080821'
      }
      expect(enigma.encrypt('hello world')).to eq(expected)
    end

    it "is not case sensitive and other chars return as itself" do
      allow(enigma).to receive(:make_date).and_return('080821')

      expected = {
        encryption: 'nefau qdxly?!',
        key: '02715',
        date: '080821'
      }
      expect(enigma.encrypt('Hello World?!', '02715')).to eq(expected)
    end
  end

  context 'decryption' do
    enigma = Enigma.new

    it 'can decrypt a message' do
      expected = {
        decryption: 'hello world',
        key: '02715',
        date: '040895'
      }
      expect(enigma.decrypt('keder ohulw', '02715', '040895')).to eq(expected)
    end

    it "uses today's date if none given" do
      allow(enigma).to receive(:make_date).and_return('080821')

      expected = {
        decryption: 'hello world',
        key: '02715',
        date: '080821'
      }
      expect(enigma.decrypt('nefau qdxly', '02715')).to eq(expected)
    end

    it "can generate a random key and use today's date if none given" do
      allow(enigma).to receive(:make_date).and_return('080821')
      allow(enigma).to receive(:random_key).and_return('74812')

      expected = {
        decryption: 'hello world',
        key: '74812',
        date: '080821'
      }
      expect(enigma.decrypt('ezpylu aofh')).to eq(expected)
    end

    it "returns other chars as itself" do
      allow(enigma).to receive(:make_date).and_return('080821')

      expected = {
        decryption: 'hello world?!',
        key: '02715',
        date: '080821'
      }
      expect(enigma.decrypt('nefau qdxly?!', '02715')).to eq(expected)
    end
  end
end
