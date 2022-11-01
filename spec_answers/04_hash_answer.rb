# frozen_string_literal: true

describe Hash do
  subject(:my_car) do
    {
      make: 'Volkswagen',
      model: 'Jetta',
      year: 2017,
      parking_camera?: true,
      assisted_steering?: false
    }
  end

  it 'is newer than 2015' do
    # Write a test that verifies the above statement.
    expect(my_car[:year]).to be > 2015
  end

  it 'has a parking camera' do
    # Write a test that verifies the above statement.
    expect(my_car[:parking_camera?]).to be true
  end

  it 'does not have assisted steering' do
    # Write a test that verifies the above statement.
    expect(my_car[:assisted_steering?]).to be false
  end
end
