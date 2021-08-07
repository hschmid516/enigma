require './lib/decrypter'

RSpec.describe Decrypter do
  it 'exists' do
    decrypter = Decrypter.new

    excped(decrypter).to be_a(Decrypter)
  end
end
