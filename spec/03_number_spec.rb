# frozen_string_literal: true

# In a typical workflow, the class being tested will be located in a separate
# file from the tests. But for this simple example, let's keep everything together.
class SingleDigit
  attr_reader :number

  def initialize
    @number = rand(1..9)
  end
end

describe SingleDigit do
  # There are differences between let and subject that you can research.
  # In general, the subject is used to declare the test subject.
  # https://stackoverflow.com/questions/38437162/whats-the-difference-between-rspecs-subject-and-let-when-should-they-be-used

  # It is recommended to explicitly define the subject with a descriptive name.
  # Then use the descriptive name, instead of 'subject,' in the tests.
  # https://web.archive.org/web/20230101143200/https://relishapp.com/rspec/rspec-core/docs/subject/explicit-subject
  subject(:random_digit) { SingleDigit.new }

  # There can be multiple tests in one example block; however, it is recommended
  # to test only one thing at a time.
  it 'is greater than or equal to 1' do
    # Comparison matchers are used with 'be' matcher
    # https://web.archive.org/web/20230101143200/https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/comparison-matchers
    expect(random_digit.number).to be >= 1
  end

  it 'is less than 10' do
    expect(random_digit.number).to be < 10
  end

  # The above 2 tests can be compounded together, so that you test two things.
  # in one test at the same time.
  context 'when tests can be compounded' do
    it 'is greater than 0 and less than 10' do
      # side note: rspec runs, but rubocop does not like (be >= 1).and be < 10
      expect(random_digit.number).to be_positive.and be < 10
    end
  end

  # Instead of using .to, you can use the inverse built in matcher .not_to
  context 'when using not_to' do
    it 'is not equal to 10' do
      expect(random_digit.number).not_to eq(10)
    end

    it 'is not equal to 0' do
      expect(random_digit.number).not_to be_zero
    end

    it 'is not nil' do
      expect(random_digit.number).not_to be_nil
    end
  end
end

# ASSIGNMENT

describe Array do
  context 'when my_array has perfect values' do
    # Write a subject variable 'my_array' that passes all tests.

    # remove the 'x' before running this test
    xit 'has a specific first value' do
      expect(my_array.first).to be_odd.and be <= -1
    end

    # remove the 'x' before running this test
    xit 'has a specific last value' do
      expect(my_array.last).to be_even.and be < 99
    end

    # remove the 'x' before running this test
    xit 'has a specific min value' do
      expect(my_array.min).not_to be < -9
    end

    # remove the 'x' before running this test
    xit 'has a specific max value' do
      expect(my_array.max).to be > 100
    end

    # remove the 'x' before running this test
    xit 'includes a value of 42' do
      expect(my_array).to include(42)
    end

    # remove the 'x' before running this test
    xit 'has a fourth element' do
      expect(my_array[3]).not_to be_nil
    end
  end
end
