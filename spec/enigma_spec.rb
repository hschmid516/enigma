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

  it 'creates attributes for message, key, and date' do
    @enigma.encrypt('hello world', '02715', '040895')

    expect(@enigma.message).to eq('hello world')
    expect(@enigma.key).to eq('02715')
    expect(@enigma.date).to eq('040895')
  end

  it "has A, B, C, and D keys" do
    @enigma.encrypt('hello world', '02715', '040895')

    expect(@enigma.a_key).to eq('02')
    expect(@enigma.b_key).to eq('27')
    expect(@enigma.c_key).to eq('71')
    expect(@enigma.d_key).to eq('15')
  end

  it 'takes last four digits from date squared' do
    @enigma.encrypt('hello world', '02715', '040895')

    expect(@enigma.offsets_from_date).to eq('1025')
  end

  it 'creates offsets' do
    @enigma.encrypt('hello world', '02715', '040895')

    expect(@enigma.a_offset).to eq(1)
    expect(@enigma.b_offset).to eq(0)
    expect(@enigma.c_offset).to eq(2)
    expect(@enigma.d_offset).to eq(5)
  end

  it 'creates a character set' do
    expected =
    ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
     "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    expect(@enigma.character_set).to eq(expected)
  end
end
