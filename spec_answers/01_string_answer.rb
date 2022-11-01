# frozen_string_literal: true

describe String do
  # Create a let variable that will pass the first test.
  let(:favorite_food) { String.new('tacos') }

  it 'is equal to tacos' do
    expect(favorite_food).to eq('tacos')
  end

  context 'when favorite food is updated' do
    # Change the favorite_food let variable.
    let(:favorite_food) { String.new('fajitas') }

    it 'updates the favorite food' do
      # Write a test that will pass.
      expect(favorite_food).to eq('fajitas')
    end
  end
end
