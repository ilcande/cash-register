require_relative '../../lib/rules/buy_x_get_y_free'

describe BuyXGetYFree do
  describe '#apply_rule_to' do
    let(:min_items_per_promo) { 2 }
    let(:value) { 1 }
    let(:rule) { BuyXGetYFree.new(min_items_per_promo, value) }
    let(:list) { [] }
    let(:price) { 3.11 }

    before(:each) do
      num_items.times do
        list << { 'name' => 'Keyring', 'price' => price }
      end
    end

    context 'num of items in checkout is lower than min_items_per_promo' do
      let(:num_items) { 1 }

      it { expect(rule.apply_rule_to(list)).to eq(price) }
    end

    context 'num of items in checkout is greater than min_items_per_promo' do
      let(:num_items) { 4 }

      it { expect(rule.apply_rule_to(list)).to eq(price / min_items_per_promo) }
    end

    context 'num of items in checkout is equal to min_items_per_promo' do
      let(:num_items) { 2 }

      it { expect(rule.apply_rule_to(list)).to eq(price / min_items_per_promo) }
    end
  end
end
