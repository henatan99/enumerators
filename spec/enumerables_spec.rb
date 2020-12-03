# spec/enumerables_spec.rb
require './enumerable' #=> add this

describe Enumerable do
  describe 'my_each' do
    let(:arr) { [] }
    it 'returns a new array by incrementing each element of the given array by 1' do
      [1, 2, 3].my_each { |item| arr << item + 1 }
      expect(arr). to eql([2, 3, 4])
    end
  end

  describe 'my_each_with_index' do
    it 'returns a Hash element from given list of string elements and block argument of hash item and index' do
      hash = {}
      expect(%w[cat dog wombat].my_each_with_index do |item, index|
        hash[item] = index
      end).to eql(%w[cat dog wombat])
    end
    it 'returns the new array of numeric elements by applying block definition to the item and index arguments' do
      arr = []
      expect([1, 2, 3].my_each_with_index do |item, index|
        arr << item + index
      end).to eql([1, 2, 3])
    end
  end

  describe 'my_select' do
    it 'returns a new array of elements whose modulus to 3 is zero from a range object' do
      expect((1..10).my_select { |i| i % 3 == 0 }).to eql([3, 6, 9])
    end
    it 'retruns a new array of elements by selecting even numbers from an array of numerics' do
      expect([1, 2, 3, 4, 5].my_select(&:even?)).to eql([2, 4])
    end
    it 'retruns a new array of elements by selecting even numbers from an array of numerics' do
      expect([1, 2, 3, 4, 5].my_select(&:odd?)).to eql([1, 3, 5])
    end
    it 'retruns a new array of elements by selecting elements with the same class when argument is a class' do
      expect([1, 'a', 'b', 4, 5].my_select { |num| num.is_a?(Numeric) }).to eql([1, 4, 5])
    end
    it 'returns a new array of symbols which satisfies a block argument from an array of symbol elements' do
      expect(%i[foo bar].my_select { |x| x == :foo }).to eql([:foo])
    end
  end

  describe 'my_all?' do
    it 'returns true when all string elements satisfy block argument which is string size equality' do
      expect(%w[ant bear cat].my_all? { |word| word.length >= 3 }). to eql(true)
    end
    it 'returns false when any string element does not satisfy block argument which is string size equality' do
      expect(%w[ant bear cat].my_all? { |word| word.length >= 4 }). to eql(false)
    end
    it 'returns false when ther is any string element which has a character in Regexp of passed argument' do
      expect(%w[ant bear cat].my_all?(/t/)). to eql(false)
    end
    it 'returns true when all elements have the same class as the block argument' do
      expect([1, 2i, 3.14].my_all?(Numeric)). to eql(true)
    end
    it "returns false when argument is not given and there is any 'nil' element" do
      expect([nil, true, 99].my_all?). to eql(false)
    end
    it "returns false when argument is not given and there is any 'false' element" do
      expect([false, true, 99].my_all?). to eql(false)
    end

    it 'returns true when argument is not given and array is empty' do
      expect([].my_all?). to eql(true)
    end
  end

  describe 'my_any?' do
    it 'returns true when there is any element in array of strings with size >= 3' do
      expect(%w[ant bear cat].my_any? { |word| word.length >= 3 }).to eql(true)
    end
    it 'returns true when there is any element in array of strings with size >= 4' do
      expect(%w[ant bear cat].my_any? { |word| word.length >= 4 }).to eql(true)
    end
    it 'returns false when there is no element in array of strings having a Regexp character passed as argument' do
      expect(%w[ant bear cat].my_any?(/d/)).to eql(false)
    end
    it 'returns true when there is any element which is of a class passed as a method argument' do
      expect([nil, true, 99].my_any?(Integer)).to eql(true)
    end
    it 'returns true when no argument is given and there is any true element in the array' do
      expect([nil, true, 99].my_any?).to eql(true)
    end
    it 'returns false if array is empty' do
      expect([].my_any?).to eql(false)
    end
  end

  describe 'my_none?' do
    it 'returns true when there is no element in an array of strings with length == 5' do
      expect(%w[ant bear cat].my_none? { |word| word.length == 5 }).to eql(true)
    end
    it 'returns false when there is any element in an array of strings with length >= 4' do
      expect(%w[ant bear cat].my_none? { |word| word.length >= 4 }).to eql(false)
    end
    it 'returns true when there is no element in an array of strings having a Regexp character in argument' do
      expect(%w[ant bear cat].my_none?(/d/)).to eql(true)
    end
    it 'returns false when there is any element in an array which is of the same class as the method argument' do
      expect([1, 3.14, 42].my_none?(Float)).to eql(false)
    end
    it 'returns true when array is empty' do
      expect([].my_none?).to eql(true)
    end
    it 'returns true when no method argument is passed and array has only nil and/or flase' do
      expect([nil, false].my_none?).to eql(true)
    end
    it 'returns false when no method argument is passed and array has any element other than nil and false' do
      expect([nil, false, true].my_none?).to eql(false)
    end
  end

  describe 'my_count' do
    let(:ary) { [] << 1 << 2 << 4 << 2 }
    it 'returns integer counting the number of elements in an array when argument is not given' do
      expect(ary.my_count).to eql(4)
    end
    it 'returns integer counting the number of elements in an array which equals the method argument' do
      expect(ary.my_count(2)).to eql(2)
    end
    it 'returns integer counting the number of elements in an array which  satisfies block argument' do
      expect(ary.my_count(&:even?)).to eql(3)
    end
  end

  describe 'my_map' do
    it 'returns a new array by squaring each element of a give range object' do
      expect((1..4).my_map { |i| i * i }).to eql([1, 4, 9, 16])
    end
    it 'returns a new array of repeated strings with size of the given range object' do
      expect((1..4).my_map { 'cat' }).to eql(%w[cat cat cat cat])
    end
  end

  describe 'my_inject' do
    it 'returns the sum of numbers in a range when :+ operator symbol is passed as an argument' do
      expect((5..10).my_inject(:+)).to eql(45)
    end
    it 'returns the sum value when memo and elements are addition block definition arguments' do
      expect((5..10).my_inject { |sum, n| sum + n }).to eql(45)
    end
    it 'returns the sum of numbers in a range when :* operator symbol is passed as an argument' do
      expect((5..10).my_inject(1, :*)).to eql(151_200)
    end
    it 'returns the product value of array elements and a numeric argument' do
      expect((5..10).my_inject(1) { |product, n| product * n }).to eql(151_200)
    end
    it 'returns the value from an array of strings with longest size' do
      expect(%w[cat sheep bear].my_inject do |memo, word|
               memo.length > word.length ? memo : word
             end).to eql('sheep')
    end
  end
end
