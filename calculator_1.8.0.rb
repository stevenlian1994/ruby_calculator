# input (555+(666-222+(666-222+(666-222+(666-222))))*4):  ["555.0"]    :WORKS
# input (5+(2*2*(2*2*(2*2*(2*2*(2*2*(3+3))))))): ["6149.0"]: WORKS
# notes: nested paranthesis work well but adjacent paranthesis fail
# (5+(1+1)+(1+1)) : DOESNT WORK

class Array
	def paranthesis_op

		# p x = self.join
		# while (x =~ (/(\([\d\+\*\/\-]+\))/)) && (self.include? "(")
		while self.include? "("
			p x = self.join #=> 5+2+(1+1)
			p g = x =~ (/(\([\d\.\+\*\/\-]+\))/) #=> problematic as well

			p h = x.index(")") #=> 6 #=> index is problematic with floats
			p x[g..h] = self[g+1..h-1].calculate
			p x.to_array
			# x - 5th index
			# self - 5th index 
			
			p "middle"
			# p self = x.scan(/[\d]+\.?\d*|\+|\*|\/|\-|\(|\)/)
			p "end of line"
		end



	end
	def multiply
		while self.include? "*"
			i = self.index("*") 
			self[i-1..i+1]= self[i-1].to_f.*(self[i+1].to_f).to_s
		end
	end	
	def add
		while self.include? "+"
			i = self.index("+")
			self[i-1..i+1] = self[i-1].to_f.+(self[i+1].to_f).to_s
		end
	end
	def divide
		while self.include? "/"
			i = self.index("/")
			self[i-1..i+1] = self[i-1].to_f./(self[i+1].to_f).to_s
		end
	end
	def minus
		while self.include? "-"
			i = self.index("-")
			self[i-1..i+1] = self[i-1].to_f.-(self[i+1].to_f).to_s
		end
	end

	def calculate
		if self.include? "("
			self.paranthesis_op
		end
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
		return self
	end
end

p "User please input calculations: "
input = gets.chomp
p "Your requested calculation is: #{input}"
p stack = input.scan(/[\d]+\.?\d*|\+|\*|\/|\-|\(|\)/)
p stack.calculate