require './spec_helper'

RSpec.describe KeyShift do
  context 'initialization' do
    key_shift = KeyShift.new('02715', '040895')

    it 'exists' do
      expect(key_shift).to be_a(KeyShift)
    end

    it 'has attributes' do
      expect(key_shift.key).to eq('02715')
      expect(key_shift.date).to eq('040895')
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

    it 'makes array of keys with offsets' do
      expected = [["02", "1"], ["27", "0"], ["71", "2"], ["15", "5"]]
      expect(key_shift.keys_offsets).to eq(expected)
    end
  end
end
