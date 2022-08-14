# frozen_string_literal: true

require 'byebug'
require_relative 'errors/gem_amount_error'
require_relative 'errors/player_error'

# This class represent the abstractions of a player, its the mother class of
# enemy class and user_player
class Player
  attr_accessor :gems, :turn, :wins, :cards, :folded, :blind, :big_blind,
                :round, :betting_now

  def initialize(gems = 0)
    raise GemAmountError, 'you cant start without gems' if gems.to_f <= 0

    @wins = 0
    @turn = false
    @gems = gems
    @cards = []
    @blind = false
    @big_blind = false
    @betting_now = false
  end

  def bet(gems)
    raise GemAmountError, 'cant bet more than you have' if gems.to_f > @gems

    @gems -= gems
  end

  alias raise_bet bet

  def fold
    raise PlayerError, 'already folded' if folded?
    raise PlayerError, 'cant fold without a round' if @round.nil?

    @folded = true
  end

  def set_blind
    @blind = true
  end

  def set_big_blind
    @big_blind = true
  end

  def receive_cards(cards)
    @cards = cards
    cards.each(&:deal)
  end

  def folded?
    @folded
  end

  def blind?
    @blind
  end

  def big_blind?
    @big_blind
  end

  def betting_now?
    @betting_now
  end

  def enter_round(round)
    @round = round
  end

  def hand
    return @cards + @round.table_cards.cards unless @round.nil?

    @cards
  end

  def equal_hand_values(card)
    hand.select { |hand_card| hand_card.value.eql?(card.value) }
  end

  def two_pair_hand?
    pair_card1 = equal_hand_values(@cards[0])
    pair_card2 = equal_hand_values(@cards[1])
    pair_card1.size >= 2 && pair_card2.size >= 2
  end

  def pair_hand?
    pair_card1 = equal_hand_values(@cards[0])
    pair_card2 = equal_hand_values(@cards[1])
    pair_card1.size >= 2 || pair_card2.size >= 2
  end

  def high_card
    @cards.map(&:formated_value).max
  end
end
