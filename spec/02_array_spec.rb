# frozen_string_literal: true

describe Array do
  # An implicitly defined 'subject' is available when the outermost example
  # group is a class. The 'subject' will be an instance of that class.
  # https://web.archive.org/web/20221204015051/https://relishapp.com/rspec/rspec-core/v/3-9/docs/subject/implicitly-defined-subject

  # Note: Using an implicit subject is not recommended for most situations.
  # The next lesson will cover explicit subjects, which are recommended over
  # implicit subjects.

  context 'when subject is implicitly defined' do
    # Type matchers can use be_a or be_an to increase readability.
    # https://web.archive.org/web/20230101143200/https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/type-matchers
    it 'is an Array' do
      expect(subject).to be_an(Array)
    end
    
    # Below is one-line syntax that does the same as the above test.
    # Look at the doc string that is auto-generated when this test is run
    # (in a terminal window).
    it { is_expected.to be_an(Array) }
  end

  context 'when using predicate matchers' do
    context 'when using the empty? predicate method' do
      # A predicate method in Ruby ends with a ? and only returns true or false. 
      it 'returns true' do
        expect(subject.empty?).to eq true
      end
    end
    
    # RSpec can leverage this to create predicate matchers for any predicate method.
    # https://web.archive.org/web/20230101143200/https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/predicate-matchers
    it 'is empty' do
      expect(subject).to be_empty
    end
    
    # Below is one-line syntax that does the same as the above test.
    # Look at the doc string that is auto-generated when this test is run
    # (in a terminal window).
    it { is_expected.to be_empty }
  end

  context 'when a let variable is declared inside a context block' do
    let(:numbers) { [3, 8, 9] }

    it 'has length of 3' do
      expect(numbers.length).to eq(3)
    end

    it 'changes the length to 2' do
      numbers.pop
      expect(numbers.length).to eq(2)
    end
  end

  # Look at the order of the above 5 tests when this test file is run
  # (in a terminal).
  # Why do you think they output in a different order than they are written?

  # The answer is that each group runs its examples before running its nested
  # example groups, even if the nested groups are defined before the examples.
  # https://web.archive.org/web/20230101143200/https://relishapp.com/rspec/rspec-core/v/3-9/docs/command-line/order

  # Please note: one-line tests are only recommended when the matcher aligns
  # exactly with the doc string. Even in that case, many rubyists prefer
  # explicitly writing out the test & not using one-line syntax.
end

# ASSIGNMENT
describe Array do
  context 'when updating an implicit subject' do
    # remove the 'x' before running this test
    xit 'is empty' do
      # Write a test to expect the subject to be empty.
    end

    # remove the 'x' before running this test
    xit 'updates length to 1' do
      # Update the implicit subject to make this test pass.
      expect(subject.length).to eq(1)
    end
  end

  context 'when using one let variable on two tests' do
    # Make a let variable that will pass both tests.

    # remove the 'x' before running this test
    xit 'has length of 3' do
      expect(lucky_numbers.length).to eq(3)
    end

    # remove the 'x' before running this test
    xit 'has sum of 42' do
      expect(lucky_numbers.sum).to eq(42)
    end
  end
end
