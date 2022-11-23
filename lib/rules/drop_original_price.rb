require_relative './min_items_per_promo'

class DropOriginalPrice < MinItemsPerPromo
  def apply_rule_to(items)
    return items.first['price'] unless applies_to(items)

    new_price = items.first['price'] * @value
    new_price.round(2)
  end
end
