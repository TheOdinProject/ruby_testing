# frozen_string_literal: true

describe Array do
  subject(:drinks) { %w[coffee tea water] }

  # Using .or instead of .and when compounding matchers:
  context 'when testing for multiple outcomes' do
    it 'will be coffee, tea, or water' do
      expect(drinks.sample).to eq('coffee').or eq('tea').or eq('water')
    end
  end

  # When testing for a change to occur, notice that unlike previous matchers
  # we've seen, 'change' accepts a block of code.
  # https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/change-matcher

  context 'when testing for a change' do
    it 'will change the length to 4' do
      expect { drinks << 'juice' }.to change { drinks.length }.to(4)
    end

    it 'will change the length from 3 to 4' do
      expect { drinks << 'juice' }.to change { drinks.length }.from(3).to(4)
    end

    # The above two tests are too tightly coupled to a specific array length.
    # The test should instead be written for any length of array, for example:
    it 'will increase the length by one' do
      expect { drinks << 'juice' }.to change { drinks.length }.by(1)
    end

    # There are additional ways to be more descriptive about the change.
    it 'will increase the length by at most one' do
      expect { drinks << 'juice' }.to change { drinks.length }.by_at_most(1)
    end

    # Alternate form for 'change' matcher using (object, :attribute):
    it 'will increase the length by one' do
      expect { drinks << 'juice' }.to change(drinks, :length).by(1)
    end

    # You can compound change matchers together.
    it 'will decrease by one and end with tea' do
      expect { drinks.pop }.to change { drinks.length }.by(-1).and change { drinks.last }.to('tea')
    end
  end
end

# ASSIGNMENT:

describe 'lucky numbers with rotate! method' do
  subject(:lucky_numbers) { [3, 7, 13, 31, 42] }
  # Write a test that expresses each of the following statements.
  # Use the array #rotate! method to manipulate lucky_numbers.

  context 'when rotating the array of lucky numbers' do
    # remove the 'x' before running this test
    xit 'will change the first value to 7' do
    end

    # remove the 'x' before running this test
    xit 'will change the last value to 3' do
    end

    # remove the 'x' before running this test
    xit 'will change the first value to 7 and last value to 3' do
    end
  end
end
