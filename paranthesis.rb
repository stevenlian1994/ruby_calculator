#Directions: be able to 4*(3+3)

p "Please input calculations: "
input = gets.chomp 
p "Your requested calculation is: #{input}"

p stack = input.scan(/[\d]+\.?\d*|\+|\*|\/|\-|\(|\)/) #=> ["4", "*", "(", "3", "+", "3", ")"]
@stack2 = []
class Array
	def paranthesis_op
		if self.include? "("
			i = self.index("(")
			j = self.index(")")
			p @stack2 = self[i..j]

		end

	end
end


stack.paranthesis_op
p @stack2

# match(/\([.]*\)/)