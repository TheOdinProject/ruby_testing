# frozen_string_literal: true

# 'eq' checks for equal VALUE.
# 'eql' checks for equal VALUE and TYPE.
# 'equal' checks for OBJECT IDENTITY.
# 'be' checks for OBJECT IDENTITY.

describe 'differences between eq, eql, equal, and be' do
  context 'my_score vs. your_score' do
    let(:my_score) { 10.0 }
    let(:your_score) { 10 }

    context 'eq only looks at value' do
      it 'is eq to each other' do
        expect(my_score).to eq(your_score)
      end
    end

    # my_score is a Float and your_score is an Integer.
    context 'eql looks at type & value' do
      it 'is not eql to each other' do
        expect(my_score).not_to eql(your_score)
      end
    end
  end

  context 'my_car vs. your_car vs. my_kids_borrow' do
    let(:my_car) { [2017, 'red', 'Jetta'] }
    let(:your_car) { [2017, 'red', 'Jetta'] }
    let(:my_kids_borrow) { my_car }

    context 'eql looks at type & value' do
      it 'is eql to each other' do
        expect(my_car).to eql(your_car)
      end

      it 'is eql to each other' do
        expect(my_kids_borrow).to eql(your_car)
      end
    end

    # Some prefer to use 'be' over 'equal' because it semantically makes sense.
    # expect(first_item).to be(second_item)
    context 'be and equal care about object identity' do
      it 'is comparing the same car' do
        expect(my_car).to equal(my_kids_borrow)
      end

      it 'is comparing the same car' do
        expect(my_car).to be(my_kids_borrow)
      end

      it 'is not comparing the same car' do
        expect(my_car).not_to be(your_car)
      end

      it 'is not comparing the same car' do
        expect(my_car).not_to equal([2017, 'red', 'Jetta'])
      end
    end
  end
end

# ASSIGNMENT

describe 'equality assignment' do
  let(:amy) { { fav_color: 'blue', fav_food: 'tacos' } }
  let(:bob) { { fav_color: 'blue', fav_food: 'tacos' } }
  let(:copy_cat) { amy }
  # Write a test that expresses each of the following statements.

  # remove the 'x' before running this test
  xit 'amy is eq to bob' do
  end

  # remove the 'x' before running this test
  xit 'amy is eql to bob' do
  end

  # remove the 'x' before running this test
  xit 'amy is not equal to bob' do
  end

  # remove the 'x' before running this test
  xit 'copy_cat is equal to amy' do
  end
end
