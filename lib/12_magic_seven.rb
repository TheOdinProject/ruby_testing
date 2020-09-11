# frozen_string_literal: true

# Given any number, the final number will always be 7
class MagicSeven
  attr_reader :random_number

  def initialize(random_number = rand(0..20))
    @random_number = random_number
  end

  def add_nine(number)
    number + 9
  end

  def multiply_by_two(number)
    number * 2
  end

  def subtract_four(number)
    number - 4
  end

  def divide_by_two(number)
    number / 2
  end

  def subtract_random_number(number)
    number - random_number
  end

  def play
    step_one = add_nine(random_number)
    step_two = multiply_by_two(step_one)
    step_three = subtract_four(step_two)
    step_four = divide_by_two(step_three)
    subtract_random_number(step_four)
  end

  # This method is not used in testing. Its purpose is to show how the game
  # works. Run it in the console to see how, by uncommenting the appropriate
  # commands at the bottom of this file.

  def display_result
    step_one = add_nine(random_number)
    step_two = multiply_by_two(step_one)
    step_three = subtract_four(step_two)
    step_four = divide_by_two(step_three)
    puts <<~HEREDOC

      MAGIC SEVEN

      Magic Seven can take any random number and turn that number into the
      number 7, using the same five mathematical operations every time!

      For example, let's start with the random number #{random_number}.

      1. Add nine:
          #{random_number} + 9 = #{step_one}

      2. Take #1 answer and multiply by two:
          #{step_one} * 2 = #{step_two}

      3. Take #2 answer and subtract four:
          #{step_two} - 4 = #{step_three}

      4. Take #3 answer and divide by two:
          #{step_three} / 2 = #{step_four}

      5. Take #4 answer and subtract the original random number:
          #{step_four} - #{random_number} = #{play}

      Step #5 will always be 7!

    HEREDOC
  end
end

# game = MagicSeven.new
# game.play
# game.display_result
