module Enumerable
    def my_each
      return to_enum(:my_each) unless block_given?
      n = length
      arr = *self
      n.times do |i|
        arr[i] = yield(arr[i])
      end
      self
    end
    def my_each_with_index
      return to_enum(:my_each) unless block_given?
      n = length
      n.times do |index|
        yield(self[index], index)
      end
      self
    end
    def my_select
      arr = []
      my_each do |elem|
        arr << elem if yield(elem) == true
      end
      arr
    end
    def my_all?(pattern = nil)
      if block_given?
        my_each do |elem|
          return false if yield(elem) == false
        end
      elsif !pattern.nil?
        my_each do |elem|
          return false unless (pattern == elem) || (pattern.is_a?(Class) && elem.is_a?(pattern)) || (pattern.is_a?(Regexp) && pattern.match?(elem.to_s))
        end
      end
      true
    end
    def my_any?(pattern = nil)
      if block_given?
        my_each do |elem|
          return true if yield(elem) == true
        end
      elsif !pattern.nil?
        my_each do |elem|
          return true if (pattern == elem) || (pattern.is_a?(Class) && elem.is_a?(pattern)) || (pattern.is_a?(Regexp) && pattern.match?(elem.to_s))
        end
      end
      false
    end
    def my_none?(pattern = nil)
      if !block_given? && pattern.nil?
        my_each do |elem|
          return false if !elem.nil? && elem != false
        end
        true
      end
      if block_given?
        my_each do |elem|
          return false if yield(elem) == true
        end
      elsif !pattern.nil?
        my_each do |elem|
          return false if (pattern == elem) || (pattern.is_a?(Class) && elem.is_a?(pattern)) || (pattern.is_a?(Regexp) && pattern.match?(elem.to_s))
        end
      end
      true
    end
    def my_count(obj = nil)
      count_item = size
      if block_given?
        my_each do |elem|
          count_item += 1 if yield(elem) == true
        end
      elsif !obj.nil?
        count_item = 0
        my_each do |elem|
          count_item += 1 if elem == obj
        end
      end
      count_item
    end
    def my_map(proc = nil)
      arr = *self
      n = arr.length
      unless proc.nil?
        n.times do |i|
          arr[i] = proc.call arr[i]
        end
        return arr
      end
      return to_enum(:my_each) unless block_given?
      n.times do |i|
        arr[i] = yield(self[i])
      end
      arr
    end
    def my_inject(*arg)
      arr = to_a
      n = arr.size
      if !arg.empty? && !block_given?
        if arg.size == 2
          memo = arg[0]
          sym = arg[1].to_sym
          n.times do |i|
            memo = memo.send(sym, arr[i])
          end
        else
          memo = arr[0]
          sym = arg[0]
          (n - 1).times do |i|
            memo = memo.send(sym, arr[i + 1])
          end
        end
        return memo
      end
      return to_enum(:my_each) unless block_given?
      if arg.size == 1
        memo = arg[0]
        n.times do |i|
          memo = yield(memo, arr[i])
        end
      else
        memo = arr[0]
        (n - 1).times do |i|
          memo = yield(memo, arr[i + 1])
        end
      end
      memo
    end
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  