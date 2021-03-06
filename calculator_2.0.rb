#Directions: be able to do 4+4*2+3*5*5+2 = 89

class Array
	def multiply
		while self.include? "*"
			i = self.index("*") #=> 3
			product = self[i-1].to_i.*(self[i+1].to_i) #=> 8
			product = product.to_s
			self[i-1..i+1]=product 
		end
		p self
	end	

	def add
		while self.include? "+"
			# find index of operator
			i = self.index("+")
			sum = self[i-1].to_i.+(self[i+1].to_i)
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
input = gets.chomp #=> 4+4*2
p "Your requested calculation is: #{input}"
# p input.class #=> String
p stack = input.split("") #=> ["4", "+", "4", "*", "2"]

stack.calculate

