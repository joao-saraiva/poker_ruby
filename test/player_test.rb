# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/player'
require_relative '../lib/card'

# This class Works of abstractions of poker player, its the mother class for
# enemies and user.
class PlayerTest < MiniTest::Test
  def test_initialize_with_invalid_gems
    assert_raises(GemAmountError, 'you cant start without gems') { Player.new }
  end

  def test_initialize_with_negative_gems
    assert_raises(GemAmountError, 'you cant start without gems') { Player.new(-1) }
  end

  def test_bet
    player = Player.new(50)
    assert_equal(player.bet(50), 0)
  end

  def test_bet_invalid_amount
    player = Player.new(50)
    assert_raises(GemAmountError, 'cant bet more than you have') { player.bet(51) }
  end

  def test_receive_cards
    player = Player.new(50)
    card = Card.new('2', "\u2660")
    card2 = Card.new('3', "\u2660")

    player.receive_cards([card, card2])
    assert_equal(player.cards.size, 2)
  end

  def test_receive_cards_should_mark_dealed
    player = Player.new(50)
    card = Card.new('2', "\u2660")
    card2 = Card.new('3', "\u2660")

    player.receive_cards([card, card2])
    dealed_cards = player.cards.select(&:dealed?).size
    assert_equal(dealed_cards, 2)
  end
end
