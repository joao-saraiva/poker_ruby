# frozen_string_literal: true

# This class reprenset the errors raised by a round
class RoundError < StandardError
  attr_accessor :msg

  def initialize(msg)
    @msg = msg
    super(msg)
  end
end
