# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/poker_system'
require_relative '../lib/player'

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

  def test_load_player
    poker_system = PokerSystem.new
    player = Player.new(50)

    poker_system.load_player(player)
    assert_equal poker_system.players[0], player
  end

  def test_deal_cards
    poker_system = PokerSystem.new
    poker_system.load_cards
    player = Player.new(50)

    poker_system.load_player(player)
    poker_system.deal_cards
    assert_equal player.cards.size, 2
  end

  def test_deal_cards_multiple_players
    poker_system = PokerSystem.new
    poker_system.load_cards
    poker_system.load_player(Player.new(50)) while poker_system.players.size < 2

    poker_system.deal_cards
    cards_player = poker_system.players[0].cards
    cards_player2 = poker_system.players[1].cards
    refute_equal(cards_player, cards_player2)
  end

  def test_flip_cards_round1
    poker_system = PokerSystem.new
    poker_system.load_cards

    assert_equal(poker_system.flip_cards, '[♠ | 2], [♠ | 3], [♠ | 4]')
  end

  def test_flip_cards_round2
    poker_system = PokerSystem.new
    poker_system.load_cards
    poker_system.round = 2

    assert_equal(poker_system.flip_cards, '[♠ | 2]')
  end
end
