# frozen_string_literal: true

# base class for a pet
class Pet
  attr_reader :name, :breed, :color

  def initialize(name, breed = nil, color = nil)
    @name = name
    @breed = breed
    @color = color
  end

  def meal_time
    "#{name} paws at empty food bowl"
  end
end
