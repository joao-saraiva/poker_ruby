# frozen_string_literal: true

require 'byebug'
require_relative 'errors/card_error'
# This class represent a abstracion of a card of a poker game
class Card
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  NAIPES = ["\u2660", "\u2665", "\u2666", "\u2663"].freeze

  attr_accessor :value, :naip, :dealed

  def initialize(naip, value)
    @naip = naip
    @value = value
  end

  def deal
    raise CardError, 'already dealed' if dealed?

    @dealed = true
  end

  def dealed?
    @dealed
  end

  def formated_print
    "[#{@naip} | #{@value}]"
  end

  def formated_value
    VALUES.find_index(@value) + 2
  end
end
