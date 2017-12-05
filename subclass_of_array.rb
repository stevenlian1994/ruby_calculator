# class Array

# end

# class Take_arg < Array

# 	def arg(n)
# 		p n+1
# 	end


# end

# arr_new = Array.new 

# # arr_new << 3
# # arr_new << 4
# # p arr_new #=> [3, 4]

# ta_new = Take_arg.new


# ta_new << 4
# ta_new << 5
# p ta_new #=> [4, 5]

# ta_new.arg(5)


# p "User please input calculations: "
# input = gets.chomp
# p "Your requested calculation is: #{input}"
# p stack = input.scan(/[\d]+\.?\d*|\+|\*|\/|\-|\(|\)/)
# p stack.calculate(stack)

a1 = [1,2,3,4]
a2 = [2,3]

p a1.index(a2)