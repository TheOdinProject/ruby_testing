# frozen_string_literal: true

require_relative '../lib/10_drink'

describe Drink do
  describe '#initialize' do
    context 'when type is specified and ounces is default' do
      # Create an explicit subject, using 'described_class' and your choice of
      # beverage type.
      subject(:tea_drink) { described_class.new('tea') }

      # remove the 'x' before running this test
      it 'is tea' do
        expect(tea_drink.type).to eq('tea')
      end

      # remove the 'x' before running this test
      it 'has 16 ounces' do
        expect(tea_drink.ounces).to eq(16)
      end
    end
  end

  describe '#full?' do
    context 'when drink has 16 ounces or more' do
      # Create an explicit subject, using 'described_class' and your choice of
      # beverage type.
      subject(:default_drink) { described_class.new }

      # remove the 'x' before running this test
      it 'is full' do
        expect(default_drink).to be_full
      end
    end

    context 'when drink has less than 16 ounces' do
      # Create an explicit subject, using 'described_class' and your choice of
      # beverage type. In addition, specify ounces to be any number under 16.
      subject(:juice_drink) { described_class.new('juice', 8) }

      # remove the 'x' before running this test
      it 'is not full' do
        expect(juice_drink).to_not be_full
      end
    end
  end
end
