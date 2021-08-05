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

  it "uses today's date if none given" do
    expected = {
      encryption: 'hello world',
      key: '02715',
      date: '050821'
    }
    expect(@enigma.encrypt('hello world', '02715')).to eq(expected)
  end

  it "can generate a random key and use today's date if none given" do
    expect(@enigma.encrypt('hello world')[:key]).to be_a(String)
    expect(@enigma.encrypt('hello world')[:key].length).to eq(5)
  end
end
