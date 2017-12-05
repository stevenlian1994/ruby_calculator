#Trial 4+(2+2)+(3+3) = 14 works
#Trial (5+(1+1)+(1+1)) = 9 works
#Trial (5+(2+2)+(2*(3+3))) = 21 works

class Array
	def exponent
		while self.include? "^"
			i = self.index("^") 
			self[i-1..i+1]= self[i-1].to_f.**(self[i+1].to_f).to_s
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
		@i = 0
		while self.include? "("
			x = self.join #=> (2+2)+(3+3)

			y = x.match(/(\([\d\.\^\+\*\/\-]+\))/) #<MatchData "(2+2)" 1:"(2+2)">
			# $1  #=> first match data "(2+2)"
			g = $1.scan(/[\d]+\.?\d*|\^|\+|\*|\/|\-|\(|\)/) #+> ["(", "2", "+", "2", ")"]

			(0..self.length-1).each do |x|
				if self[x..x+g.length-1] == g
					@i = x
				end
			end
			#need to find the index where ["(", "2", "+", "2", ")"] starts in self
			self[@i..@i+g.length-1] = self[@i+1..@i+g.length-2].calculate
		end
		if self.include? "^"
			self.exponent
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
stack = input.scan(/[\d]+\.?\d*|\^|\+|\*|\/|\-|\(|\)/)
p "array:#{stack}" 
p stack.calculate