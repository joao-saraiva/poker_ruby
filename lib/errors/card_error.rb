# frozen_string_literal: true

# This class represent cards errors
class CardError < StandardError
  attr_reader :msg

  def initialize(msg)
    @msg = msg
    super(msg)
  end
end
