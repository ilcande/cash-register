require_relative './checkout'

ch_one = Checkout.new
ch_one.scan('GR1')
ch_one.scan('GR1')

puts ch_one.total

ch_two = Checkout.new
ch_two.scan('SR1')
ch_two.scan('SR1')
ch_two.scan('GR1')
ch_two.scan('SR1')

puts ch_two.total

ch_three = Checkout.new
ch_three.scan('GR1')
ch_three.scan('CF1')
ch_three.scan('SR1')
ch_three.scan('CF1')
ch_three.scan('CF1')

puts ch_three.total
