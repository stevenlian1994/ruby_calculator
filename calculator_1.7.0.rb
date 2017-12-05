class Array
	def paranthesis_op
			i = self.rindex("(")
			j = self.index(")")
			self[i..j] = self[i+1..j-1].calculate
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
		while self.include? "("
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