# input (555+(666-222+(666-222+(666-222+(666-222))))*4):  ["555.0"]    :WORKS
# input (5+(2*2*(2*2*(2*2*(2*2*(2*2*(3+3))))))): ["6149.0"]: WORKS
# notes: nested paranthesis work well but adjacent paranthesis fail
#Trial 4+(2+2)+(3+3) = 14 works
#Trial (5+(1+1)+(1+1)) = 9 works


@i = 0
class Array
	def paranthesis_op

		# p x = self.join
		# while (x =~ (/(\([\d\+\*\/\-]+\))/)) && (self.include? "(")
		while self.include? "("
			p x = self.join #=> (2+2)+(3+3)
			p w = x =~ (/(\([\d\.\+\*\/\-]+\))/)  #=>  0
			p y = x.match(/(\([\d\.\+\*\/\-]+\))/) #<MatchData "(2+2)" 1:"(2+2)">
			p $1  # "(2+2)"
			p g = $1.scan(/[\d]+\.?\d*|\+|\*|\/|\-|\(|\)/) #+> ["(", "2", "+", "2", ")"]
			# p g_length = g.length
			# p g_length.class #=> Fixnum
			# p g.class #=> Array
			(0..self.length-1).each do |x|
				if self[x..x+g.length-1] == g
					p "matched"
					@i = x
				end
			end
			# p @i
			# p @i.class #=> 2, fixnum



			#need to find the index where ["(", "2", "+", "2", ")"] starts in self


			# p h = x.index(")") #=> 4 #=> index is problematic with floats
			 self[@i..@i+g.length-1] = self[@i+1..@i+g.length-2].calculate

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



		# while self.include? "("
		# 	p y = self.join #=> (2+2)+(3+3)
		# 	p y.class #=> String
		# 	p x = y.match(/(\([\d\.\+\*\/\-]+\))/)
		# 	p x.class
		# 	i = self.index("x")
		# 	self[i..i+x.length-1] = self[i+1..i+x.length-2].calculate