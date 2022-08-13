# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/player'

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
end
