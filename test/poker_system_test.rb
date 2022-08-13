# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/poker_system'

class PokerSystemTest < MiniTest::Test
  def test_load_cards
    poker_system = PokerSystem.new
    poker_system.load_cards

    assert_equal poker_system.cards.size, 52
  end

  def test_cards_istance
    poker_system = PokerSystem.new
    poker_system.load_cards

    assert_equal poker_system.cards[0].is_a?(Card), true
  end

  def test_shuffle_cards
    poker_system = PokerSystem.new
    poker_system.load_cards

    current_cards = poker_system.cards
    poker_system.shuffle_cards
    refute_equal(poker_system.cards, current_cards)
  end
end
