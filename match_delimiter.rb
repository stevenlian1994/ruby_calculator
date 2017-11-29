
p "Please input calculations: "
input = gets.chomp #=> 14+14*12
p "Your requested calculation is: #{input}"

# p stack = input.split("") #=> 
p stack = input.scan(/[\d]+|\+|\*|/) #=>["14", "+", "14", "*", "12"]
# 'a; b; c;'.scan(/[^;]*;/)
# 'a; b; c;'.scan(/.*?;/)

# stack.calculate