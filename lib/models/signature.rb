class Signature
	attr_accessor :name, :literal, :regex
	
	def initialize data
		@name    = data[:name]
		@literal = data[:literal]
		@regex   = data[:regex]
	end

end
