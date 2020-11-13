require 'main'

def multiply_els(array)
  array.my_inject { |product, elem| product * elem }
end
