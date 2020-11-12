module Enumerable
    def my_each
        n = self.length
        n.times do |i|
        self[i] = yield(self[i])
        end
        self
    end
    def my_each_with_index
        n = self.length
        (n).times do |index|
        self[index] = yield(self[index])
        end
        self
    end
    def my_select
        arr = []
        self.my_each do |elem|
            if yield(elem) == true
                arr << elem
            end
        end
        arr
    end
    def my_all
        self.my_each do |elem|
            if yield(elem) == false
                return false
            end
        end
        return true
    end
    def my_any
        self.my_each do |elem|
            if yield(elem) == true
                return true
            end
        end
        return false
    end
    def my_none
        self.my_each do |elem|
            if yield(elem) == true
                return false
            end
        end
        return true
    end
    def my_count
        count = 0
        self.my_each do |elem|
            if yield(elem) == true
                count += 1
            end
        end
        count
    end
    def my_map
        arr = []
        n = self.length
        n.times do |i|
        arr << yield(self[i])
        end
        arr
    end
    def my_inject
        n = self.length
        n.times do |i|
        memo = yield(memo,self[i])
        end
        memo
    end
end
a = [1,2,3,4]
a.my_each {|elem| elem+1}

