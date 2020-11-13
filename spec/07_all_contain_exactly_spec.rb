# frozen_string_literal: true

# The 'all' matcher and the 'contain_exactly' matcher each look at every
# item in 'numbers'.

describe Array do
  subject(:numbers) { [11, 17, 21] }

  it 'is all odd numbers' do
    expect(numbers).to all(be_odd)
  end

  it 'is all under 25' do
    expect(numbers).to all(be < 25)
  end

  it 'contains exactly 21, 11, 17' do
    # The order does not matter.
    expect(numbers).to contain_exactly(21, 11, 17)
  end
end

describe String do
  subject(:sample_word) { 'spaceship' }

  context 'when using start_with' do
    it 'starts with s' do
      expect(sample_word).to start_with('s')
    end

    it 'starts with spa' do
      expect(sample_word).to start_with('spa')
    end

    it 'starts with space' do
      expect(sample_word).to start_with('space')
    end

    it 'starts with the whole word' do
      expect(sample_word).to start_with('spaceship')
    end
  end

  context 'when using end_with' do
    it 'ends with p' do
      expect(sample_word).to end_with('p')
    end

    it 'ends with hip' do
      expect(sample_word).to end_with('hip')
    end

    it 'ends with ship' do
      expect(sample_word).to end_with('ship')
    end

    it 'ends with the whole word' do
      expect(sample_word).to end_with('spaceship')
    end
  end
end

describe Array do
  subject(:symbol_array) { %i[a b c d e] }

  it 'starts with a and ends with e' do
    expect(symbol_array).to start_with(:a).and end_with(:e)
  end

  it 'starts with a and includes c' do
    expect(symbol_array).to start_with(:a).and include(:c)
  end
end

# ASSIGNMENT

describe Array do
  subject(:fibonacci_sequence) { [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89] }
  # Write a test that expresses each of the following statements.

  # remove the 'x' before running this test
  xit 'includes 21 and ends with 89' do
  end

  # remove the 'x' before running this test
  xit 'starts with 0, 1, 1, 2 and all are under 100' do
  end
end
