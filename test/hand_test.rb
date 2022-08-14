# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/round'
require_relative '../lib/player'
require_relative '../lib/poker_system'
require_relative '../lib/table_card'
require_relative '../lib/hand'

# This class is a test for hand methods
class HandTest < MiniTest::Test
  def player_with_round
    player = Player.new(50)
    round = Round.new(PokerSystem.new)
    round.table_cards = TableCard.new
    player.enter_round(round)
    player
  end

  def test_player_has_pair?
    player = player_with_round
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '2')])

    hand = Hand.new(player)
    assert_equal(hand.pair_hand?, true)
  end

  def test_player_has_pair_false
    player = player_with_round
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.pair_hand?, false)
  end

  def test_player_has_pair_with_table_cards
    player = player_with_round
    %w[2 4 5].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2660", value))
    end
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.pair_hand?, true)
  end

  def test_player_has_pair_with_table_cards_false
    player = player_with_round
    %w[6 7 5].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2660", value))
    end
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.pair_hand?, false)
  end

  def test_two_pair_hand
    player = player_with_round
    %w[2 3 5].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2660", value))
    end
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.two_pair_hand?, true)
  end

  def test_two_pair_hand_false
    player = player_with_round
    %w[2 4 5].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2660", value))
    end
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.two_pair_hand?, false)
  end

  def test_three_of_kind_hand
    player = player_with_round
    %w[2 2 5].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2660", value))
    end
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.three_of_kind_hand?, true)
  end

  def test_three_of_kind_hand_false
    player = player_with_round
    %w[2 3 5].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2660", value))
    end
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.three_of_kind_hand?, false)
  end

  def test_straight_hand
    player = player_with_round
    %w[2 3 5].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2660", value))
    end
    player.receive_cards([Card.new("\u2660", '4'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.straight_hand?, true)
  end

  def test_straight_hand_false
    player = player_with_round
    %w[2 3 5].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2660", value))
    end
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.straight_hand?, false)
  end

  def test_flush_hand
    player = player_with_round
    %w[2 3 5].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2660", value))
    end
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.flush_hand?, true)
  end

  def test_flush_hand_false
    player = player_with_round
    %w[2 3 5].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2665", value))
    end
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.flush_hand?, false)
  end

  def test_full_house_hand
    player = player_with_round
    %w[2 2 3].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2665", value))
    end
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.full_house_hand?, true)
  end

  def test_full_house_hand_false
    player = player_with_round
    %w[2 4 3].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2665", value))
    end
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.full_house_hand?, false)
  end

  def test_four_of_kind_hand
    player = player_with_round
    %w[2 2 2].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2665", value))
    end
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.four_of_kind_hand?, true)
  end

  def test_four_of_kind_hand_false
    player = player_with_round
    %w[2 2 3].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2665", value))
    end
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.four_of_kind_hand?, false)
  end

  def test_straight_flush_hand
    player = player_with_round
    %w[4 5 6].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2660", value))
    end
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.straight_flush_hand?, true)
  end

  def test_straight_flush_hand_false
    player = player_with_round
    %w[4 5 6].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2665", value))
    end
    player.receive_cards([Card.new("\u2660", '2'), Card.new("\u2660", '3')])

    hand = Hand.new(player)
    assert_equal(hand.straight_flush_hand?, false)
  end

  def test_royal_flush_hand
    player = player_with_round
    %w[A J Q].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2660", value))
    end
    player.receive_cards([Card.new("\u2660", 'K'), Card.new("\u2660", '10')])

    hand = Hand.new(player)
    assert_equal(hand.straight_flush_hand?, true)
  end

  def test_royal_flush_hand_false
    player = player_with_round
    %w[A J Q].each do |value|
      player.round.table_cards.cards.push(Card.new("\u2665", value))
    end
    player.receive_cards([Card.new("\u2660", 'K'), Card.new("\u2660", '10')])

    hand = Hand.new(player)
    assert_equal(hand.straight_flush_hand?, false)
  end
end
