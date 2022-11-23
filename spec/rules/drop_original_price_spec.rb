# frozen_string_literal: true

require_relative '../../lib/rules/drop_original_price'

describe DropOriginalPrice do
  describe '#apply_rule_to' do
    let(:min_items_per_promo) { 3 }
    let(:value) { 0.66666666666 }
    let(:rule) { DropOriginalPrice.new(min_items_per_promo, value) }
    let(:list) { [] }
    let(:price) { 11.23 }
    let(:new_price) { price * value }

    before(:each) do
      num_items.times do
        list << { 'name' => 'Poster', 'price' => price }
      end
    end

    context 'num of items in checkout is lower than min_items_per_promo' do
      let(:num_items) { 1 }

      it { expect(rule.apply_rule_to(list)).to eq(price) }
    end

    context 'num of items in checkout is greater than min_items_per_promo' do
      let(:num_items) { 4 }

      it { expect(rule.apply_rule_to(list)).to eq(new_price) }
    end

    context 'num of items in checkout is equal to min_items_per_promo' do
      let(:num_items) { 3 }

      it { expect(rule.apply_rule_to(list)).to eq(new_price) }
    end
  end
end
