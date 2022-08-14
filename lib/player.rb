# frozen_string_literal: true

require 'byebug'
require_relative 'errors/gem_amount_error'

# This class represent the abstractions of a player, its the mother class of
# enemy class and user_player
class Player
  attr_accessor :gems, :turn, :wins, :cards, :folded, :blind, :big_blind

  def initialize(gems = 0)
    raise GemAmountError, 'you cant start without gems' if gems.to_f <= 0

    @wins = 0
    @turn = false
    @gems = gems
    @cards = []
    @blind = false
    @big_blind = false
  end

  def bet(gems)
    raise GemAmountError, 'cant bet more than you have' if gems.to_f > @gems

    @gems -= gems
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
end
