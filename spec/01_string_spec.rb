# frozen_string_literal: true

describe String do
  # Let creates a helper method with a memoized value that is cached for the
  # same example but not across different examples. Let is lazy-evaluated;
  # it is not evaluated until the first time the method it defines is invoked.
  # https://medium.com/@tomkadwill/all-about-rspec-let-a3b642e08d39

  let(:favorite_color) { String.new('blue') }

  # Use a context block to make your tests clear and well organized.
  # It is not required, but it is generally used to explain any conditionals.
  # Here are some examples of words you should start your context block with:
  # if, when, unless, with, without, for, before, after, during

  context 'when a let variable is used' do
    it 'is the value of assigned let variable' do
      expect(favorite_color).to eq('blue')
    end
  end

  context 'when the let variable is overridden' do
    let(:favorite_color) { String.new('green') }

    it 'is the updated value of the let variable' do
      expect(favorite_color).to eq('green')
    end
  end

  # Let variables reset between examples.
  context 'when the overriden value is out of scope' do
    it 'is the value of original let variable' do
      expect(favorite_color).to eq('blue')
    end
  end
end

# ASSIGNMENT

describe String do
  # Create a let variable that will pass the first test.

  # remove the 'x' before running this test
  xit 'is equal to tacos' do
    expect(favorite_food).to eq('tacos')
  end

  # remove the 'x' before running this test
  context 'when favorite food is updated' do
    # Change the favorite_food let variable.

    xit 'updates the favorite food' do
      # Write a test that will pass.
    end
  end
end
