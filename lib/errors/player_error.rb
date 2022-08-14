# frozen_string_literal: true

# This class is an abstraction of player errors
class PlayerError < StandardError
  attr_accessor :msg

  def initialize(msg)
    @msg = msg
    super(msg)
  end
end
