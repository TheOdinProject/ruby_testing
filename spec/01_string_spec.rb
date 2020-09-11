# frozen_string_literal: true

describe String do
  # The let method is passed a block that computes the value of the variable.
  # It will only be called when the variable is needed.
  # This is known as lazy loading.
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

  context 'when the value of a let variable changes inside an example' do
    it 'is the updated value of the let variable' do
      favorite_color = 'navy blue'
      expect(favorite_color).to eq('navy blue')
    end

    # Let variables reset between examples.
    it 'is the value of assigned let variable' do
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
    xit 'updates the favorite food' do
      # Change the favorite_food let variable.

      # Write a test that will pass.
    end
  end
end
