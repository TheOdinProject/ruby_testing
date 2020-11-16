# frozen_string_literal: true

require_relative '../lib/13_input_output'

# The file order to complete this lesson:
# 1. Familarize yourself with the two classes in lib/13_input_output.rb
# 2. Complete spec/13_input_output_spec.rb

# Ruby code that was written before you learned how to use RSpec may be nearly
# impossible to test. For example, in the lib/13_input_output file, there are
# two identical games: ImpossibleToTestGame and NumberGame. Take a look at each
# game and look for differences that may make one easier or harder to test
# than the other.

# One key difference between the two is that NumberGame has smaller,
# isolated methods.

# Small and isolated methods that only do one thing are easier to test.
# Long methods are like a run-on sentence that should have been divided into 2 or 3 different sentences so that everything could be clearly understood and in this case if a method does many different things it can be difficult to test.

# So if you are new to testing, be open to refactoring your previous
# code, to make writing tests easier. As you learn testing, you will also
# learn how to write better testable methods.

# The tests in this file are longer than those in the previous lessons.
# To get your bearings, remember to reference the following lines:
# describe -> Name of the method that is being tested.
# context ->  Explains the conditions of the test.
# it ->       Explains the results of the test.

describe NumberGame do
  subject(:game) { described_class.new }

  describe '#initialize' do
    context 'when solution is initialized' do
      it 'is a number greater than or equal to 0' do
        solution = game.solution
        expect(solution).to be >= 0
      end

      it 'is a number less than or equal to 9' do
        solution = game.solution
        expect(solution).to be <= 9
      end

      # ASSIGNMENT #1

      # Write a similar test to the one above, that uses a custom matcher
      # instead of <, >, =.
      matcher :be_between_zero_and_nine do
        match { |number| number.between?(0, 9) }
      end

      # remove the 'x' before running this test
      it 'is a number between 0 and 9' do
        solution = game.solution
        expect(solution).to be_between_zero_and_nine
      end
    end
  end

  describe '#game_over?' do
    context 'when user guess is correct' do
      # To test this method, we need to set specific values for @solution and
      # @guess, so we will create a new instance of NumberGame. When creating
      # another instance of NumberGame, we'll use a meaningful name to
      # differentiate between instances.

      # A helpful tip is to combine the purpose of the test and the object.
      # E.g., game_end or complete_game.

      subject(:game_end) { described_class.new(5, '5') }

      it 'is game over' do
        expect(game_end).to be_game_over
      end
    end

    # ASSIGNMENT #2

    # Create a new instance of NumberGame and write a test for when the @guess
    # does not equal @solution.
    context 'when user guess is not correct' do
      subject(:game_mid) { described_class.new(5, '2') }

      # remove the 'x' before running this test
      it 'is not game over' do
        expect(game_mid).to_not be_game_over
      end
    end
  end

  # The #player_input method is used in the game as an argument passed into the
  # verify_input method. The #player_input method is not tested because it is a
  # private method. In addition, it is unnecessary to test methods that only
  # contain puts and/or gets.

  # Since we do not have to test #player_input, let's test #verify_input.

  describe '#verify_input' do
    subject(:game_check) { described_class.new }
    # Note: #verify_input will only return a value if it matches /^[0-9]$/

    context 'when given a valid input as argument' do
      it 'returns valid input' do
        user_input = '3'
        verified_input = game_check.verify_input(user_input)
        expect(verified_input).to eq('3')
      end
    end

    # ASSIGNMENT #3

    # Write a test for the following context.
    context 'when given invalid input as argument' do
      it 'returns nil' do
        letter_input = 'g'
        verified_input = game_check.verify_input(letter_input)
        expect(verified_input).to be_nil
      end
    end
  end

  describe '#player_turn' do
    # In order to test the behavior of #player_turn, we need to use a method
    # stub for #player_input to return a valid_input ('3'). To stub a method,
    # we 'allow' the test subject (game_loop) to receive the :method_name
    # and to return a specific value.
    # https://relishapp.com/rspec/rspec-mocks/v/2-14/docs/method-stubs/allow-with-a-simple-return-value
    # http://testing-for-beginners.rubymonstas.org/test_doubles.html

    subject(:game_loop) { described_class.new }

    context 'when user input is valid' do
      # To test the behavior, we want to test that the loop stops before the
      # puts 'Input error!' line. In order to test that this method is not
      # called, we use a message expectation.
      # https://relishapp.com/rspec/rspec-mocks/docs

      it 'stops loop and does not display error message' do
        valid_input = '3'
        allow(game_loop).to receive(:player_input).and_return(valid_input)
        # To use a message expectation, move 'Assert' before 'Act'.
        expect(game_loop).not_to receive(:puts).with('Input error!')
        game_loop.player_turn
      end
    end

    context 'when user inputs an incorrect value once, then a valid input' do
      # A method stub can be called multiple times and return different values.
      # https://relishapp.com/rspec/rspec-mocks/docs/configuring-responses/returning-a-value
      # Create a stub method to receive :player_input and return the invalid
      # 'letter' input, then the 'valid_input'

      # As the 'Arrange' step for tests grows, you can use a before hook to
      # separate the test from the set-up.
      # https://relishapp.com/rspec/rspec-core/v/2-0/docs/hooks/before-and-after-hooks\
      # https://www.tutorialspoint.com/rspec/rspec_hooks.htm
      before do
        letter = 'd'
        valid_input = '8'
        allow(game_loop).to receive(:player_input).and_return(letter, valid_input)
      end

      # When using message expectations, you can specify how many times you
      # expect the message to be received.
      # https://relishapp.com/rspec/rspec-mocks/docs/setting-constraints/receive-counts
      it 'completes loop and displays error message once' do
        expect(game_loop).to receive(:puts).with('Input error!').once
        game_loop.player_turn
      end
    end

    # ASSIGNMENT #4

    # Write a test for the following context.
    context 'when user inputs two incorrect values, then a valid input' do
      before do
        letter = 'd'
        symbol = '$'
        valid_input = '2'
        allow(game_loop).to receive(:player_input).and_return(letter, symbol, valid_input)
      end

      it 'completes loop and displays error message twice' do
        expect(game_loop).to receive(:puts).with('Input error!').twice
        game_loop.player_turn
      end
    end
  end

  # It is unneccessary to write tests for methods that only contain puts
  # statements, like #final_message. Puts is a basic part of the standard
  # ruby library & is already well tested. Plus, most 'real world
  # applications' don't even output like this except to loggers.

  # However, here is an example of how to test 'puts' using the output matcher.
  # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/output-matcher

  describe '#final_message' do
    context 'when count is 1' do
      # To test this method, we need to set specific values for @solution,
      # @guess and @count, so we will create a new instance of NumberGame.
      subject(:game_one) { described_class.new(5, '5', 1) }

      it 'outputs correct phrase' do
        lucky_phrase = "LUCKY GUESS!\n"
        # The output matcher needs a block of code to assert.
        expect { game_one.final_message }.to output(lucky_phrase).to_stdout
      end
    end

    # ASSIGNMENT #5

    # Create a new instance of NumberGame, with specific values for @solution,
    # @guess, and @count
    context 'when count is 2-3' do
      subject(:game_three) { described_class.new(5, '5', 3) }

      # remove the 'x' before running this test
      it 'outputs correct phrase' do
        congrats_phrase = "Congratulations! You picked the random number in 3 guesses!\n"
        expect { game_three.final_message }.to output(congrats_phrase).to_stdout
      end
    end

    # ASSIGNMENT #6

    # Write a test for the following context.
    context 'when count is 4 and over' do
      subject(:game_seven) { described_class.new(5, '5', 7) }

      # remove the 'x' before running this test
      it 'outputs correct phrase' do
        hard_phrase = "That was hard. It took you 7 guesses!\n"
        expect { game_seven.final_message }.to output(hard_phrase).to_stdout
      end
    end
  end
end
