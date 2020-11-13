require_relative 'main'

def multiply_els(array)
  array.my_inject { |product, elem| product * elem }
end
a = [1, 2, 3, 4]

puts multiply_els(a)
