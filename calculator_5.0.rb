#Directions: be able to do 2+3-10/5*6

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

	def divide
		while self.include? "/"
			# find index of operator
			i = self.index("/")
			quotient = self[i-1].to_f./(self[i+1].to_f)
			quotient = quotient.to_s
			# replace quotient with the operation
			self[i-1..i+1] = quotient
		end
		p self
	end

	def minus
		while self.include? "-"
			# find index of operator
			i = self.index("-")
			difference = self[i-1].to_f.-(self[i+1].to_f)
			difference = difference.to_s
			# replace difference with the operation
			self[i-1..i+1] = difference
		end
		p self
	end


	def calculate
		if self.include? "/"
			self.divide
		end

		if self.include? "*"
			self.multiply
		end


		if self.include? "+"
			self.add
		end

		if self.include? "-"
			self.minus
		end

	end
end

p "Please input calculations: "
input = gets.chomp #=> 2+3-10/5*6
p "Your requested calculation is: #{input}"

p stack = input.scan(/[\d]+\.?\d*|\+|\*|\/|\-/) #=> ["2", "+", "3", "-", "10", "/", "5", "*", "6"]



stack.calculate #=>["-7.0""]