# input (555+(666-222+(666-222+(666-222+(666-222))))*4):  ["555.0"]    :WORKS
# input (5+(2*2*(2*2*(2*2*(2*2*(2*2*(3+3))))))): ["6149.0"]: WORKS
# notes: nested paranthesis work well but adjacent paranthesis fail
# (5+(1+1)+(1+1)) : DOESNT WORK

# s = "(5+(1+1)+(1+2))"
p s = ["(", "5", "+", "(", "1", "+", "1", ")", ")"]
p s.join
p s

# s =~ (/([\d\+\*\/\-]+\d)/)

# p x = s =~ (/([\d\+\*\/\-]+\d)/)
# p x
# p x.class
# # p x+3
# p g = self =~ (/([\d\+\*\/\-]+\d)/)


# self =~ (/([\d\+\*\/\-]+\d)/)