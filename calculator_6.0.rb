#Directions: be able to 3*(5+6)-5 && 





class Array
	attr_accessor :op_stack
	def paranthesis_op

			i = self.index("(")
			j = self.index(")")
			p array = self[i+1..j-1]
			self[i..j] = array.calculate		

	end

	def multiply
			i = self.index("*") #=> 3
			product = self[i-1].to_f.*(self[i+1].to_f) #=> 8
			product = product.to_s
			self[i-1..i+1]=product 
	end	
	def divide
			i = self.index("/")
			quotient = self[i-1].to_f./(self[i+1].to_f)
			quotient = quotient.to_s
			# replace quotient with the operation
			self[i-1..i+1] = quotient
	end
	def minus
			i = self.index("-")
			difference = self[i-1].to_f.-(self[i+1].to_f)
			difference = difference.to_s
			# replace quotient with the operation
			self[i-1..i+1] = difference
	end
	def plus
			i = self.index("+")
			sum = self[i-1].to_f.+(self[i+1].to_f)
			sum = sum.to_s
			# replace quotient with the operation
			self[i-1..i+1] = sum
	end

	def calculate
		if self.include? "("
			self.paranthesis_op
			p self
		end
		p op_stack
		while op_stack.length != 0
			case op_stack[0]
			when "/"
				self.divide
			when "*"
				self.multiply
			when "-"
				self.minus
			when "+"
				self.plus
			end
			op_stack.delete_at(0)
		end
		return self
	end
end

# STEP 1: program asks for calculations
p "Please input calculations: "
input = gets.chomp #=> 2+3-10/5*6
p "Your requested calculation is: #{input}"

# STEP 2: program breaks down calculation into single parts and then orders a stack of operations
p stack = input.scan(/[\d]+\.?\d*|\+|\*|\/|\-|\(|\)/) #=> ["4", "*", "(", "3", "+", "3", ")"]
v = []
stack.each{|e| e.match(/\*|\//) ? v<<e : e} #multiply and divide goes to front of the list
stack.each{|e| e.match(/\+|\-/) ? v<<e : e} #then add and minus
p stack.op_stack = v # save it to class variable: op_stack


p stack.calculate 






