# frozen_string_literal: true

# This class generate errors for gem bets amount.
class GemAmountError < StandardError
  attr_reader :msg

  def initialize(msg = 'Invalid gem amount')
    @msg = msg
    super(msg)
  end
end
