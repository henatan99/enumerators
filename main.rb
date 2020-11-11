module Enumerable
    def my_each                
        n = self.length      
        (n).times do |index|               
        self[index] = yield(self[index])       
        end 
        self
    end
end

a = [1,2,3,4] 

a.my_each {|elem| elem+1}


