# frozen_string_literal: true

require 'byebug'
require_relative 'errors/gem_amount_error'

# This class represent the abstractions of a player, its the mother class of
# enemy class and user_player
class Player
  attr_accessor :gems, :turn, :wins

  def initialize(gems = 0)
    raise GemAmountError, 'you cant start without gems' if gems.to_f <= 0

    @wins = 0
    @turn = false
    @gems = gems
  end

  def bet(gems)
    raise GemAmountError, 'cant bet more than you have' if gems.to_f > @gems

    @gems -= gems
  end
end
