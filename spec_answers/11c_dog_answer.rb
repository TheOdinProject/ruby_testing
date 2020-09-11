# frozen_string_literal: true

require_relative '../lib/11c_dog'
require_relative '../spec/11a_shared_example_spec'

describe Dog do
  subject(:toby) { described_class.new('Toby', nil, 'brown') }

  # Before you begin this file, make sure you have read the shared
  # example file: 11a_shared_examples_spec.rb. This test references
  # that file's first test in the below 'include_examples' line.
  context 'when Dog is a child class of Pet' do
    include_examples 'base class method name'
  end

  context 'when dog has name and color, but no breed' do
    # https://relishapp.com/rspec/rspec-expectations/v/3-9/docs/built-in-matchers/have-attributes-matcher
    it 'has name, breed & color attributes' do
      expect(toby).to have_attributes(name: 'Toby', breed: nil, color: 'brown')
    end
  end
end

describe Dog do
  # Create a subject with your choice of cat name and optional breed/color.
  subject(:ollie) { described_class.new('Ollie', nil, 'white') }

  # Write a test using the second shared_example to test that dog responds to
  # talk ('WOOF!').
  context 'when Dog has method name shared with other classes' do
    include_examples 'shared method name'
  end

  # remove the 'x' before running this test
  it 'is not barking' do
    expect(ollie).to_not be_barking
  end

  # remove the 'x' before running this test
  it 'is sleeping' do
    expect(ollie).to be_sleeping
  end
end
