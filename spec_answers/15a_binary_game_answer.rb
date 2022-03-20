# frozen_string_literal: true

require_relative '../lib/15a_binary_game'
require_relative '../lib/15b_binary_search'
require_relative '../lib/15c_random_number'

# The file order to complete this lesson:

# 1. Familarize yourself with the four lib/15 files.
#    - lib/15_binary_main
#    - lib/15a_binary_game
#    - lib/15b_binary_search which is based on 14_find_number
#    - lib/15c_random_number
# 2. Read the comments in spec/15b_binary_search_spec
# 3. Complete spec/15a_binary_game_spec

# As noted above, the files for this lesson (#15) build on the TDD files
# from #14. The FindNumber class is now called BinarySearch, which is a more
# accurate description.

# This lesson has a new class called BinaryGame. This BinaryGame class uses
# the BinarySearch class and visualizes how a binary search works.

# The focus of this lesson is unit testing, which is testing the behavior of
# individual methods in isolation. However, every method does not need to be
# tested, so we will look at some basic guidelines that determine whether or not
# a method needs to be tested.
# https://www.artofunittesting.com/definition-of-a-unit-test

# In general, you probably have 4 different types of methods:
# 1. Command - Changes the observable state, but does not return a value.
# 2. Query - Returns a result, but does not change the observable state.
# 3. Script - Only calls other methods, usually without returning anything.
# 4. Looping Script - Only calls other methods, usually without returning
#    anything, and stops when certain conditions are met.

# Let's take a look at methods that should always be tested:

# 1. Public Command or Public Query Methods should always be tested, because
# they are the public interface. Command Methods should test the method's action
# or side effect. Query Methods should test the method's return value.

# 2. Command or Query Methods that are inside a public script or looping script
# method should be tested. For the games that we are making, script and looping
# script methods are just a convenient way to call the methods needed to play a
# full game. Since these methods are required to play the game, they should be
# publicly tested methods (even if you previously made them private). Pretend
# that someone will be using your class to make their own game with customized
# text. Any method that they would need in their game should be a publicly
# tested method.

# 3. Any method that sends a command message to another class should always test
# that those messages were sent.

# 4. A Looping Script Method should test the behavior of the method. For
# example, that it stops when certain conditions are met.

# Here is a summary of what should be tested
# 1. Command Method -> Test the change in the observable state
# 2. Query Method -> Test the return value
# 3. Method with Outgoing Command -> Test that a message is sent
# 4. Looping Script Method -> Test the behavior of the method

# There are a handful of methods that you do not need to test:

# 1. You do not have to test #initialize if it is only creating instance
# variables. However, if you call methods inside the initialize method, you
# might need to test #initialize and/or the inside methods. In addition, you
# will need to stub any inside methods because they will be called when you
# create an instance of the class.

# 2. You do not have to test methods that only contain 'puts' or 'gets'
# because they are well-tested in the standard Ruby library.

# 3. Private methods do not need to be tested because they should have test
# coverage in public methods. However, as previously discussed, you may have
# some private methods that are called inside a script or looping script method;
# these methods should be tested publicly.

# Open the file lib/15a_binary_game in a split screen, so you can see both
# files at the same time. We will look at every method and determine if it will
# need to be tested or not.

