# frozen_string_literal: true

# All answers for this TDD example are in this file
# (FindNumber class and rspec tests )

# class for computer to find random number
class FindNumber
  attr_reader :min, :max, :answer, :guess

  def initialize(min, max, answer = RandomNumber.new(min, max), guess = nil)
    @min = min
    @max = max
    @answer = answer.value
    @guess = guess
  end

  def make_guess
    @guess = (min + max) / 2
  end

  def game_over?
    guess == answer
  end

  def update_range
    guess < answer ? @min = guess + 1 : @max = guess - 1
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

    let(:number_guessing) { double('random_number', value: 8) }
    subject(:game_guessing) { described_class.new(0, 9, number_guessing) }

    # Before you write the #make_guess method:
    # Write a test that would expect #make_guess to return the average of
    # the min and max values (rounded down). Don't expect this test to be
    # able to pass as you haven't written #make_guess yet!
    context 'when min is 0 and max is 9' do
      it 'returns 4' do
        guess = game_guessing.make_guess
        expect(guess).to eq(4)
      end
    end

    # Now write a method in 14_find_number.rb called #make_guess that returns
    # the average of the min and max values (rounded down).
    # You can now run the above test and it should pass.

    # Write a test for each of the following contexts. You will need to create a
    # new instance of FindNumber for each context, but you can use the same
    # random number double created inside this method's describe block.

    context 'when min is 5 and max is 9' do
      subject(:game_five) { described_class.new(5, 9, number_guessing) }

      it 'returns 7' do
        guess = game_five.make_guess
        expect(guess).to eq(7)
      end
    end

    context 'when min is 8 and max is 9' do
      subject(:game_eight) { described_class.new(8, 9, number_guessing) }

      it 'returns 8' do
        guess = game_eight.make_guess
        expect(guess).to eq(8)
      end
    end

    context 'when min is 0 and max is 3' do
      subject(:game_zero) { described_class.new(0, 3, number_guessing) }

      it 'returns 1' do
        guess = game_zero.make_guess
        expect(guess).to eq(1)
      end
    end

    context 'when min and max both equal 3' do
      subject(:game_three) { described_class.new(3, 3, number_guessing) }

      it 'returns 3' do
        guess = game_three.make_guess
        expect(guess).to eq(3)
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

      let(:number_end) { double('random_number', value: 3) }
      subject(:game_end) { described_class.new(0, 9, number_end, 3) }

      it 'is game over' do
        expect(game_end).to be_game_over
      end
    end

    # Write the corresponding method in 14_find_number.rb called #game_over?
    # that returns true when a guess equals the value of the random_number.

    # Write a test that would expect game to NOT be_game_over when a guess does
    # NOT equal the random_number double's value above.

    context 'when guess and random_number are not equal' do
      let(:number_mid) { double('random_number', value: 5) }
      subject(:game_mid) { described_class.new(0, 9, number_mid, 4) }

      it 'is not game over' do
        expect(game_mid).to_not be_game_over
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

      before do
        low_guess_game.update_range
      end

      it 'updates min to 5' do
        minimum = low_guess_game.min
        expect(minimum).to eq(5)
      end

      it 'does not update max' do
        maximum = low_guess_game.max
        expect(maximum).to eq(9)
      end
    end

    context 'when the guess is more than the answer' do
      subject(:high_guess_game) { described_class.new(0, 9, number_range, 9) }

      before do
        high_guess_game.update_range
      end

      it 'does not update min' do
        minimum = high_guess_game.min
        expect(minimum).to eq(0)
      end

      it 'updates max to 8' do
        maximum = high_guess_game.max
        expect(maximum).to eq(8)
      end
    end

    # Now, write the method in 14_find_number.rb called #update_range that will
    # do the following:

    # When the guess is less than the answer:
    # - min updates to one more than the guess

    # When the guess is not less than the answer:
    # - max updates to one less than the guess

    # Write a test for any 'edge cases' that you can think of, for example:

    context 'when the guess is 7, with min=5 and max=8' do
      subject(:game_range) { described_class.new(5, 8, number_range, 7) }

      before do
        game_range.update_range
      end

      it 'updates min to the same value as max' do
        minimum = game_range.min
        expect(minimum).to eq(8)
      end

      it 'does not update max' do
        maximum = game_range.max
        expect(maximum).to eq(8)
      end
    end
  end
end
