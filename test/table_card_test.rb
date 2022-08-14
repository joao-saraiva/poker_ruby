# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/table_card'
require_relative '../lib/card'
# test for table card
class TableCardTest < MiniTest::Test
  def test_clear_table
    table_card = TableCard.new
    table_card.clear_table
    assert_equal(table_card.cards, [])
  end

  def test_clear_table_with_cards
    table_card = TableCard.new
    table_card.cards.push(Card.new('1', "\u3245"))

    table_card.clear_table
    assert_equal(table_card.cards, [])
  end
end
