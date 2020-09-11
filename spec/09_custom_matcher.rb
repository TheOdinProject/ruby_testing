# frozen_string_literal: true

# If you need to test a condition that does not have a built-in matcher,
# you can create your own.
# https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/custom-matchers

describe 'defining custom matchers' do
  context 'when reusing a matcher that is in scope' do
    matcher :be_divisible_by_four do
      match { |num| (num % 4).zero? }
    end

    it 'is divisible by 4' do
      expect(12).to be_divisible_by_four
    end

    # You can test for the inverse of the matcher.
    it 'is not divisible by 4' do
      expect(99).not_to be_divisible_by_four
    end

    # You can even use a custom matcher with 'all'.
    it 'works with multiple values' do
      expect([12, 100, 800]).to all(be_divisible_by_four)
    end
  end
end

# ASSIGNMENT

describe 'one word palindrome test' do
  let(:racecar) { 'racecar' }
  let(:spaceship) { 'spaceship' }
  let(:rotator) { 'rotator' }
  let(:palindrome) { 'palindrome' }

  # Write a custom matcher that detects a one word palindrome,
  # using the following block: { |word| word.reverse == word }
  # When it is set up correctly, all of the following tests will pass.

  context 'when a palindrome is used' do
    # remove the 'x' before running this test
    xit 'is a palindrome' do
      expect(racecar).to be_a_palindrome
    end

    # remove the 'x' before running this test
    xit 'is a palindrome' do
      expect(rotator).to be_a_palindrome
    end
  end

  context 'when a palindrome is not used' do
    # remove the 'x' before running this test
    xit 'is not a palindrome' do
      expect(spaceship).not_to be_a_palindrome
    end

    # remove the 'x' before running this test
    xit 'is not a palindrome' do
      expect(palindrome).not_to be_a_palindrome
    end
  end
end
