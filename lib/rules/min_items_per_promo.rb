class MinItemsPerPromo
  def initialize(min_items_per_promo, value)
    @min_items_per_promo = min_items_per_promo
    @value = value
  end

  def applies_to(items)
    items.size >= @min_items_per_promo
  end

  attr_reader :value
end
