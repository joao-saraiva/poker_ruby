#  frozen_string_literal: true

require_relative '../lib/round'
require_relative '../lib/poker_system'
require_relative '../lib/player'
require 'minitest/autorun'

# Tests for class Round
class RoundTest < MiniTest::Test
  def round_with_two_players
    poker_system = PokerSystem.new
    player1 = Player.new(50)
    player2 = Player.new(50)
    poker_system.load_player(player1)
    poker_system.load_player(player2)
    round = Round.new(poker_system)
    player1.enter_round(round)
    player2.enter_round(round)
    round
  end

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

  def test_player_on_round
    round = round_with_two_players
    player1 = round.poker_system.players[0]
    player2 = round.poker_system.players[1]

    player2.fold
    assert_equal(round.players_on_round.include?(player1), true)
    assert_equal(round.players_on_round.include?(player2), false)
  end

  def test_final_round
    poker_system = PokerSystem.new
    round = Round.new(poker_system)
    round.number = 3

    assert_equal(round.final_round?, true)
  end

  def test_final_round_false
    poker_system = PokerSystem.new
    round = Round.new(poker_system)
    round.number = 1

    assert_equal(round.final_round?, false)
  end
end
