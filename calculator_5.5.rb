#Directions: be able to 3+4*5/2-0
# operators = ["*", "/", "+", "-"]

#Directions: be able to 3*(5+6-1)-5

class Array
	attr_accessor :op_stack
	attr_accessor :full_stack


	# def set_new_stack
	# 	@new_stack = []
	# 	p @new_stack = self.input.scan(/[\d]+\.?\d*|\+|\*|\/|\-/) #=> ["2", "+", "3", "-", "10", "/", "5", "*", "6"]
	# 	# v = []
	# 	# new_stack.each{|e| e.match(/\*|\//) ? v<<e : e} #+> ["/", "*", "/"]
	# 	# new_stack.each{|e| e.match(/\+|\-/) ? v<<e : e} #+> ["/", "*", "/"]
	# 	# p self.op_stack = v
	# end

	
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
		# p op_stack
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

p "Please input calculations: "
calc_stack = []
input = gets.chomp #=> 2+3-10/5*6
p "Your requested calculation is: #{input}"

calc_stack.full_stack = input.scan(/[\d]+\.?\d*|\+|\*|\/|\-/)
p calc_stack.full_stack





# p stack.calculate #=>["-7.0""]