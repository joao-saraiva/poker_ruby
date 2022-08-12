# frozen_string_literal: true

require 'card'
# This class represent the entire abstranction of a poker system
# it will deal with regular things like deal cards, and pick a winner.
class PokerSystem
  attr_accessor :cards

  def initialize
    self.cards = []
  end

  def load_cards
    Card::NAIPES.each do |naip|
      Card::VALUES.each do |value|
        cards.push(Card.new(naip, value))
      end
    end
  end
end
