# frozen_string_literal: true

require 'json'
require_relative './rules/discount_generator'

# class Checkout
class Checkout
  def initialize(datastore = 'config/datastore.json')
    @datastore = datastore
    @cart = {}
    @catalogue = nil
  end

  def scan(code)
    return unless catalogue.key?(code)

    @cart[code] ||= []
    @cart[code] << @catalogue[code]
  end

  def total
    return 0 if @cart.empty?

    total_price = 0
    @cart.each do |code, list|
      total_price += price_per_item(code, list) * list.length
    end

    total_price.round(2)
  end

  private

  def price_per_item(code, list)
    return list.first['price'] unless discounts.key?(code)

    discounts[code].each do |_type, rule|
      return rule.apply_rule_to(list) if rule.applies_to(list)
    end

    list.first['price']
  end

  def discounts
    return @discounts unless @discounts.nil?

    @discounts ||= JSON.parse(File.read(@datastore))['discounts']

    @discounts.each do |code, klass|
      klass.each do |type, rule|
        @discounts[code][type] = DiscountGenerator.generate_promo_for(type, rule['min_items_per_promo'], rule['value'])
      end
    end

    @discounts
  end

  def catalogue
    @catalogue ||= JSON.parse(File.read(@datastore))['products']
  end
end
