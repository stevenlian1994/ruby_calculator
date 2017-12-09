#Trial 4+(2+2)+(3+3) = 14 works
#Trial (5+(1+1)+(1+1)) = 9 works
#Trial (5+(2+2)+(2*(3+3))) = 21 works
#Trial (5+5)^2+(2+(2*2)^3) = ["166.0"] works
#Trial (2+2^(2*2)) = ["18.0"] works
#Trial (2/2^(2.5)) = ["0.35355339059327373"]
#Trial -3+2 = -1 works
#Trial 3^-1 = 1/3 works
#Trial 2^(1+1) works but 2^(2-4) doesnt work, still doesnt work
#Trial 2^(4) works but 2^(-4) doesnt work , corrected it with scan regexp
#Trial 2^(5-2) still doesnt work 
#Trial 2-5 works
#Trial -5-2 works
#Trial (-5-2) doesnt work



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
		while self.join.match(/\&/)
			#turn array into string
			x = self.join
			#compare string to regexp, match the \&\d
			x.match(/(\&\d\.?\d*)/) #<MatchData "(2+2)" 1:"(2+2)">
			# $1  #=> first match data "(2+2)"
			$1
			v = "-#{$1[1..$1.length-1]}"
			# g = $1.scan(/\-?[\d]+\.?\d*|\^|\+|\*|\/|\-|\(|\)/) #+> ["(", "2", "+", "2", ")"]
			self[self.index($1)] = v  
			# p self #=> ["-3", "-", "4"]
		end

		@i = 0
		while self.include? "("
			#turn array into string
			p x = self.join #=> (2+2)+(3+3)
			#compare string to regexp
			p x.match(/(\([\d\.\^\+\*\/\-]+\))/) #<MatchData "(2+2)" 1:"(2+2)">
			# $1  #=> first match data "(2+2)"
			p g = $1.scan(/\-?[\d]+\.?\d*|\^|\+|\*|\/|\-|\(|\)/) #+> ["(", "2", "+", "2", ")"]

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
stack = input.scan(/\&?[\d]+\.?\d*|\^|\+|\*|\/|\-|\(|\)/)
p "array:#{stack}" 
p stack.calculate