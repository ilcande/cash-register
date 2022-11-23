require_relative '../lib/checkout'

describe Checkout do
  describe "#scan" do
    let(:checkout) { Checkout.new('./spec/fixtures/datastore.json') }
    let(:keyring) {[{ 'name' => 'Keyring', 'price' => 3.00 }]}

    context 'empty code' do
      it { expect(checkout.scan('')).to be_nil }
    end

    context 'catalogue does not include an item' do
      it { expect(checkout.scan('FB1')).to be_nil }
    end

    context 'catalogue includes an item' do
      it { expect(checkout.scan('KR1')).to eq(keyring) }
    end
  end
end
