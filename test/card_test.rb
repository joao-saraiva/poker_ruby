# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/card'
# This class implements test for card
class CardTest < MiniTest::Test
  def test_card_values
    assert_equal Card::VALUES, %w[2 3 4 5 6 7 8 9 10 J Q K A]
  end

  def test_naipe_values
    assert_equal Card::NAIPES, ["\u2660", "\u2665", "\u2666", "\u2663"]
  end

  def test_deal
    assert_equal Card.new("\u2660", '2').deal, true
  end

  def test_deal_when_already_dealed
    card = Card.new("\u2660", '2')
    card.deal

    assert_raises(CardError, 'already dealed') { card.deal }
  end
end
