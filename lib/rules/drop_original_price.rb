# frozen_string_literal: true

require_relative './min_items_per_promo'

# class DropOriginalPrice < MinItemsPerPromo
class DropOriginalPrice < MinItemsPerPromo
  def apply_rule_to(items)
    return items.first['price'] unless applies_to(items)

    items.first['price'] * @value
  end
end
