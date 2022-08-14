#  frozen_string_literal: true

require_relative '../lib/round'
require_relative '../lib/poker_system'
require 'minitest/autorun'

# Tests for class Round
class RoundTest < MiniTest::Test
  def test_open_bets
    poker_system = PokerSystem.new
    assert_equal(Round.new(poker_system).open_beats, true)
  end

  def test_opens_bets_already_open
    poker_system = PokerSystem.new
    round = Round.new(poker_system)
    round.open_beats

    assert_raises(RoundError, 'beats are already open') { round.open_beats }
  end
end
