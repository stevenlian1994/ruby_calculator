#STEP 1: method declaration for checking if self is an integer
class String
    def is_i?
       /\A[-+]?\d+\z/ === self
    end
end

# operator = ["*", "+"]
#STEP 2: I want to turn an input string into an array of ints and non-ints
# REQUEST: turn 434h50k10 => [434 "h" 50 "k" 10] REQUEST FULFILLED
# REQUEST: turn 434+50-10 => [434 "+" 50 "-" 10] REQUEST FULFILLED
p "Calculate: "
p input = gets.chomp #=> 434hee50k10 = > ["434", "hee", "50", "k", "10"]
stack = []

#taking input and looping through [rest] seperating [first part(all digits), non-digit, rest]
until input.length == 0
	input = input.partition(/\D+/)

	stack << input[0]
	if input[1] != ""
		stack << input[1]
	end
	input = input[2]
end

#turning all digit strings in array to ints
p stack
p stack2 = stack.map{|e| e.is_i? ? e.to_i : e}



# p input.partition(/\D/) #=> ["434", "h", "50k10"]

# a = input.split("")

# p b = a.map{|x| x.is_i? ? x.to_i : x} #=> [4, 3, 4, "h", 5, 0, "k", 1, 0]

# # p c = a.map{|x| x.is_i? ? stack << x.index : x}
# (0..input.length-1).each do |x|
# 	if a[x].is_i?
# 		stack << x
# 	end
# end

# p stack #=> [0, 1, 2, 4, 5, 7, 8]


# #=>[4, 3, 4, "h", 5, 0, "k", 1, 0]
# #=>[0, 1, 2, 4, 5, 7, 8]





# # p input.split("#{operator[1]}") #=> ["4" "*" "4"]

# # # p input
# # @saved = []
# # (0..operator.length-1).each do |x|
# # 	@saved = input.split("#{operator[x]}")
# # end

# # p @saved
