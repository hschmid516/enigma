require './lib/encrypter'

RSpec.describe Encrypter do
  it 'exists' do
    encrypter = Encrypter.new

    excped(encrypter).to be_a(Encrypter)
  end
end
