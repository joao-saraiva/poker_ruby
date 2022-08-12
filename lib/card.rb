# frozen_string_literal: true

# This class represent a abstracion of a card of a poker game
class Card
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  NAIPES = ["\u2660", "\u2665", "\u2666", "\u2663"].freeze

  attr_writer :value, :naip

  def initialize(naip, value)
    self.naip = naip
    self.value = value
  end
end
