# frozen_string_literal: true

# rubocop: disable Layout/LineLength

# require_relative '../lib/15c_random_number'
# require_relative '../lib/15b_binary_search'

# class for computer to find random number
class BinaryGame
  def initialize(minimum, maximum, random_number = RandomNumber.new(minimum, maximum))
    @minimum = minimum
    @maximum = maximum
    @random_number = random_number
    @guess_count = 0
  end

  def play_game
    introduction
    mode = player_input(1, 2)
    update_random_number if mode == 1
    puts "\nUsing a binary search, any number can be found in #{maximum_guesses} guesses or less!\n\n"
    binary_search = create_binary_search
    display_binary_search(binary_search)
    puts "As predicted, the computer found it in #{@guess_count} guesses."
  end

  def player_input(min, max)
    loop do
      user_input = gets.chomp
      verified_number = verify_input(min, max, user_input.to_i) if user_input.match?(/^\d+$/)
      return verified_number if verified_number

      puts "Input error! Please enter a number between #{min} or #{max}."
    end
  end

  def verify_input(min, max, input)
    return input if input.between?(min, max)
  end

  def update_random_number
    puts "Enter a number between #{@minimum} and #{@maximum}"
    number_input = player_input(@minimum, @maximum)
    @random_number.update_value(number_input)
  end

  def maximum_guesses
    (Math.log2(@maximum - @minimum) + 1).to_i
  end

  def create_binary_search
    BinarySearch.new(@minimum, @maximum, @random_number)
  end

  def display_binary_search(binary_search)
    display_turn_order(binary_search) until binary_search.game_over?
  end

  def display_turn_order(binary_search)
    binary_search.make_guess
    @guess_count += 1
    display_guess(binary_search)
    binary_search.update_range
  end

  private

  def introduction
    puts <<~HEREDOC

      \e[32mWatch the computer find a number between #{@minimum} and #{@maximum} using a binary search.\e[0m

      The computer-generated random number is \e[32m#{@random_number.value}\e[0m.
      Would you like to choose your own number?

      \e[32m[1]\e[0m Choose a new number
      \e[32m[2]\e[0m Keep the randomly-generated number

    HEREDOC
  end

  def display_guess(binary_search)
    range = (@minimum..@maximum).to_a
    sleep(2)
    puts
    range.each do |number|
      print_number(binary_search.min, binary_search.max, number)
    end
    puts "\nGuess ##{@guess_count} -> \e[32m#{binary_search.guess}\e[0m\n\n"
  end

  def print_number(min, max, number)
    if number == (min + max) / 2
      print "\e[32m#{number} \e[0m"
    elsif number.between?(min, max)
      print "#{number} "
    else
      print "\e[91m#{number} \e[0m"
    end
  end
end
# rubocop: enable Layout/LineLength
