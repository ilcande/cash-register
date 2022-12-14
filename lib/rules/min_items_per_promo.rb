# frozen_string_literal: true

# class MinItemsPerPromo
class MinItemsPerPromo
  def initialize(min_items_per_promo, value)
    @min_items_per_promo = min_items_per_promo
    @value = value
  end

  def applies_to(items)
    items.size >= @min_items_per_promo
  end

  attr_reader :min_items_per_promo, :value
end
