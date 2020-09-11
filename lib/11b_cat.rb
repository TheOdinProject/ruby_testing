# frozen_string_literal: true

require_relative '../lib/11a_pet'

# Cat is a sub-class of Pet
class Cat < Pet
  def talk
    'meow'
  end

  def hiding?
    true
  end

  def hungry?
    false
  end
end
