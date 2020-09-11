# frozen_string_literal: true

require_relative '../lib/16b_caesar_translator'

# The file order to complete this lesson:

# 1. Familarize yourself with the four lib/16 files.
#    - lib/16_caesar_main
#    - lib/16a_caesar_breaker
#    - lib/16b_caesar_translator which is based on the typical Caesar Cipher
#    - lib/16c_database (module)
# 2. Check out the completed tests in spec/16b_caesar_translator.
# 3. Complete spec/16a_caesar_breaker_spec.

# This spec file is for the CaesarTranslator class, which is used by the
# CaesarBreaker class.

describe CaesarTranslator do
  # Query Method -> Test the return value
  describe '#translate' do
    context 'when translating one word' do
      subject(:one_word) { described_class.new('Odin') }

      it 'works with small positive shift' do
        small_shift = 5
        small_result = one_word.translate(small_shift)
        expect(small_result).to eql('Tins')
      end

      it 'works with small negative shift' do
        small_negative_shift = -5
        small_negative_result = one_word.translate(small_negative_shift)
        expect(small_negative_result).to eql('Jydi')
      end

      it 'works with large positive shift' do
        large_shift = 74
        large_result = one_word.translate(large_shift)
        expect(large_result).to eql('Kzej')
      end

      it 'works with large negative shift' do
        large_negative_shift = -55
        large_negative_result = one_word.translate(large_negative_shift)
        expect(large_negative_result).to eql('Lafk')
      end
    end

    context 'when translating a phrase with punctuation' do
      subject(:punctuation_phrase) { described_class.new('Hello, World!') }

      it 'works with small positive shift' do
        small_shift = 9
        small_result = punctuation_phrase.translate(small_shift)
        expect(small_result).to eq('Qnuux, Fxaum!')
      end

      it 'works with small negative shift' do
        small_negative_shift = -5
        small_negative_result = punctuation_phrase.translate(small_negative_shift)
        expect(small_negative_result).to eql('Czggj, Rjmgy!')
      end

      it 'works with large positive shift' do
        large_shift = 74
        large_result = punctuation_phrase.translate(large_shift)
        expect(large_result).to eql('Dahhk, Sknhz!')
      end

      it 'works with large negative shift' do
        large_negative_shift = -55
        large_negative_result = punctuation_phrase.translate(large_negative_shift)
        expect(large_negative_result).to eql('Ebiil, Tloia!')
      end
    end
  end
end
