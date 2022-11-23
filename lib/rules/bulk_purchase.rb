# frozen_string_literal: true

require_relative './min_items_per_promo'

# class BuyXGetYFree < MinItemsPerPromo
class BulkPurchase < MinItemsPerPromo
  def apply_rule_to(_items)
    value
  end
end
