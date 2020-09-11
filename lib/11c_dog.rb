# frozen_string_literal: true

require_relative '../lib/11a_pet'

# Dog is a sub-class of Pet
class Dog < Pet
  def talk
    'WOOF!'
  end

  def sleeping?
    true
  end

  def barking?
    false
  end
end
