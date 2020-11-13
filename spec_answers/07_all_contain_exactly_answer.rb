# frozen_string_literal: true

describe Array do
  subject(:fibonacci_sequence) { [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89] }
  # Write a test that expresses each of the following statements.

  # remove the 'x' before running this test
  it 'includes 21 and ends with 89' do
    expect(fibonacci_sequence).to include(21).and end_with(89)
  end

  # remove the 'x' before running this test
  it 'starts with 0, 1, 1, 2 and all are under 100' do
    expect(fibonacci_sequence).to start_with(0, 1, 1, 2).and all(be < 100)
  end
end
