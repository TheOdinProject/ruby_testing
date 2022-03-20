# frozen_string_literal: true

require_relative '../lib/15b_binary_search'
require_relative '../lib/15c_random_number'

# The file order to complete this lesson:

# 1. Familarize yourself with the three lib/15 files.
#    - lib/15a_binary_game
#    - lib/15b_binary_search which is based on 14_find_number
#    - lib/15c_random_number
# 2. Look at spec/15b_binary_search_spec which is based on 14_find_number_spec
# 3. Complete spec/15a_binary_game_spec

# This spec file is for the BinarySearch class that is used in the BinaryGame
# class. These tests were written in the last lesson. The FindNumber class
# has been renamed to BinarySearch, which is a more accurate description.

# This spec file uses verifying doubles to help you get acquaintance with the
# concept. Differently from the normal test double we've been using so far, 
# a verifying double can produce an error if the method being stubbed do not 
# exist in the actual class. Verifying doubles are a great tool to use when 
# you're doing integration testing and need to make sure that different classes 
# work together in order to fulfill some bigger computation.
# https://relishapp.com/rspec/rspec-mocks/v/3-9/docs/verifying-doubles

# You should not use verifying doubles for unit testings. Unit testing relies 
# on using doubles to test the object in isolation (i.e., not dependent on any
# other object). One important concept to understand is that the BinarySearch 
# or FindNumber class doesn't care if it is given an actual random_number class
# object. It only cares that it is given an object that can respond to certain 
# methods. This concept is called polymorphism.
# https://www.geeksforgeeks.org/polymorphism-in-ruby/

describe BinarySearch do
  describe '#make_guess' do
    # Below (commented out) is the previous generic 'random_number' object
    # used in TDD. Compare it to the new verifying instance_double for the
    # RandomNumber class.
    # let(:random_number) { double('random_number', value: 8) }
    let(:random_number) { instance_double(RandomNumber, value: 8) }
    subject(:game) { described_class.new(0, 9, random_number) }

    context 'when min is 0 and max is 9' do
      it 'returns 4' do
        guess = game.make_guess
        expect(guess).to eq(4)
      end
    end

    context 'when min is 5 and max is 9' do
      subject(:game_five) { described_class.new(5, 9, random_number) }

      it 'returns 7' do
        guess = game_five.make_guess
        expect(guess).to eq(7)
      end
    end

    context 'when min is 8 and max is 9' do
      subject(:game_eight) { described_class.new(8, 9, random_number) }

      it 'returns 8' do
        guess = game_eight.make_guess
        expect(guess).to eq(8)
      end
    end

    context 'when min is 0 and max is 3' do
      subject(:game_zero) { described_class.new(0, 3, random_number) }

      it 'returns 1' do
        guess = game_zero.make_guess
        expect(guess).to eq(1)
      end
    end

    context 'when min and max both equal 3' do
      subject(:game_three) { described_class.new(3, 3, random_number) }

      it 'returns 3' do
        guess = game_three.make_guess
        expect(guess).to eq(3)
      end
    end
  end

  describe '#game_over?' do
    let(:ending_number) { instance_double(RandomNumber, value: 3) }
    subject(:ending_game) { described_class.new(0, 9, ending_number, 3) }

    context 'when guess and random_number are equal' do
      it 'is game over' do
        expect(ending_game).to be_game_over
      end
    end

    context 'when guess and random_number are not equal' do
      let(:mid_number) { double('random_number', value: 5) }
      subject(:mid_game) { described_class.new(0, 9, mid_number, 4) }

      it 'is not game over' do
        expect(mid_game).to_not be_game_over
      end
    end
  end

  describe '#update_range' do
    let(:range_number) { double('random_number', value: 8) }

    context 'when the guess is less than the answer' do
      subject(:low_guess_game) { described_class.new(0, 9, range_number, 4) }

      before do
        low_guess_game.update_range
      end

      it 'updates min' do
        minimum = low_guess_game.min
        expect(minimum).to eq(5)
      end

      it 'does not update max' do
        maximum = low_guess_game.max
        expect(maximum).to eq(9)
      end
    end

    context 'when the guess is more than the answer' do
      subject(:high_guess_game) { described_class.new(0, 9, range_number, 9) }

      before do
        high_guess_game.update_range
      end

      it 'does not update min' do
        minimum = high_guess_game.min
        expect(minimum).to eq(0)
      end

      it 'updates max' do
        maximum = high_guess_game.max
        expect(maximum).to eq(8)
      end
    end

    context 'when the guess is 7, with min=5 and max=8' do
      subject(:eight_game) { described_class.new(5, 8, range_number, 7) }

      before do
        eight_game.update_range
      end

      it 'updates min to the same value as max' do
        minimum = eight_game.min
        expect(minimum).to eq(8)
      end

      it 'does not update max' do
        maximum = eight_game.max
        expect(maximum).to eq(8)
      end
    end
  end
end
