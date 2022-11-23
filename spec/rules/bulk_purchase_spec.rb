require_relative '../../lib/rules/bulk_purchase'

describe BulkPurchase do
  describe '#apply_rule_to' do
    let(:min_items_per_promo) { 3 }
    let(:value) { 4.5 }
    let(:rule) { BulkPurchase.new(min_items_per_promo, value) }
    let(:list) { [] }
    let(:price) { 5.0 }

    before do
      num_items.times do
        list << { 'name' => 'Mug', 'price' => price }
      end
    end

    context 'num of items in checkout is equal to min_items_per_promo' do
      let(:num_items) { 3 }

      it { expect(rule.apply_rule_to(list)).to eq(value) }
    end
  end
end
