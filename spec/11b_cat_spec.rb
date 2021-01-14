# frozen_string_literal: true

require_relative '../lib/11b_cat'
require_relative '../spec/11a_shared_example_spec'

# The file order to complete this lesson:

# 1. Familiarize yourself with the three lib/11 files.
#    - lib/11a_pet.rb is the parent 'Pet' class of 'Cat' and 'Dog'
#    - lib/11b_cat.rb is a subclass 'Cat'
#    - lib/11c_dog.rb is a subclass 'Dog'
# 2. Review the tests in spec/11a_shared_example_spec.rb
# 3. Complete either spec/11b_cat_spec.rb or spec/11c_dog_spec.rb

describe Cat do
  subject(:oscar) { described_class.new('Oscar', 'Maine Coon') }

  # Before you begin this file, make sure you have read the shared
  # example file: 11a_shared_examples_spec.rb. This test references
  # that file's first test in the below 'include_examples' line.
  context 'when Cat is a child class of Pet' do
    include_examples 'base class method name'
  end

  context 'when cat has name and breed, but no color' do
    # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/have-attributes-matcher
    it 'has name, breed & color attributes' do
      expect(oscar).to have_attributes(name: 'Oscar', breed: 'Maine Coon', color: nil)
    end
  end
end

# ASSIGNMENT - complete either Cat or Dog assignment
# (see 11c_dog_spec.rb for Dog assignment)

describe Cat do
  # Create a subject with your choice of cat name and optional breed/color.

  # Write a test using the second shared_example to test that cat responds to
  # talk ('meow').
  context '' do
  end

  # remove the 'x' before running this test
  xit 'is not hungry' do
  end

  # remove the 'x' before running this test
  xit 'is hiding' do
  end
end
