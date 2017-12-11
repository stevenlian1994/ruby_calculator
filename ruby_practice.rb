class Person
	def initialize(name)
		@name = name
	end
	def name
		p "Hi my name is #{@name}"
	end

end

steven = Person.new("Steven")
steven.name