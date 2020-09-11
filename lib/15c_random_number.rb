# frozen_string_literal: true

# class to generate random number
class RandomNumber
  attr_reader :value

  def initialize(minimum, maximum)
    @value = rand(minimum..maximum)
  end

  def update_value(number)
    @value = number
  end
end
