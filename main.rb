# rubocop: disable Metrics/ModuleLength
# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
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
    else
      my_each do |elem|
        return false unless elem.is_a?(pattern) || pattern.to_s.match?(elem.to_s) || (pattern.nil? && elem.nil?)
      end
    end
    true
  end

  def my_any?(pattern = nil)
    if block_given?
      my_each do |elem|
        return true if yield(elem) == true
      end
    else
      my_each do |elem|
        return true if elem.is_a?(pattern) || pattern.to_s.match?(elem.to_s) || (pattern.nil? && elem.nil?)
      end
    end
    false
  end

  def my_none?(pattern = nil)
    if block_given?
      my_each do |elem|
        return false if yield(elem) == true
      end
    else
      my_each do |elem|
        return false if elem.is_a?(pattern) || pattern.to_s.match?(elem.to_s) || (pattern.nil? && elem.nil?)
      end
    end
    true
  end

  def my_count(obj = nil)
    count = 0
    if block_given?
      my_each do |elem|
        count += 1 if yield(elem) == true
      end
    else
      my_each do |elem|
        count += 1 if elem == obj
      end
    end
    count
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
      arr << yield(self[i])
    end
    arr
  end

  def my_inject(*arg)
    n = length
    if !arg.empty? && arg.any?.is_a?(Symbol)
      if arg.size == 2
        memo = arg[0]
        sym = arg[1]
      else
        memo = self[0]
        sym = arg[0]
      end
      n.times do |i|
        memo = memo.send(sym, self[i])
      end
      return memo
    end
    return to_enum(:my_each) unless block_given?

    memo = if arg.size == 1
             arg[0]
           else
             self[i]
           end
    n.times do |i|
      memo = yield(memo, self[i])
    end
    memo
  end
end
