require_relative './min_items_per_promo'

class BulkPurchase < MinItemsPerPromo
  def apply_rule_to(_items)
    value
  end
end
