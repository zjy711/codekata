require 'pry'
require 'minitest/autorun'

class CheckOut
  REGULAR_PRICES = { 'A' => 50, 'B' => 30, 'C' => 20, 'D' => 15 }
  def initialize(rules)
    @rules = rules
    @items = {}
  end

  def scan(item)
    @items.has_key?(item) ? @items[item] += 1 : @items[item] = 1
  end

  def total
    @items.inject(0) { |total, item| total + price_of_item(*item) }
  end

  def price_of_item(item, quantity)
    return 0 unless @items.has_key? item
    return REGULAR_PRICES[item] * quantity unless @rules.has_key? item

    regular_price_total = REGULAR_PRICES[item] * (quantity % @rules[item][:number_of_items])
    special_price_total = @rules[item][:special_price] * ( quantity / @rules[item][:number_of_items])

    regular_price_total + special_price_total
  end
end

class TestPrice < Minitest::Test
  RULES = { 'A' => { number_of_items: 3, special_price: 130 },
            'B' => { number_of_items: 2, special_price: 45  }
          }

  def price(goods)
    co = CheckOut.new(RULES)
    goods.split(//).each { |item| co.scan(item) }
    co.total
  end

  def test_totals
    assert_equal(  0, price(""))
    assert_equal( 50, price("A"))
    assert_equal( 80, price("AB"))
    assert_equal(115, price("CDBA"))

    assert_equal(100, price("AA"))
    assert_equal(130, price("AAA"))
    assert_equal(180, price("AAAA"))
    assert_equal(230, price("AAAAA"))
    assert_equal(260, price("AAAAAA"))

    assert_equal(160, price("AAAB"))
    assert_equal(175, price("AAABB"))
    assert_equal(190, price("AAABBD"))
    assert_equal(190, price("DABABA"))
  end
end