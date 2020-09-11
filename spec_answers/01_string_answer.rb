# frozen_string_literal: true

describe String do
  # Create a let variable that will pass the first test.
  let(:favorite_food) { String.new('tacos') }

  # remove the 'x' before running this test
  it 'is equal to tacos' do
    expect(favorite_food).to eq('tacos')
  end

  # remove the 'x' before running this test
  context 'when favorite food is updated' do
    it 'updates the favorite food' do
      # Change the favorite_food let variable.
      favorite_food = 'fajitas'
      # Write a test that will pass.
      expect(favorite_food).to eq('fajitas')
    end
  end
end
