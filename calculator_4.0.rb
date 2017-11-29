#Directions: be able to do 14*4.5+3.33333 

class Array
	def multiply
		while self.include? "*"
			i = self.index("*") #=> 3
			product = self[i-1].to_f.*(self[i+1].to_f) #=> 8
			product = product.to_s
			self[i-1..i+1]=product 
		end
		p self
	end	

	def add
		while self.include? "+"
			# find index of operator
			i = self.index("+")
			sum = self[i-1].to_f.+(self[i+1].to_f)
			sum = sum.to_s
			# replace sum with the operation
			self[i-1..i+1] = sum
		end
		p self
	end


	def calculate
		if self.include? "*"
			self.multiply
		end

		if self.include? "+"
			self.add
		end

	end
end

p "Please input calculations: "
input = gets.chomp #=> 14*4.5+3.33333 
p "Your requested calculation is: #{input}"

# p stack = input.split("") #=> ["4", "+", "4", "*", "2"]
p stack = input.scan(/[\d]+\.?\d*|\+|\*/) #=> ["14", "*", "4.5", "+", "3.33333"]



stack.calculate #=>["82684"]