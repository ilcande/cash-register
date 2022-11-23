require 'json'

class Checkout
  def initialize(datastore = 'config/datastore.json')
    @datastore = datastore
    @cart = {}
    @catalogue = nil
    @discounts = nil
  end

  def scan(code)
    return unless catalogue.key?(code)

    @cart[code] ||= []
    @cart[code] << @catalogue[code]
  end

  def catalogue
    @catalogue ||= JSON.parse(File.read(@datastore))['products']
  end
end
