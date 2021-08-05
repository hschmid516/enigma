require './lib/enigma'
require './spec_helper'
require 'date'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  it 'exists' do
    expect(@enigma).to be_a(Enigma)
  end

  it 'has an encrypt method' do
    expected = {
      encryption: 'hello world',
      key: '02715',
      date: '040895'
    }
    expect(@enigma.encrypt('hello world', '02715', '040895')).to eq(expected)
  end
end
