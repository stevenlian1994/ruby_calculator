# Trial 1. 3+3 = [9.0] WORKS
# Trial 2. 3+3*5 = [18.0] WORKS
# Trial 3. 5.5/5 = 1.1 WORKS
# Trial 4. -5.5/5 = -1.1 WORKS
# Trial 5. -5.5/5-9 = [-10.1] WORKS
# paranthesis and negatives
# Trial 6. (2+2)+(3*3) =  [13.0] WORKS
# Trial 6.5 (2+(3*3/2)) = ["6.5"] WORKS
# Trial 7 (-2+(3*3/2)) = ["2.5"] WORKS
# Trial 8 (-2-(-3*-3/-2)) = ["2.5"] WORKS
# exponents
# model: 3^(3 or 3.5 or -4 or 2+2) 
# Trial 9 3^3 = 27
# Trial 10 3^-2 = 1/9
# Trial 11 3^(1+1) = 9
# Trial 12 3^(1-2) = 

class Array
	def exponent
		i = self.index("^") 
		# model: 3^(3 or 3.5 or -4 or 2+2) 
		# if () is a singular number do the exponent, else do the calculation then exponent
		self[i-1..i+1]= self[i-1].to_f.**(self[i+1].to_f).to_s
	end	

	def negative 
		i = self.index("&")
		self[i..i+1] = (0-self[i+1].to_f).to_s
	end

	def multiply
		i = self.index("*")
		self[i-1..i+1] = (self[i-1].to_f*self[i+1].to_f).to_s
	end
	def divide
		i = self.index("/")
		self[i-1..i+1] = (self[i-1].to_f/self[i+1].to_f).to_s
	end
	def add
		i = self.index("+")
		self[i-1..i+1] = (self[i-1].to_f+self[i+1].to_f).to_s
	end
	def minus
		i = self.index("-")
		self[i-1..i+1] = (self[i-1].to_f-self[i+1].to_f).to_s
	end

	def calculate

		while self.include? "&"
			self.negative
		end

		@i = 0

		while self.include? "("
			#turn array into string
			x = self.join #=> (2+2)+(3+3)
			#compare string to regexp
			p x.match(/(\([\d\.\^\+\*\/\-]+\))/) #<MatchData "(2+2)" 1:"(2+2)">
			# $1  #=> first match data "(2+2)"
			g = $1.scan(/\-?[\d]+\.?\d*|\^|\+|\*|\/|\-|\(|\)/) #+> ["(", "2", "+", "2", ")"]

			(0..self.length-1).each do |x|
				self[x..x+g.length-1]
				g
				if self[x..x+g.length-1] == g
					@i = x
				end
			end
			#need to find the index where ["(", "2", "+", "2", ")"] starts in self
			self[@i..@i+g.length-1] = self[@i+1..@i+g.length-2].calculate
		end

		while self.include? "^"
			self.exponent
		end

		while self.include? "*"
			self.multiply
		end
		while self.include? "/"
			self.divide
		end
		while self.include? "+"
			self.add
		end
		while self.include? "-"
			self.minus
		end
		return self
	end

end






p "Calculation input: "

input = gets.chomp
p input = input.scan(/\d+\.?\d*|\+|\-|\*|\/|\&|\(|\)|\^/)
p input.calculate
