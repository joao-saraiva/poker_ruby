# frozen_string_literal: true

# This class is a control to know wich cards are on the table visible to the
# player
class TableCard
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def clear_table
    @cards = []
  end
end