describe BinaryGame do
  describe '#initialize' do
    # Initialize -> No test necessary, when only creating instance variables.
  end

  describe '#play_game' do
    # Public Script Method -> No test necessary, but all methods inside should
    # be tested.
  end

  describe '#player_input' do
    # Located inside #play_game (Public Script Method)
    # Looping Script Method -> Test the behavior of the method (for example, it
    # stops when certain conditions are met).

    # Note: #player_input will stop looping when the valid_input is between?(min, max)

    subject(:game_input) { described_class.new(1, 10) }

    context 'when user number is between arguments' do
      before do
        valid_input = '3'
        allow(game_input).to receive(:gets).and_return(valid_input)
      end

      # When you want to read an instance variable's value that does not need to
      # have a reader method, you can use instance_variable_get
      # https://www.rubydoc.info/stdlib/core/2.0.0/Object:instance_variable_get

      it 'stops loop and does not display error message' do
        min = game_input.instance_variable_get(:@minimum)
        max = game_input.instance_variable_get(:@maximum)
        error_message = "Input error! Please enter a number between #{min} or #{max}."
        expect(game_input).not_to receive(:puts).with(error_message)
        game_input.player_input(min, max)
      end
    end

    # ASSIGNMENT #1

    # Write a test for the following two context blocks. You will need to
    # provide 1-2 invalid inputs (letters, symbols, or numbers that are not
    # between the min & max integers) and one valid input number (as a string).

    # Remember that a stub can be called multiple times and return different values.
    # https://relishapp.com/rspec/rspec-mocks/docs/configuring-responses/returning-a-value

    context 'when user inputs an incorrect value once, then a valid input' do
      before do
        letter = 'q'
        valid_input = '3'
        allow(game_input).to receive(:gets).and_return(letter, valid_input)
      end

      it 'completes loop and displays error message once' do
        min = game_input.instance_variable_get(:@minimum)
        max = game_input.instance_variable_get(:@maximum)
        error_message = "Input error! Please enter a number between #{min} or #{max}."
        expect(game_input).to receive(:puts).with(error_message).once
        game_input.player_input(min, max)
      end
    end

    context 'when user inputs two incorrect values, then a valid input' do
      before do
        letter = 'q'
        symbol = '@'
        valid_input = '3'
        allow(game_input).to receive(:gets).and_return(letter, symbol, valid_input)
      end

      it 'completes loop and displays error message twice' do
        min = game_input.instance_variable_get(:@minimum)
        max = game_input.instance_variable_get(:@maximum)
        error_message = "Input error! Please enter a number between #{min} or #{max}."
        expect(game_input).to receive(:puts).with(error_message).twice
        game_input.player_input(min, max)
      end
    end
  end

  # ASSIGNMENT #2

  # Create a new instance of BinaryGame and write a test for the following two
  # context blocks.
  describe '#verify_input' do
    # Located inside #play_game (Looping Script Method)
    # Query Method -> Test the return value

    # Note: #verify_input will only return a number if it is between?(min, max)

    subject(:verify_game) { described_class.new(1, 100) }

    context 'when given a valid input as argument' do
      it 'returns valid input' do
        min = verify_game.instance_variable_get(:@minimum)
        max = verify_game.instance_variable_get(:@maximum)
        user_number = 48
        verified_input = verify_game.verify_input(min, max, user_number)
        expect(verified_input).to eq(48)
      end
    end

    context 'when given invalid input as argument' do
      it 'returns nil' do
        min = verify_game.instance_variable_get(:@minimum)
        max = verify_game.instance_variable_get(:@maximum)
        user_number = 234
        verified_input = verify_game.verify_input(min, max, user_number)
        expect(verified_input).to be_nil
      end
    end
  end

  describe '#update_random_number' do
    # Located inside #play_game (Public Script Method)
    # Method with Outgoing Command -> Test that a message is sent

    # Look at the #update_random_number in the BinaryGame class. This method
    # gets the user's input & wants to update the value of the @random_number.
    # If the RandomNumber class had a public setter method (like attr_accessor)
    # for @value, we could update @random_number's value inside the BinaryGame
    # class. For example: @random_number.value = number_input

    # However, this breaks the encapsulation of the RandomNumber class. As a
    # general rule, you want to minimize what classes know about other classes.
    # You should not let BinaryGame update the value of a RandomNumber. Instead,
    # you want BinaryGame to just send a message to RandomNumber telling it to
    # update the value. For example: @random_number.update_value(number_input)

    context 'when updating value of random number' do
      # Instead of using a normal double, as we did in TDD, we are going to
      # use an instance_double. Differently from the normal test double we've 
      # been using so far, a verifying double can produce an error if the method 
      # being stubbed do not exist in the actual class. Verifying doubles are a 
      # great tool to use when you're doing integration testing and need to make
      # sure that different classes work together in order to fulfill some bigger
      # computation.
      # https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/verifying-doubles

      # You should not use verifying doubles for unit testings. Unit testing relies 
      # on using doubles to test the object in isolation (i.e., not dependent on any
      # other object). One important concept to understand is that the BinarySearch 
      # or FindNumber class doesn't care if it is given an actual random_number class
      # object. It only cares that it is given an object that can respond to certain 
      # methods. This concept is called polymorphism.
      # https://www.geeksforgeeks.org/polymorphism-in-ruby/

      # Below (commented out) is the previous normal 'random_number' object
      # used in TDD. Compare it to the new verifying instance_double for the
      # RandomNumber class.
      # let(:random_number) { double('random_number', value: 8) }
      let(:random_update) { instance_double(RandomNumber) }
      subject(:game_update) { described_class.new(1, 100, random_update) }

      # To 'Arrange' this test, two methods will need to be stubbed, so that
      # they do not execute. In addition, #player_input will have two arguments
      # and will need to return the new_number. We are going to match the
      # literal arguments, but there are many ways to specify the arguments
      # using matching arguments:
      # https://relishapp.com/rspec/rspec-mocks/docs/setting-constraints/matching-arguments

      before do
        allow(game_update).to receive(:puts)
        new_number = 76
        allow(game_update).to receive(:player_input).with(1, 100).and_return(new_number)
      end

      it 'sends update_value to random_number' do
        expect(random_update).to receive(:update_value).with(76)
        game_update.update_random_number
      end
    end
  end

  describe '#maximum_guesses' do
    # Located inside #play_game (Public Script Method)
    # Query Method -> Test the return value

    context 'when game minimum and maximum is 1 and 10' do
      subject(:game_ten) { described_class.new(1, 10) }

      it 'returns 4' do
        max = game_ten.maximum_guesses
        expect(max).to eq(4)
      end
    end

    context 'when game minimum and maximum is 1 and 100' do
      subject(:game_hundred) { described_class.new(1, 100) }

      it 'returns 7' do
        max = game_hundred.maximum_guesses
        expect(max).to eq(7)
      end
    end

    # ASSIGNMENT #3

    # Write a test for the following context.
    context 'when game minimum and maximum is 100 and 600' do
      subject(:game_six_hundred) { described_class.new(100, 600) }

      it 'returns 9' do
        max = game_six_hundred.maximum_guesses
        expect(max).to eq(9)
      end
    end
  end

  describe '#create_binary_search' do
    # Located inside #play_game (Public Script Method)
    # Method with Outgoing Command -> Test that a message is sent

    subject(:game_create) { described_class.new(1, 10, number_create) }
    let(:number_create) { instance_double(RandomNumber) }

    # Since a new BinarySearch is given a RandomNumber, we can test that it
    # receives the correct double.
    it 'creates a new BinarySearch with RandomNumber double' do
      expect(BinarySearch).to receive(:new).with(1, 10, number_create)
      game_create.create_binary_search
    end
  end

  describe '#display_binary_search' do
    # Located inside #play_game (Public Script Method)

    # Looping Script Method -> Test the behavior of the method (for example, it
    # stops when certain conditions are met).

    # This method is a Looping Script Method, because #display_turn_order will
    # loop until binary_search.game_over?

    subject(:game_display) { described_class.new(1, 10) }
    let(:search_display) { instance_double(BinarySearch) }

    context 'when game_over? is false once' do
      before do
        allow(search_display).to receive(:game_over?).and_return(false, true)
      end

      it 'calls display_turn_order one time' do
        expect(game_display).to receive(:display_turn_order).with(search_display).once
        game_display.display_binary_search(search_display)
      end
    end

    context 'when game_over? is false twice' do
      before do
        allow(search_display).to receive(:game_over?).and_return(false, false, true)
      end

      it 'calls display_turn_order two times' do
        expect(game_display).to receive(:display_turn_order).with(search_display).twice
        game_display.display_binary_search(search_display)
      end
    end

    # ASSIGNMENT #4

    # Write a test for the following context.
    context 'when game_over? is false five times' do
      before do
        allow(search_display).to receive(:game_over?).and_return(false, false, false, false, false, true)
      end

      it 'calls display_turn_order five times' do
        expect(game_display).to receive(:display_turn_order).with(search_display).exactly(5).times
        game_display.display_binary_search(search_display)
      end
    end
  end

  # ASSIGNMENT #5

  # Write three tests for the following method.
  describe '#display_turn_order' do
    # This method is a Looping Script Method. In #display_binary_search,
    # #display_turn_order will loop until binary_search.game_over?

    # Create a new subject and an instance_double for BinarySearch.

    subject(:game_turn) { described_class.new(1, 10) }
    let(:binary_search_turn) { instance_double(BinarySearch) }

    before do
      allow(binary_search_turn).to receive(:make_guess)
      allow(binary_search_turn).to receive(:update_range)
      allow(game_turn).to receive(:display_guess)
    end

    # Command Method -> Test the change in the observable state
    it 'increases guess_count by one' do
      expect { game_turn.display_turn_order(binary_search_turn) }.to change { game_turn.instance_variable_get(:@guess_count) }.by(1)
    end

    # Method with Outgoing Command -> Test that a message is sent
    it 'sends make_guess to binary_search_turn' do
      expect(binary_search_turn).to receive(:make_guess).once
      game_turn.display_turn_order(binary_search_turn)
    end

    # Method with Outgoing Command -> Test that a message is sent
    it 'sends update_range to binary_search_turn' do
      expect(binary_search_turn).to receive(:update_range).once
      game_turn.display_turn_order(binary_search_turn)
    end

    # Using method expectations can be confusing. Stubbing the methods above
    # does not cause this test to pass; it only 'allows' a method to be
    # called, if it is called.

    # To test this fact, let's allow a method that is not called in
    # #display_turn_order. Uncomment the line at the bottom of this
    # paragraph, move it to the before hook, and run the tests.
    # All of the tests should continue to pass.
    # allow(binary_search_turn).to receive(:game_over?)

    # Now, in the lib/15a_binary_game.rb file, comment out either line,
    # binary_search.make_guess or binary_search.update_range. Resave the file
    # and rerun the tests. The test for the method that you commented out will
    # fail because the method is never called. Now, uncomment the line & resave
    # the file to have all tests passing.
  end

  describe '#introduction' do
    # Located inside #play_game (Public Script Method)
    # Only contains puts statements -> No test necessary & can be private.
  end

  describe '#display_guess' do
    # Located inside #display_turn_order (Looping Script Method)
    # Only contains puts statements -> No test necessary & can be private.
  end

  describe '#print_number' do
    # Only contains puts statements -> No test necessary & can be private.
  end
end
