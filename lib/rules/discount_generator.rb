# frozen_string_literal: true

require_relative './buy_x_get_y_free'
require_relative './bulk_purchase'
require_relative './drop_original_price'

# class DiscountGenerator
class DiscountGenerator
  def self.generate_promo_for(type, *args)
    case type
    when 'BuyXGetYFree'
      BuyXGetYFree.new(*args)
    when 'BulkPurchase'
      BulkPurchase.new(*args)
    when 'DropOriginalPrice'
      DropOriginalPrice.new(*args)
    end
  end
end
