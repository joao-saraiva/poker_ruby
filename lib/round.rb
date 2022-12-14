# frozen_string_literal: true

require 'byebug'
require 'errors/round_error'
# This class represente the absstractions of a poker round, by this class you
# should be able to manipulate it.
class Round
  attr_accessor :open, :number, :poker_system, :table_cards

  def initialize(poker_system)
    @open = false
    @number = 1
    @poker_system = poker_system
  end

  def open_beats
    raise RoundError, 'beats are already open' if open?

    @open = true
  end

  def open?
    @open
  end

  def players_on_round
    @poker_system.players.reject(&:folded?)
  end

  def final_round?
    @number.eql?(3)
  end

  def define_winner
    players_on_round.max_by { |player| player.hand.hand_power }
  end
end
