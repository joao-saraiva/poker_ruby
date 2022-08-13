# frozen_string_literal: true

require 'byebug'
require 'card'
# This class represent the entire abstranction of a poker system
# it will deal with regular things like deal cards, and pick a winner.
class PokerSystem
  attr_accessor :cards, :players

  def initialize
    @cards = []
    @players = []
  end

  def load_cards
    Card::NAIPES.each do |naip|
      Card::VALUES.each do |value|
        cards.push(Card.new(naip, value))
      end
    end
  end

  def load_player(player)
    @players.push(player)
  end

  def shuffle_cards
    not_shufled_cards = cards
    self.cards = cards.shuffle while not_shufled_cards == cards
  end

  def deal_cards
    @players.each do |player|
      not_dealed_cards = @cards.reject(&:dealed?)
      player.receive_cards(not_dealed_cards[0..1])
    end
  end
end
