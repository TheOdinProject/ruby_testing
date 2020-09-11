# frozen_string_literal: true

require_relative '../lib/14_find_number'

# The file order to complete this lesson:
# 1. Familarize yourself with the initialize method in lib/14_find_number.rb
# 2. Start reading spec/14_find_number_spec.rb, which will also include
#    instructions to add methods to lib/14_find_number.rb

# This file focuses on test-driven development (TDD). One important
# TDD technique is using a 'double' for any object outside of the class being
# tested. A 'double' is a generic ruby object that stands in for the real
# object, like a stunt double.

# Doubles are very useful in TDD because you can create test functionality that
# is not coded yet with them.

# In this lesson, we will be testing the class 'FindNumber'. Look at the
# lib/14_find_number.rb file. An instance of 'FindNumber' is initialized with
# min, max, answer and guess. There are default values for answer and guess.

# Note: the 'RandomNumber' class has not been written. During TDD, we will need
# to create a double for RandomNumber in the tests for FindNumber.
# https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/basics/test-doubles

# Learning about doubles can be very confusing, because many resources use
# doubles/mocks/stubs interchangeably. If you want to dig a little deeper,
# here are a few additional resources to check out:
# https://www.tutorialspoint.com/rspec/rspec_test_doubles.htm
# https://www.codewithjason.com/rspec-mocks-stubs-plain-english/

describe FindNumber do
  # There are two ways to specify the messages that a double can receive.

  describe '#initialize' do
    # Doubles are strict, which means you must specify (allow) any messages
    # that they can receive. If a double receives a message that has not been
    # allowed, it will trigger an error.

    # This first example creates the double, then allows specific methods.
    context 'when creating the double and allowing method(s) in two steps' do
      let(:random_number) { double('random_number') }
      subject(:game) { described_class.new(0, 9, random_number) }

      context 'when random_number is 8' do
        it 'returns 8' do
          allow(random_number).to receive(:value).and_return(8)
          solution = game.answer
          expect(solution).to eq(8)
        end
      end
    end

    # This second example creates the double & specific methods together.
    context 'when creating the double and allowing method(s) in one step' do
      # A hash can be used to define allowed messages and return values.
      # When passing a hash as the last argument, the { } are not required.
      # let(:random_number) { double('random_number', { value: 3 }) }
      let(:random_number) { double('random_number', value: 3) }
      subject(:game) { described_class.new(0, 9, random_number) }

      context 'when random_number is 3' do
        it 'returns 3' do
          solution = game.answer
          expect(solution).to eq(3)
        end
      end
    end

    # When testing the same method in multiple tests, it is possible to add
    # method names to subject.
    context 'when adding method names to subject for multiple tests' do
      let(:random_number) { double('random_number', value: 5) }
      subject(:game_solution) { described_class.new(0, 9, random_number).answer }

      context 'when random_number is 5' do
        it 'returns 5' do
          expect(game_solution).to eq(5)
        end
      end
    end
  end
end

# ASSIGNMENT
# For this lesson you will be doing TDD for 3 methods: #make_guess,
# #game_over?, and #update_range.

# After you have some experience using TDD, you can use the typical
# Red-Green-Refactor workflow.
# https://thoughtbot.com/upcase/videos/red-green-refactor-by-example

# Since this is probably your first experience with TDD, let's extend the
# workflow to include a few more steps:
# 1. Read & understand the requirement for one method only.
# 2. Write one test for that method; run the tests to see it fail.
# 3. Write the method to fulfill the requirement.
# 4. Run the tests again. If they don't all pass, redo steps 1-3.
# 5. When your first test is passing, write the additional tests.
# 6. Run all of the tests. If any do not pass, redo steps 3-5.
# 7. Optional: Refactor your code and/or tests, keeping all tests passing.

describe FindNumber do
  # ASSIGNMENT: METHOD #1

  # The basic idea of 'FindNumber' is to program a computer to guess a
  # random_number using binary search. Remember the binary search video
  # that you watched in the Computer Science section:
  # https://www.youtube.com/watch?v=T98PIp4omUA

  # The computer will update min and max values to help find the correct number.

  describe '#make_guess' do
    # Create a random_number double called 'number_guessing'. Allow the double
    # to receive 'value' and return the value of 8, in one of the two ways
    # explained above.

    subject(:game_guessing) { described_class.new(0, 9, number_guessing) }

    # Before you write the #make_guess method:
    # Write a test that would expect #make_guess to return the average of
    # the min and max values (rounded down). Don't expect this test to be
    # able to pass as you haven't written #make_guess yet!
    context 'when min is 0 and max is 9' do
      xit 'returns 4' do
      end
    end

    # Now write a method in 14_find_number.rb called #make_guess that returns
    # the average of the min and max values (rounded down).
    # You can now run the above test and it should pass.

    # Write a test for each of the following contexts. You will need to create a
    # new instance of FindNumber for each context, but you can use the same
    # random number double created inside this method's describe block.

    context 'when min is 5 and max is 9' do
      xit 'returns 7' do
      end
    end

    context 'when min is 8 and max is 9' do
      xit 'returns 8' do
      end
    end

    context 'when min is 0 and max is 3' do
      xit 'returns 1' do
      end
    end

    context 'when min and max both equal 3' do
      xit 'returns 3' do
      end
    end
  end

  # ASSIGNMENT: METHOD #2
  describe '#game_over?' do
    context 'when guess and random_number are equal' do
      # Create another subject and random_number double with meaningful names.
      # The subject will need to specify the number value of @guess.

      # Allow the double to receive 'value' and return the same number as @guess.

      # Write a test that would expect game to be_game_over when a guess equals
      # the random_number double's value above. Remember that this test will not
      # be able to pass yet because you haven't written the method!

      xit 'is game over' do
      end
    end

    # Write the corresponding method in 14_find_number.rb called #game_over?
    # that returns true when a guess equals the value of the random_number.

    # Write a test that would expect game to NOT be_game_over when a guess does
    # NOT equal the random_number double's value above.

    context 'when guess and random_number are not equal' do
      xit 'is not game over' do
      end
    end
  end

  # ASSIGNMENT: METHOD #3
  describe '#update_range' do
    # As you have seen above, you can share the same random_number double for
    # multiple context blocks, by declaring it inside the describe block.
    let(:number_range) { double('random_number', value: 8) }

    # Write four tests for #update_range that test the values of min and max.

    # When the guess is less than the answer:
    # - min updates to one more than the guess
    # - max stays the same

    # When the guess is more than the answer:
    # - min stays the same
    # - max updates to one less than the guess

    context 'when the guess is less than the answer' do
      subject(:low_guess_game) { described_class.new(0, 9, number_range, 4) }

      xit 'updates min to 5' do
      end

      xit 'does not update max' do
      end
    end

    context 'when the guess is more than the answer' do
      subject(:high_guess_game) { described_class.new(0, 9, number_range, 9) }

      xit 'does not update min' do
      end

      xit 'updates max to 8' do
      end
    end

    # Now, write the method in 14_find_number.rb called #update_range that will
    # do the following:

    # When the guess is less than the answer:
    # - min updates to one more than the guess

    # When the guess is not less than the answer:
    # - max updates to one less than the guess

    # Write a test for any 'edge cases' that you can think of, for example:

    context 'when the guess is 7, min=5, and max=8' do
      xit 'updates min to the same value as max' do
      end

      xit 'does not update max' do
      end
    end
  end
end
