# frozen_string_literal: true

require 'byebug'
require_relative 'card'
# This class represent the entire abstranction of a poker system
# it will deal with regular things like deal cards, and pick a winner.
class PokerSystem
  attr_accessor :cards, :players, :round

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
    @cards = cards.shuffle while not_shufled_cards == cards
  end

  def deal_cards
    @players.each do |player|
      player.receive_cards(not_dealed_cards[0..1])
    end
  end

  def not_dealed_cards
    @cards.reject(&:dealed?)
  end

  def flip_cards
    to_flip_cards = @round.eql?(1) ? not_dealed_cards[0..2] : [not_dealed_cards[0]]
    to_flip_cards.each(&:deal)
    round.table_cards.cards += to_flip_cards
    to_flip_cards.map(&:formated_print).join(', ')
  end

  def define_blinders
    shuffled_players = @players.shuffle

    shuffled_players[0].set_blind
    shuffled_players[1].set_big_blind
  end

  def prepare_next_round
    shuffle_cards
    define_blinders
  end

  def start_game(players, round)
    load_cards
    init_round(round)
    players.each do |player|
      load_player(player)
    end

    prepare_next_round
  end

  def init_round(round)
    @round = round
  end
end
