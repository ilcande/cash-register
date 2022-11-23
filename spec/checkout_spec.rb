# frozen_string_literal: true

require_relative '../lib/checkout'

describe Checkout do # rubocop:disable Metrics/BlockLength
  describe '#scan' do
    let(:checkout) { Checkout.new('./spec/fixtures/datastore.json') }
    let(:keyring) { [{ 'name' => 'Keyring', 'price' => 3.11 }] }

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

  describe '#total' do # rubocop:disable Metrics/BlockLength
    let(:checkout) { Checkout.new('./spec/fixtures/datastore.json') }

    context 'of %w(KR1 KR1)' do
      before do
        checkout.scan('KR1')
        checkout.scan('KR1')
      end

      it { expect(checkout.total).to eq(3.11) }
    end

    context 'of %w(MG1 MG1 KR1 MG1)' do
      before do
        checkout.scan('MG1')
        checkout.scan('MG1')
        checkout.scan('KR1')
        checkout.scan('MG1')
      end

      it { expect(checkout.total).to eq(16.61) }
    end

    context 'of %w(KR1 PT1 MG1 PT1 PT1)' do
      before do
        checkout.scan('KR1')
        checkout.scan('PT1')
        checkout.scan('MG1')
        checkout.scan('PT1')
        checkout.scan('PT1')
      end

      it { expect(checkout.total).to eq(30.57) }
    end
  end
end
