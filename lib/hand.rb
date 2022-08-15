# frozen_string_literal: true

require 'byebug'
# This represent the entire hand of the player, by here you can determine the
# player hands power.
class Hand
  attr_accessor :player, :cards

  def initialize(player)
    player.hand = self
    @player = player
    @cards = player.cards
  end

  def hand
    return @cards + @player.round.table_cards.cards unless @player.round.nil?

    @cards
  end

  def hand_power
    return 100 if royal_flush_hand?
    return 90 if straight_flush_hand?
    return 80 if four_of_kind_hand?
    return 70 if full_house_hand?
    return 60 if flush_hand?
    return 50 if straight_hand?
    return 40 if three_of_kind_hand?
    return 30 if two_pair_hand?
    return 20 if pair_hand?

    high_card
  end

  def equal_hand_values(card)
    hand.select { |hand_card| hand_card.value.eql?(card.value) }
  end

  def equal_naip_values(card)
    hand.select { |hand_card| hand_card.naip.eql?(card.naip) }
  end

  def matched_cards1
    equal_hand_values(@cards[0])
  end

  def matched_cards2
    equal_hand_values(@cards[1])
  end

  def straight_cards
    cards_values = hand.map(&:formated_value)
    (cards_values.min..cards_values.max).to_a
  end

  def royal_flush_hand?
    return false unless straight_flush_hand?

    royal_sequency = [10, 11, 12, 13, 14]
    (straight_cards - royal_sequency).empty?
  end

  def straight_flush_hand?
    flush_hand? && straight_hand?
  end

  def four_of_kind_hand?
    matched_cards1.size.eql?(4) || matched_cards2.size.eql?(4)
  end

  def full_house_hand?
    pair_hand? && three_of_kind_hand?
  end

  def flush_hand?
    equal_naip_values(@cards[0]).size >= 5 ||
      equal_naip_values(@cards[1]).size >= 5
  end

  def straight_hand?
    cards_values = hand.map(&:formated_value)
    cards_until = (cards_values.min..cards_values.max).to_a

    (cards_until - cards_values).empty?
  end

  def three_of_kind_hand?
    matched_cards1.size >= 3 || matched_cards2.size >= 3
  end

  def two_pair_hand?
    matched_cards1.size >= 2 && matched_cards2.size >= 2
  end

  def pair_hand?
    matched_cards1.size >= 2 || matched_cards2.size >= 2
  end

  def high_card
    @cards.map(&:formated_value).max
  end
end
