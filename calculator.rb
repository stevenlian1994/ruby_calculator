# def calculate(x, operator, y)

# end

p "Please input calculations: "
input = gets.chomp #=> 4*4
p "Your requested calculation is: #{input}"
# p input.class #=> String
b = input.split("") #=> ["4" "*" "4"]

 stack = %w(+ - * /)

if input.include? "*"
	i = input.index("*") #=> 1
	p product = input[i-1].to_i.*(input[i+1].to_i) #=> 16
	p product = product.to_s

	p input[i-1,i+2] = product
	input = input.to_i
	# input << product
	# input << product 
end
p input

if input.include? "+"
	i = input.index("+")
	p sum = input[i-1].to_i.+(input[i+1].to_i)
	p sum = sum.to_s

	p input[i-1,i+2] = sum
	input = input.to_i
end
p input


# stack.delete("*")
# p stack
# p input.