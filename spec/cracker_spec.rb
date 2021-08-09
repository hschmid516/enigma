require './spec_helper'

RSpec.describe Cracker do
  context 'initialization' do
    cracker = Cracker.new('vjqtbeaweqihssi', '291018', :-)

    it 'exists' do
      expect(cracker).to be_a(Cracker)
    end

    it 'has attributes' do
      expect(cracker.keys).to eq(('00000'..'99999').to_a)
      expect(cracker.date).to eq('291018')
      expect(cracker.message).to eq('vjqtbeaweqihssi')
      expect(cracker.shifts).to be_a(KeyShift)
      expect(cracker.plus_minus).to eq(:-)
    end
  end

  context 'cracking' do
    before(:each) do
      @cracker = Cracker.new('vjqtbeaweqihssi', '291018', :-)
    end

    it 'can find the correct key' do
      expect(@cracker.find_key).to eq('08304')
    end

    it 'iterates through keys to test' do
      expect(@cracker.try_key('291018').key).to eq('00000')
      expect(@cracker.try_key('291018').key).to eq('00001')
      expect(@cracker.try_key('291018').key).to eq('00002')
    end

    it 'checks if keys are correct' do
      @cracker.find_key

      expect(@cracker.cracked?).to be true
    end

    it 'can crack the last four rotated characters' do
      @cracker.find_key

      expect(@cracker.crack_last_four).to eq('end ')
    end

    it "can rotate ' end'" do
      expect(@cracker.end_rotated).to eq('end ')
    end

    it 'rotates last four of message' do
      expect(@cracker.last_four).to eq('ssih')
    end

    it 'finds position of keys in message' do
      expect(@cracker.rotation).to eq(-3)
    end
  end
end
