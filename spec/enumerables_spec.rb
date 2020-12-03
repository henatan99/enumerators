#spec/enumerables_spec.rb
require './enumerable'  #=> add this

describe Enumerable do 
    describe "my_each" do         
        it "returns " do             
            expect([1, 2, 3].each {|item| item+1}). to eql([1, 2, 3])
        end         
    end 

    describe "my_each_with_index" do 
        it "returns a Hash element from given list of string elements and block argument of hash item and index" do 
            hash = Hash.new
            expect(%w(cat dog wombat).my_each_with_index { |item, index|
            hash[item] = index
            }).to eql(["cat", "dog", "wombat"])
        end 
        it "returns the new array of numeric elements by applying block definition to the item and index arguments" do 
            arr = Array.new
            expect([1, 2, 3].my_each_with_index { |item, index|
            arr << item + index
            }).to eql([1, 2, 3])
        end        
    end 

    describe "my_select" do 
        it "returns a new array of elements by selecting elements from a range list of numeric values which sataisfies the block arguments" do
            expect((1..10).my_select { |i|  i % 3 == 0 }).to eql([3, 6, 9])
        end 
        it "retruns a new array of elements by selecting even numbers from an array of numerics" do
            expect([1,2,3,4,5].my_select { |num|  num.even?  }).to eql([2, 4])
        end
        it "retruns a new array of elements by selecting even numbers from an array of numerics" do
            expect([1,2,3,4,5].my_select { |num|  num.odd?  }).to eql([1, 3, 5])
        end
        it "retruns a new array of elements by selecting elements with the same class when argument is a class" do
            expect([1,'a','b',4,5].my_select { |num|  num.is_a?(Numeric)}).to eql([1, 4, 5])
        end
        it "returns a new array of symbols which satisfies a block argument from an array of symbol elements" do 
            expect([:foo, :bar].my_select { |x| x == :foo }).to eql([:foo])
        end 
    end

    describe "my_all?" do 
        it "returns true when all string elements satisfy block argument which is string size equality" do             
            expect(%w[ant bear cat].my_all? { |word| word.length >= 3 }). to eql(true)
        end 
        it "returns false when any string element does not satisfy block argument which is string size equality" do             
            expect(%w[ant bear cat].my_all? { |word| word.length >= 4 }). to eql(false)
        end
        it "returns false when any string element does not have the block argument which is a character in regular expression" do             
            expect(%w[ant bear cat].my_all?(/t/)). to eql(false)
        end
        it "returns true when all elements have the same class as the block argument" do             
            expect([1, 2i, 3.14].my_all?(Numeric)). to eql(true)
        end
        it "returns false when argument is not given and there is any 'nil' element" do             
            expect([nil, true, 99].my_all?). to eql(false)
        end
        it "returns false when argument is not given and there is any 'false' element" do             
            expect([false, true, 99].my_all?). to eql(false)
        end

        it "returns true when argument is not given and array is empty" do             
            expect([].my_all?). to eql(true)
        end
    end 

    describe "my_any?" do 
        it "returns true when there is any element in array of strings which satisfies strig size equality block argument" do
            expect(%w[ant bear cat].my_any? { |word| word.length >= 3 }).to eql(true)            
        end 
        it "returns true when there is any element in array of strings which satisfies strig size equality block argument" do
            expect(%w[ant bear cat].my_any? { |word| word.length >= 4 }).to eql(true)
        end 
        it "returns false when there is any element in array of strings which has a character given in method argument as in a Regexp" do 
            expect(%w[ant bear cat].my_any?(/d/)).to eql(false)
        end
        it "returns true when there is any element which is of a class passed as a method argument" do 
            expect([nil, true, 99].my_any?(Integer)).to eql(true)
        end
        it "returns true when no argument is given and there is any true element in the array" do 
            expect([nil, true, 99].my_any?).to eql(true)
        end
        it "returns false if array is empty" do 
            expect([].my_any?).to eql(false)
        end 
    end

    describe "my_none?" do 
        it "returns true when there is no element in an array of strings which satsifies string size equality block argument" do
            expect(%w{ant bear cat}.my_none? { |word| word.length == 5 }).to eql(true)
        end
        it "returns false when there is any element in an array of strings which satsifies string size equality block argument" do
            expect(%w{ant bear cat}.my_none? { |word| word.length >= 4 }).to eql(false)
        end
        it "returns true when there is no element in an array of strings which has a character given in an argument as a Regexp" do
            expect(%w{ant bear cat}.my_none?(/d/)).to eql(true)
        end
        it "returns false when there is any element in an array which is of the same class as the method argument" do
            expect([1, 3.14, 42].my_none?(Float)).to eql(false)
        end
        it "returns true when array is empty" do
            expect([].my_none?).to eql(true)
        end
        it "returns true when no method argument is passed and array has only nil and/or flase" do
            expect([nil, false].my_none?).to eql(true)
        end
        it "returns false when no method argument is passed and array has any element other than nil and false" do
            expect([nil, false, true].my_none?).to eql(false)
        end        
    end

    describe "my_count" do 
        let(:ary) {Array.new << 1 << 2 << 4 << 2}
        it "returns integer counting the number of elements in an array when argument is not given" do
            expect(ary.my_count).to eql(4)
        end 
        it "returns integer counting the number of elements in an array which equals the method argument" do
            expect(ary.my_count(2)).to eql(2)
        end 
        it "returns integer counting the number of elements in an array which  satisfies block argument" do
            expect(ary.my_count{ |x| x%2==0 }).to eql(3)
        end 
    end

    describe "my_map" do 
        it "returns a new array when a range object is given and applies block definition to each element of the given range and appends to the new array" do
            expect((1..4).my_map { |i| i*i }).to eql([1, 4, 9, 16])
        end 
        it "returns a new array of repeated strings when a range object is given and a string block argument is passed" do
            expect((1..4).my_map { "cat" }).to eql(["cat", "cat", "cat", "cat"])
        end
    end

    describe "my_inject" do 
        it "returns the sum of numbers in a range when range is given and a plus operator symbol is passed as a method argument" do
            expect((5..10).my_inject(:+)).to eql(45)
        end
        it "returns the sum value from block definition which accepts a memo and each element as arguments when a range is given" do
            expect((5..10).my_inject { |sum, n| sum + n }).to eql(45)
        end
        it "returns the product of numbers in a range and a passed by method argument when a range is given and methods arguments are a number and a product operator symbol" do
            expect((5..10).my_inject(1, :*)).to eql(151200)
        end
        it "returns the product value from block definition which accepts a memo and each element as arguments when a range is given " do
            expect((5..10).my_inject(1) { |product, n| product * n }).to eql(151200)
        end
        it "returns the value from an array of strings which satisfies the condisional statement in block definition tking memo and each elements as arguments" do
            expect(%w{ cat sheep bear }.my_inject {|memo, word|
                memo.length > word.length ? memo : word
        }).to eql("sheep")
        end
    end

end 
