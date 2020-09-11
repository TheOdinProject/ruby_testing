# frozen_string_literal: true

describe Array do
  context 'when updating an implicit subject' do
    # remove the 'x' before running this test
    it 'is empty' do
      # Write a test to expect the subject to be empty.
      expect(subject).to be_empty
    end

    # remove the 'x' before running this test
    it 'updates length to 1' do
      # Update the implicit subject to make this test past.
      subject << 21
      expect(subject.length).to eq(1)
    end
  end

  context 'when using one let variable on two tests' do
    # Make a let variable that will pass both tests.
    let(:lucky_numbers) { [3, 19, 20] }

    # remove the 'x' before running this test
    it 'has length of 3' do
      expect(lucky_numbers.length).to eq(3)
    end

    # remove the 'x' before running this test
    it 'has sum of 42' do
      expect(lucky_numbers.sum).to eq(42)
    end
  end
end
