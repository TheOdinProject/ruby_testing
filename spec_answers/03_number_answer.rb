# frozen_string_literal: true

describe Array do
  context 'when my_array has perfect values' do
    # Write a subject variable 'my_array' that passes all tests.
    subject(:my_array) { [-7, 42, 101, 98] }

    it 'has a specific first value' do
      expect(my_array.first).to be_odd.and be <= -1
    end

    it 'has a specific last value' do
      expect(my_array.last).to be_even.and be < 99
    end

    it 'has a specific min value' do
      expect(my_array.min).not_to be < -9
    end

    it 'has a specific max value' do
      expect(my_array.max).to be > 100
    end

    it 'includes a value of 42' do
      expect(my_array).to include(42)
    end

    it 'has a fourth element' do
      expect(my_array[3]).not_to be_nil
    end
  end
end
